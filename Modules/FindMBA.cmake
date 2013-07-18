######################################################################
# Find script for MBA
#
# Output Variables:
# -----------------
# MBA_FOUND           : TRUE if search succeded
# MBA_INCLUDE_DIR     : include path
# MBA_LIBRARIES       : all libraries in one variable (use this in your CMakeLists)
# MBA_LIBRARY_DIR     : library path
# MBA_BASE_LIBRARY    : full path to MBA
#
######################################################################

include( IrgPackageFind )

set(     PACKAGE mba )
set( PACKAGE_DIR mba )
set(    BASE_LIB mba-1.1_ )

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


