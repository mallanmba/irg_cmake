######################################################################
# Find script for AdvNav Alignment Tk
#
# find_package(AdvNav) will then set the following 
#
# Output Variables:
# -----------------
# ADVNAV_FOUND 		:Found Adv Nav
# ADVNAV_INCLUDE_DIRS	:Include directories
# ADVNAV_LIBRARY_DIRS   :Library Dir
# ADVNAV_LIBRARIES 	:Library to link against
#
#
######################################################################
message(STATUS "Looking for AdvNav")

include(GetLibraryList)
include(GetReleaseSearchPath)

set( PACKAGE advNav)
set( PACKAGE_DIR advNav)

#get the RELEASE_SEARCH_PATH, should set to RELEASE_SEARCH_PATH:/usr/local/irg/releases/advNav
get_release_search_path("${PACKAGE}" "${PACKAGE_DIR}" ADVNAV_ROOT_DIR)

# set ADVNAV_INCLUDE_DIRS if found, if not found set to ADVNAV_INCLUDE_DIRS-NOTFOUND
find_path( ADVNAV_INCLUDE_DIRS include/localization/localization.h
           PATHS ${RELEASE_SEARCH_PATH}
)

set(LIBRARY_NAMES
	horizonTool
	localization
	sfm
)

if (ADVNAV_INCLUDE_DIRS)
  set(ADVNAV_ROOT_DIR ${RELEASE_SEARCH_PATH})

  message(STATUS "  Found AdvNav in ${ADVNAV_ROOT_DIR}")
  set(ADVNAV_FOUND TRUE)
  set(ADVNAV_INCLUDE_DIRS ${ADVNAV_ROOT_DIR}/include ${ADVNAV_REQUIRED_INCLUDE_DIRS})
  set(ADVNAV_LIBRARY_DIRS ${ADVNAV_ROOT_DIR}/lib )
  get_library_list(ADVNAV ${ADVNAV_LIBRARY_DIRS} "d" "${LIBRARY_NAMES}")

else (ADVNAV_INCLUDE_DIRS)
  message(STATUS ${RELEASE_SEARCH_ERROR_MESSAGE})
  set (ADVNAV_FOUND FALSE)

endif (ADVNAV_INCLUDE_DIRS)
