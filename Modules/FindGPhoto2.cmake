######################################################################
# Find script for gphoto2
#
# Output Variables:
# -----------------
# GPHOTO2_FOUND           : TRUE if search succeded
# GPHOTO2_INCLUDE_DIR     : include path
# GPHOTO2_LIBRARIES       : all libraries in one variable (use this in your CMakeLists)
# GPHOTO2_LIBRARY_DIR     : library path
#
######################################################################

include( IrgPackageFind )
include( GetLibraryList )

set(     PACKAGE gphoto2 )
set( PACKAGE_DIR libgphoto2 )
set(    BASE_LIB gphoto2 )

irg_package_find( "${PACKAGE}" "${PACKAGE_DIR}" "${BASE_LIB}" )

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


#find_library( GPHOTO2_LIBRARY gphoto2
#  /usr/local/irg/packages/i686_linux_gcc4.1/libgphoto2/lib
#)
#
#string(REGEX REPLACE "/[^/]*/[^/]*$" "" GPHOTO2_ROOT ${GPHOTO2_LIBRARY})
#
#if ( GPHOTO2_ROOT )
#
#  set( GPHOTO2_INCLUDE_DIR ${GPHOTO2_ROOT}/include CACHE PATH "gphoto2 include path")
#  
#  message(STATUS "gphoto2 root found at ${GPHOTO2_ROOT}")
#
#  set( GPHOTO2_FOUND TRUE )
#
#else( GPHOTO2_ROOT )
#
#  message(STATUS "gphoto2 root NOT found.")
#  
#endif( GPHOTO2_ROOT )
