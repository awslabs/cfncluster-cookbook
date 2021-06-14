# frozen_string_literal: true

name 'aws-parallelcluster'
maintainer 'Amazon Web Services'
maintainer_email ''
license 'Apache-2.0'
description 'Installs/Configures AWS ParallelCluster'
long_description 'Installs/Configures AWS ParallelCluster'
issues_url 'https://github.com/aws/aws-parallelcluster-cookbook/issues'
source_url 'https://github.com/aws/aws-parallelcluster-cookbook'
chef_version '16.13.16'
version '2.11.0'

supports 'amazon', '>= 2'
supports 'centos', '>= 7'
supports 'ubuntu', '>= 18.04'

depends 'apt', '~> 7.4.0'
depends 'iptables', '~> 8.0.0'
depends 'line', '~> 4.0.1'
depends 'nfs', '~> 2.6.4'
depends 'openssh', '~> 2.9.1'
depends 'pyenv', '~> 3.4.2'
depends 'selinux', '~> 3.1.1'
depends 'ulimit', '~> 1.1.1'
depends 'yum', '~> 6.1.1'
depends 'yum-epel', '~> 4.1.2'
