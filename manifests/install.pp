# == Class: subversion
#
# === subversion::install documentation
#
class subversion::install inherits subversion {

  if($subversion::manage_package)
  {
    package { $subversion::params::package_name:
     ensure => $subversion::package_ensure,
    }

    group { 'svnserve':
      ensure => present,
      gid    => $subversion::svnserve_user_uid,
    }

    user { 'svnserve':
      ensure     => present,
      shell      => $subversion::svnserve_user_shell,
      uid        => $subversion::svnserve_user_uid,
      gid        => $subversion::svnserve_user,
      managehome => true,
      home       => $subversion::svnserve_user_home,
      require    => Group[$subversion::svnserve_user],
    }
  }

}
