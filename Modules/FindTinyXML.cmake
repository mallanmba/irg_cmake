######################################################################
# Find script for tinyxml
#
# Output Variables:
# -----------------
# TINYXML_FOUND           : TRUE if search succeded
# TINYXML_INCLUDE_DIR     : include path
# TINYXML_LIBRARIES       : all libraries in one variable (use this in your CMakeLists)
# TINYXML_LIBRARY_DIR     : library path
# TINYXML_BASE_LIBRARY    : full path to tinyxml
#
######################################################################

include( IrgPackageFind )

set(     PACKAGE tinyxml )
set( PACKAGE_DIR tinyxml )
set(    BASE_LIB tinyxml )

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


