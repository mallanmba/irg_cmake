message(STATUS "Looking for RAPID")

# XXX FIXME XXX stub "search" for RAPID
include( SetArchitecture )

# Set parent directory as a search location
string(REGEX REPLACE "/[^/]*$" "" PROJ_SRC_PARENT ${PROJECT_SOURCE_DIR})

if( NOT RAPID_ROOT_DIR )
  set( RAPID_ROOT_DIR ${PROJ_SRC_PARENT}/${ARCHITECTURE} )
endif( NOT RAPID_ROOT_DIR )

message(STATUS "  RAPID root hardcoded without check to ${RAPID_ROOT_DIR}")

set( RAPID_INCLUDE_DIR ${RAPID_ROOT_DIR}/include 
                       ${RAPID_ROOT_DIR}/include/rapidDds 
                       ${RAPID_ROOT_DIR}/include/rapidExtDds 
                       ${RAPID_ROOT_DIR}/include/rapidExtArcDds )
set( RAPID_LIBRARY_DIR ${RAPID_ROOT_DIR}/lib )
set( RAPID_IDL_DIR ${RAPID_ROOT_DIR}/idl )

set( LIBRARY_NAMES
  rapidFrameStore
  rapidDds
  rapidExtDds
  rapidExtArcDds
  rapidCmd
  rapidUtil
  rapidIo
  rapidExtIo
  rapidExtArcIo
)
get_library_list(RAPID ${RAPID_LIBRARY_DIR} "d" "${LIBRARY_NAMES}")

if( RAPID_rapidDds_LIBRARY OR RAPID_rapidFrameStore_LIBRARY )
  set( RAPID_FOUND TRUE )
endif( RAPID_rapidDds_LIBRARY OR RAPID_rapidFrameStore_LIBRARY )

if( RAPID_FOUND )
  message(STATUS "  Found RAPID in ${RAPID_ROOT_DIR}")
else( RAPID_FOUND )
  message(STATUS "  RAPID NOT found!!! ")
endif( RAPID_FOUND )

