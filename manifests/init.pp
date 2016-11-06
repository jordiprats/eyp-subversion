# == Class: subversion
#
# === subversion documentation
#
class subversion(
                  $svnserve_user_shell   = undef,
                  $svnserve_user_uid     = '556',
                  $svnserve_user_home    = undef,
                  $svnserve_user         = 'svnserve',
                  $datadir               = '/var/svn',
                  $manage_package        = true,
                  $package_ensure        = 'installed',
                  $manage_service        = true,
                  $manage_docker_service = true,
                  $service_ensure        = 'running',
                  $service_enable        = true,
                ) inherits subversion::params{

  class { '::subversion::install': } ->
  class { '::subversion::config': } ~>
  class { '::subversion::service': } ->
  Class['::subversion']

}
