# define ${PROJECT_NAME}_CFG_EXTRAS_FILE variable
# This must be called *after* the call to catkin_package()
# if CLEAR is passed as an argument, write to file to 
# ensure it has been cleared. 
# If the catkin_package() call does *not* contain a CFG_EXTRAS
# parameter, you should pass CLEAR
#===========================================================
macro( set_cfg_extras_file ) 
  set( ${PROJECT_NAME}_CFG_EXTRAS_FILE "${CATKIN_DEVEL_PREFIX}/${CATKIN_PACKAGE_SHARE_DESTINATION}/cmake/${PROJECT_NAME}-extras.cmake" )
endmacro( set_cfg_extras_file ) 

# append library variable names in form of PROJECT_foo_LIBRARY
# to CFG_EXTRAS. 
#===========================================================
macro( cfg_extras_append_libraries )

  file( APPEND ${${PROJECT_NAME}_CFG_EXTRAS_FILE} "\n#-- Libraries -------\n" )
  foreach( LIB ${${PROJECT_NAME}_INSTALL_LIBRARY_LIST} )
    file( APPEND ${${PROJECT_NAME}_CFG_EXTRAS_FILE} "set( ${PROJECT_UPPER}_${LIB}_LIBRARY ${LIB} )\n" )
  endforeach()
  file( APPEND ${${PROJECT_NAME}_CFG_EXTRAS_FILE} "\n" )

endmacro( cfg_extras_append_libraries )
