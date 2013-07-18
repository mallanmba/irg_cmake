######################################################################
# Find script for SGE
#
# Output Variables:
# -----------------
# SGE_FOUND           : TRUE if search succeded
# SGE_INCLUDE_DIR     : include path
# SGE_LIBRARIES       : all libraries in one variable (use this in your CMakeLists)
# SGE_LIBRARY_DIR     : library path
# SGE_BASE_LIBRARY    : full path to proj
#
######################################################################

include( IrgPackageFind )

set(     PACKAGE sge )
set( PACKAGE_DIR sge )
set(    BASE_LIB SGE )

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


