name 'cfncluster'
maintainer 'Dougal Ballantyne'
maintainer_email 'dougalb@amazon.com'
license 'Apache License 2.0'
description 'Installs/Configures cfncluster'
long_description 'Installs/Configures cfncluster'
issues_url 'https://github.com/awslabs/cfncluster-cookbook/issues'
source_url 'https://github.com/awslabs/cfncluster-cookbook'
version '1.3.2'

depends 'build-essential', '~> 8.0.2'
depends 'poise-python', '~> 1.6.0'
depends 'tar', '~> 2.0.0'
depends 'selinux', '~> 2.0.0'
depends 'nfs', '~> 2.4.1'
depends 'sysctl', '~> 0.10.1'
depends 'yum', '~> 5.0.1'
depends 'yum-epel', '~> 2.1.1'
depends 'openssh', '~> 2.4.1'
depends 'apt', '~> 6.1.0'
depends 'hostname', '~> 0.4.2'
depends 'line', '~> 0.6.3'
