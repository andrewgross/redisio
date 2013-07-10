# Attributes relating to the installation of Redis

user = 'redis'
group = 'redis'

build_packages = ['tar', 'make', 'automake', 'gcc']

case node['platform']
when 'ubuntu','debian'
  shell = '/bin/false'
  homedir = '/var/lib/redis'
  # Change the default build packages for debian based systems
  build_packages = ['tar', 'build-essential']
when 'centos','redhat','scientific','amazon','suse'
  shell = '/bin/sh'
  homedir = '/var/lib/redis'
when 'fedora'
  shell = '/bin/sh'
  homedir = '/home'
  # This is necessary because selinux by default prevents the homedir from
  # being managed in /var/lib/
else
  shell = '/bin/sh'
  homedir = '/redis'
end

default['redisio']['build_packages'] = build_packages

# Set VM Overcommit Memory for Redis
default['sysctl']['vm']['overcommit_memory'] = 1
default['sysctl']['vm']['swappiness'] = 0

# Tarball and download related defaults
default['redisio']['mirror'] = "https://redis.googlecode.com/files"
default['redisio']['base_name'] = 'redis-'
default['redisio']['artifact_type'] = 'tar.gz'
default['redisio']['version'] = '2.6.12'
default['redisio']['sha256_checksum'] = '268582de99798d5069c2a0cad80632d7251ddede8f1b7133f3bc3d05c60b4c12'
default['redisio']['sha1_checksum'] = '4215ff7cb718284e29910947ac9894d0679f2299'
default['redisio']['download_dir'] = Chef::Config[:file_cache_path]

default['redisio']['safe_install'] = true
default['redisio']['job_control'] = 'initd'
default['redisio']['systemuser'] = true
default['redisio']['ulimit'] = '0'

# Default Redis installation Settings
default['redisio']['user'] = user
default['redisio']['group'] = group
default['redisio']['homedir'] = homedir
default['redisio']['shell'] = shell
default['redisio']['configdir'] = '/etc/redis'
default['redisio']['logdir'] = '/var/log/redis'