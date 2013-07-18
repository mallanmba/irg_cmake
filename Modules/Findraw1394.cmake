######################################################################
# Find script for raw1394
#
# Output Variables:
# -----------------
# RAW1394_FOUND           : TRUE if search succeded
# RAW1394_INCLUDE_DIR     : include path
# RAW1394_LIBRARIES       : libraries in one variable (use this in your CMakeLists)
# RAW1394_LIBRARY_DIR     : library path
# RAW1394_BASE_LIBRARY    : full path to raw1394
#
######################################################################

include( IrgPackageFind )

set(     PACKAGE raw1394 )
set( PACKAGE_DIR libraw1394 )
set(    BASE_LIB raw1394 )

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






