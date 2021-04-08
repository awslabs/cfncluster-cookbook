# frozen_string_literal: true

#
# Cookbook Name:: aws-parallelcluster
# Recipe:: finalize
#
# Copyright 2019 Amazon.com, Inc. or its affiliates. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License"). You may not use this file except in compliance with the
# License. A copy of the License is located at
#
# http://aws.amazon.com/apache2.0/
#
# or in the "LICENSE.txt" file accompanying this file. This file is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES
# OR CONDITIONS OF ANY KIND, express or implied. See the License for the specific language governing permissions and
# limitations under the License.

# Restart supervisord
service "supervisord" do
  supports restart: true
  action %i[enable start]
end

case node['cluster']['node_type']
when 'MasterServer'
  include_recipe 'aws-parallelcluster::head_node_slurm_finalize' if node['cluster']['scheduler'] == 'slurm'
when 'ComputeFleet'
  if node['cluster']['scheduler'] == 'slurm'
    include_recipe 'aws-parallelcluster::compute_slurm_finalize'
  end
end
