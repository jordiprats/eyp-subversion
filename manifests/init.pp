# == Class: subversion
#
# === subversion documentation
#
class subversion(
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
