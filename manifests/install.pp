# == Class: subversion
#
# === subversion::install documentation
#
class subversion::install inherits subversion {

  if($subversion::manage_package)
  {
    # package here, for example: 
    #package { $subversion::params::package_name:
    #  ensure => $subversion::package_ensure,
    #}
  }

}
