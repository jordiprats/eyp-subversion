class subversion::service inherits subversion {

  #
  validate_bool($subversion::manage_docker_service)
  validate_bool($subversion::manage_service)
  validate_bool($subversion::service_enable)

  validate_re($subversion::service_ensure, [ '^running$', '^stopped$' ], "Not a valid daemon status: ${subversion::service_ensure}")

  $is_docker_container_var=getvar('::eyp_docker_iscontainer')
  $is_docker_container=str2bool($is_docker_container_var)

  if( $is_docker_container==false or
      $subversion::manage_docker_service)
  {
    if($subversion::manage_service)
    {
      #service or exec here
    }
  }
}
