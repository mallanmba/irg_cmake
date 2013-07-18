######################################################################
# Find script for PROJ4
#
# Output Variables:
# -----------------
# PROJ4_FOUND           : TRUE if search succeded
# PROJ4_INCLUDE_DIR     : include path
# PROJ4_LIBRARIES       : all libraries in one variable (use this in your CMakeLists)
# PROJ4_LIBRARY_DIR     : library path
# PROJ4_BASE_LIBRARY    : full path to proj
#
######################################################################

include( IrgPackageFind )

set(     PACKAGE proj4 )
set( PACKAGE_DIR proj4 )
set(    BASE_LIB proj  )

irg_package_find( "${PACKAGE}" "${PACKAGE_DIR}" "${BASE_LIB}")

##
## If additional libraries need to be found, do
## so here
################################################
if( ${PACKAGE_FOUND} ) 

  set( ${PACKAGE_LIBRARIES} 
    ${${PACKAGE_BASE_LIBRARY}}
    CACHE STRING "all ${PACKAGE} link libraries"
  )
  mark_as_advanced( 
    ${PACKAGE_BASE_LIBRARY} 
  )
endif( ${PACKAGE_FOUND} )


