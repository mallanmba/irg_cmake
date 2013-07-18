######################################################################
# Find script for RASM
#
# Output Variables:
# -----------------
# RASM_FOUND           : TRUE if search succeded
# RASM_INCLUDE_DIR     : include path
# RASM_LIBRARIES       : all libraries in one variable (use this in your CMakeLists)
# RASM_LIBRARY_DIR     : library path
# RASM_BASE_LIBRARY    : full path to proj
#
######################################################################

include( IrgPackageFind )

set(     PACKAGE rasm )
set( PACKAGE_DIR rasm )
set(    BASE_LIB common )


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

