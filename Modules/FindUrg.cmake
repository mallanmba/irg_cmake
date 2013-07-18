######################################################################
# Find script for urg libraries
#
# Output Variables:
# -----------------
# URG_FOUND               : TRUE if search succeded
# URG_INCLUDE_DIR         : include path
# URG_LIBRARIES           : libraries in one variable (use this in your CMakeLists)
# URG_LIBRARY_DIR         : library path
# URG_BASE_LIBRARY        : full path to urg
# URG_COMMON_LIBRARY      : full path to common
# URG_CONNECTION_LIBRARY  : full path to connection
# URG_COORDINATE_LIBRARY  : full path to coordinate
# URG_GEOMETRY_LIBRARY    : full path to geometry
# URG_MONITOR_LIBRARY     : full path to monitor
# URG_SYSTEM_LIBRARY      : full path to system
#
######################################################################

include( IrgPackageFind )

set(     PACKAGE Urg )
set( PACKAGE_DIR urg )
set(    BASE_LIB HACK )

irg_package_find( "${PACKAGE}" "${PACKAGE_DIR}" "${BASE_LIB}")

##
## If additional libraries need to be found, do
## so here
################################################
##
##
##  TODO!!!  Fix the IrgPackageFind Macro
##  This fix is tolerated by Mark
##  Had to add libHACK.so in the URG packages dir
if( ${PACKAGE_FOUND} ) 

  find_library( URG_urg_LIBRARY             urg             ${${PACKAGE_LIBRARY_DIR}}/urg NO_DEFAULT_PATH )
  find_library( URG_common_LIBRARY          common          ${${PACKAGE_LIBRARY_DIR}}/urg NO_DEFAULT_PATH )
  find_library( URG_connection_LIBRARY      connection      ${${PACKAGE_LIBRARY_DIR}}/urg NO_DEFAULT_PATH )
  find_library( URG_connectionSdl_LIBRARY   connection_sdl  ${${PACKAGE_LIBRARY_DIR}}/urg NO_DEFAULT_PATH )
  find_library( URG_coordinate_LIBRARY      coordinate      ${${PACKAGE_LIBRARY_DIR}}/urg NO_DEFAULT_PATH )
  find_library( URG_geometry_LIBRARY        geometry        ${${PACKAGE_LIBRARY_DIR}}/urg NO_DEFAULT_PATH )
  find_library( URG_monitor_LIBRARY         monitor         ${${PACKAGE_LIBRARY_DIR}}/urg NO_DEFAULT_PATH )
  find_library( URG_system_LIBRARY          system          ${${PACKAGE_LIBRARY_DIR}}/urg NO_DEFAULT_PATH )
  
  set( ${PACKAGE_LIBRARIES} 
    ${URG_urg_LIBRARY}
    ${URG_common_LIBRARY}
    ${URG_connection_LIBRARY}
    ${URG_connectionSdl_LIBRARY}
    ${URG_coordinate_LIBRARY}
    ${URG_geometry_LIBRARY}
    ${URG_monitor_LIBRARY}
    ${URG_system_LIBRARY}
  )
  mark_as_advanced( 
    URG_urg_LIBRARY
    URG_common_LIBRARY
    URG_connection_LIBRARY
    URG_connectionSdl_LIBRARY
    URG_coordinate_LIBRARY
    URG_geometry_LIBRARY
    URG_monitor_LIBRARY
    URG_system_LIBRARY
  )

endif( ${PACKAGE_FOUND} ) 
