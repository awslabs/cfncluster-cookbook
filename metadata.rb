name 'aws-parallelcluster'
maintainer 'Amazon Web Services'
maintainer_email ''
license 'Apache-2.0'
description 'Installs/Configures AWS ParallelCluster'
long_description 'Installs/Configures AWS ParallelCluster'
issues_url 'https://github.com/aws/aws-parallelcluster-cookbook/issues'
source_url 'https://github.com/aws/aws-parallelcluster-cookbook'
chef_version '14.2.0'
version '2.1.0'

supports 'amazon'
supports 'centos', '= 6'
supports 'centos', '= 7'
supports 'ubuntu', '= 14.04'
supports 'ubuntu', '= 16.04'

depends 'build-essential', '~> 8.1.1'
depends 'poise-python', '~> 1.7.0'
depends 'tar', '~> 2.1.1'
depends 'selinux', '~> 2.1.0'
depends 'nfs', '~> 2.5.1'
depends 'sysctl', '~> 1.0.5'
depends 'yum', '~> 5.1.0'
depends 'yum-epel', '~> 3.1.0'
depends 'openssh', '~> 2.6.3'
depends 'apt', '~> 7.0.0'
depends 'hostname', '~> 0.4.2'
depends 'line', '~> 1.0.6'
