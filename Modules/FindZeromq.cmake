include( IrgPackageFind )
set( PACKAGE zeromq )
set( PACKAGE_DIR zeromq )
set( BASE_LIB zmq )

irg_package_find( "${PACKAGE}" "${PACKAGE_DIR}" "${BASE_LIB}" )

if( ${PACKAGE_FOUND} ) 
  set( ${PACKAGE_LIBRARIES} 
    ${${PACKAGE_BASE_LIBRARY}}
    CACHE STRING "all ${PACKAGE} link libraries"
  )
  mark_as_advanced( 
    ${PACKAGE_BASE_LIBRARY} 
  )
endif( ${PACKAGE_FOUND} )
