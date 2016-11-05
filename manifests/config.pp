# == Class: subversion
#
# === subversion::config documentation
#
class subversion::config inherits subversion {

  if($subversion::params::sysconfig_file!=undef)
  {
    file { $subversion::params::sysconfig_file:
      ensure => 'present',
      owner => 'root',
      group => 'root',
      mode => '0640',
      content => template("${module_name}/sysconfig/${subversion::params::sysconfig_template}")
    }
  }

  exec { "mkdir p subversion ${subversion::datadir}":
    command => "mkdir -p ${subversion::datadir}",
    creates => $subversion::datadir,
  }

  file { $datadir:
    ensure  => 'directory',
    owner   => $subversion::svnserve_user,
    group   => $subversion::svnserve_user,
    mode    => '0755',
    require => Exec["mkdir p subversion ${subversion::datadir}"],
  }aa

}
