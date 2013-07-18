######################################################################
# Find script for OpenEXR
# 
# XXX NOTE: This works OK, but needs some attention. Need
# to improve the irg_package_find() macro to set rid of the 
# "*_BASE_LIBRARY" name, add test for include file and 
# options for multiple platforms. Windows support is a headache. 
#
# Output Variables:
# -----------------
# OPENEXR_FOUND           : TRUE if search succeded
# OPENEXR_INCLUDE_DIR     : include path
# OPENEXR_LIBRARIES       : libraries in one variable (use this in your CMakeLists)
# OPENEXR_LIBRARY_DIR     : library path
#
######################################################################
include( IrgPackageFind )

set(     PACKAGE OpenEXR )
set( PACKAGE_DIR OpenEXR )
set(    BASE_LIB IlmImf )

irg_package_find( "${PACKAGE}" "${PACKAGE_DIR}" "${BASE_LIB}")

##
## If additional libraries need to be found, do
## so here
################################################
if( ${PACKAGE_FOUND} ) 
  set( SUBLIBS  
    Half
    Iex
    IlmImf
    IlmThread
    Imath
  )
  set( ALL_LIBS "" )
  set( MARK_ADV "" )
  foreach( SUBLIB ${SUBLIBS} )
    find_library( OPENEXR_${SUBLIB}_LIBRARY ${SUBLIB} ${${PACKAGE_LIBRARY_DIR}} )
    if( OPENEXR_${SUBLIB}_LIBRARY )
      set( ALL_LIBS ${ALL_LIBS} ${OPENEXR_${SUBLIB}_LIBRARY} )
      set( MARK_ADV ${MARK_ADV} OPENEXR_${SUBLIB}_LIBRARY )
    endif( OPENEXR_${SUBLIB}_LIBRARY )
  endforeach( SUBLIB )
  
  set( ${PACKAGE_LIBRARIES} 
    ${ALL_LIBS}
    CACHE STRING "all ${PACKAGE} link libraries"
  )
  mark_as_advanced( 
    ${MARK_ADV}
  )
  set( OPENEXR_INCLUDE_DIR ${OPENEXR_INCLUDE_DIR} ${OPENEXR_INCLUDE_DIR}/OpenEXR )
endif( ${PACKAGE_FOUND} ) 

