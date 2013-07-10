name             'redisio'
maintainer       'Brian Bianco, Andrew Gross'
maintainer_email 'brian.bianco@gmail.com, andrew.w.gross@gmail.com'
license          'Apache 2.0'
description      'Installs/Configures redis'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version "2.0.3"
%w[ debian ubuntu centos redhat fedora scientific suse amazon].each do |os|
  supports os
end

depends "ulimit", ">= 0.1.2"
depends "sysctl"
