######################################################################
# Find script for PCAP
#
# Output Variables:
# -----------------
# PCAP_FOUND           : TRUE if search succeded
# PCAP_INCLUDE_DIR     : include path
# PCAP_LIBRARIES       : all libraries in one variable (use this in your CMakeLists)
# PCAP_LIBRARY_DIR     : library path
# PCAP_BASE_LIBRARY    : full path to proj
#
######################################################################

include( IrgPackageFind )

set(     PACKAGE pcap )
set( PACKAGE_DIR libpcap )
set(    BASE_LIB pcap )

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


