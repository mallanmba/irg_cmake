######################################################################
# Find script for gsl
#
# NOTE: gsl has a whole bunch of libraries. Right now, this script
# looks for *only* the base lib and gslcblas and puts those into 
# GSL_LIBRARIES.
#
# Output Variables:
# -----------------
# GSL_FOUND           : TRUE if search succeded
# GSL_INCLUDE_DIR     : include path
# GSL_LIBRARIES       : libraries in one variable (use this in your CMakeLists)
# GSL_LIBRARY_DIR     : library path
# GSL_BASE_LIBRARY    : full path to gsl
# GSL_CBLAS_LIBRARY   : full path to gslcblas
#
######################################################################

include( IrgPackageFind )

set(     PACKAGE gsl )
set( PACKAGE_DIR gsl )
set(    BASE_LIB gsl )

irg_package_find( "${PACKAGE}" "${PACKAGE_DIR}" "${BASE_LIB}")

##
## If additional libraries need to be found, do
## so here
################################################
if( ${PACKAGE_FOUND} ) 

  find_library( GSL_CBLAS_LIBRARY gslcblas ${${PACKAGE_LIBRARY_DIR}} )
  
  set( ${PACKAGE_LIBRARIES} 
    ${${PACKAGE_BASE_LIBRARY}}
    ${GSL_CBLAS_LIBRARY}
    CACHE STRING "all ${PACKAGE} link libraries"
  )
  mark_as_advanced( 
    ${PACKAGE_BASE_LIBRARY} 
    GSL_CBLAS_LIBRARY 
  )
  
endif( ${PACKAGE_FOUND} ) 

