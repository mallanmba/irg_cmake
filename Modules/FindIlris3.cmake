######################################################################
# Find script for Ilris3
#
# Output Variables:
# -----------------
# ILRIS3_FOUND                 : TRUE if search succeded
# ILRIS3_INCLUDE_DIR           : include path
# ILRIS3_LIBRARIES             : libraries in one variable (use this in your CMakeLists)
# ILRIS3_LIBRARY_DIR           : library path
# ILRIS3_LIDARAPI_LIBRARY      : full path to lidarapi
# ILRIS3_AUXPLATFORM_LIBRARY   : full path to auxplatform
######################################################################

include( IrgPackageFind )

set(     PACKAGE Ilris3 )
set( PACKAGE_DIR ilris3dAPI )
set(    BASE_LIB lidarapi )

irg_package_find( "${PACKAGE}" "${PACKAGE_DIR}" "${BASE_LIB}")

##
## If additional libraries need to be found, do
## so here
################################################
if( ${PACKAGE_FOUND} ) 

  find_library( ILRIS3_AUXPLATFORM_LIBRARY  auxplatform ${${PACKAGE_LIBRARY_DIR}} NO_DEFAULT_PATH )

  set( ${PACKAGE_LIBRARIES} 
    ${${PACKAGE_BASE_LIBRARY}}
    ${ILRIS3_AUXPLATFORM_LIBRARY} 
    CACHE STRING "all ${PACKAGE} link libraries"
  )
  mark_as_advanced( 
    ${PACKAGE_BASE_LIBRARY} 
    ILRIS3_AUXPLATFORM_LIBRARY
  )

endif( ${PACKAGE_FOUND} ) 
