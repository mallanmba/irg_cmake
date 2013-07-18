######################################################################
# Find script for Sicktoolbox libraries
#
# Output Variables:
# -----------------
# SICKTOOLBOX_FOUND               : TRUE if search succeded
# SICKTOOLBOX_INCLUDE_DIR         : include path
# SICKTOOLBOX_LIBRARIES           : libraries in one variable (use this in your CMakeLists)
# SICKTOOLBOX_LIBRARY_DIR         : library path
# SICKTOOLBOX_BASE_LIBRARY        : full path to sicktoolbox
#
######################################################################

include( IrgPackageFind )

set(     PACKAGE sicktoolbox )
set( PACKAGE_DIR sicktoolbox )
set(    BASE_LIB sicklms-1.0 )

irg_package_find( "${PACKAGE}" "${PACKAGE_DIR}" "${BASE_LIB}")

##
## If additional libraries need to be found, do
## so here
################################################
##
if( ${PACKAGE_FOUND} ) 

  set( ${PACKAGE_LIBRARIES} 
    ${${PACKAGE_BASE_LIBRARY}}
    CACHE STRING "all ${PACKAGE} link libraries"
  )
  mark_as_advanced( 
    ${PACKAGE_BASE_LIBRARY} 
  )

endif( ${PACKAGE_FOUND} ) 
