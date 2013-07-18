######################################################################
# Find script for usb
#
# Output Variables:
# -----------------
# USB_FOUND           : TRUE if search succeded
# USB_INCLUDE_DIR     : include path
# USB_LIBRARIES       : libraries in one variable (use this in your CMakeLists)
# USB_LIBRARY_DIR     : library path
# USB_BASE_LIBRARY    : full path to usb
#
######################################################################

include( IrgPackageFind )

set(     PACKAGE usb )
set( PACKAGE_DIR usb )
set(    BASE_LIB usb )

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

