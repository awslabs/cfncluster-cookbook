#
# Cookbook Name:: cfncluster
# Recipe:: _update_packages
#
# Copyright 2013-2017 Amazon.com, Inc. or its affiliates. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License"). You may not use this file except in compliance with the
# License. A copy of the License is located at
#
# http://aws.amazon.com/apache2.0/
#
# or in the "LICENSE.txt" file accompanying this file. This file is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES
# OR CONDITIONS OF ANY KIND, express or implied. See the License for the specific language governing permissions and
# limitations under the License.

case node['platform_family']
when 'rhel'
  execute 'yum-update' do
    command "yum -y update && package-cleanup -y --oldkernels --count=1"
  end
when 'debian'
  execute 'apt-update' do
    command "apt-get update"
  end
  execute 'apt-upgrade' do
    command "DEBIAN_FRONTEND=noninteractive apt-get -y -o Dpkg::Options::=\"--force-confdef\" -o Dpkg::Options::=\"--force-confold\" upgrade && apt-get autoremove"
  end
end

# Reboot after packages update
if !tagged?('rebooted') && node['cfncluster']['update_packages']['reboot'] == 'true'
  # On Ubuntu, the /tmp folder is erased by default after a reboot and its lifecycle is managed
  # by different tools, depending on the Ubuntu version
  if node['platform'] == 'ubuntu'
    if node['platform_version'] == "16.04"
      file '/etc/tmpfiles.d/tmp.conf' do
        content 'd /tmp 1777 root root 1d'
      end
    end
    if node['platform_version'] == "14.04"
      execute 'sed' do
        command "sed -i s/#TMPTIME=0/TMPTIME=1/g /etc/default/rcS"
      end
    end
  end

  tag('rebooted')
  reboot 'now' do
    action :reboot_now
    delay_mins 1
    reason 'Cannot continue Chef run without a reboot after packages update.'
  end
end

# Remove the configuration to keep the /tmp folder on Ubuntu after a reboot
if tagged?('rebooted')
  if node['platform'] == 'ubuntu'
    if node['platform_version'] == "16.04"
      file '/etc/tmpfiles.d/tmp.conf' do
        action :delete
        only_if { File.exist? '/etc/tmpfiles.d/tmp.conf' }
      end
    end
    if node['platform_version'] == "14.04"
      execute 'sed' do
        command "sed -i s/TMPTIME=1/#TMPTIME=0/g /etc/default/rcS"
      end
    end
  end
end
