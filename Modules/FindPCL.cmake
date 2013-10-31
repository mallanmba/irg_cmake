######################################################################
# Find script for PCL
#
# Output Variables:
# -----------------
# PCL_FOUND           : TRUE if search succeded
# PCL_INCLUDE_DIR     : include path
# PCL_LIBRARIES       : libraries in one variable (use this in your CMakeLists)
# PCL_LIBRARY_DIR     : library path
#
######################################################################
message(STATUS "Looking for PCL...")
    
# look for pcl_config.hpp
find_file( PCL_CONFIG_FILE pcl_config.h
           PATH_SUFFIXES 
           include/pcl
           include/pcl/pcl
           include/pcl-1.8/pcl
           include/pcl-1.7/pcl
           include/pcl-1.6/pcl
           HINTS
           ${PCL_ROOT_DIR})
#message(STATUS "  (dbg) PCL_CONFIG_FILE=${PCL_CONFIG_FILE}")

# Sigh. ROS puts PCL ROS message includes in include/pcl and puts
# the *actual* PCL headers in include/pcl-1.6/pcl. Nice, guys. 
# Whatever... for the time being, just give up if pcl_config.h 
# is not found
if( PCL_CONFIG_FILE )  

  file(STRINGS ${PCL_CONFIG_FILE} PCL_VERSIONS_TMP REGEX "^#define PCL_[A-Z]+_VERSION[ \t]+[0-9]+$")
  string(REGEX REPLACE ".*#define PCL_MAJOR_VERSION[ \t]+([0-9]+).*" "\\1" PCL_VERSION_MAJOR ${PCL_VERSIONS_TMP})
  string(REGEX REPLACE ".*#define PCL_MINOR_VERSION[ \t]+([0-9]+).*" "\\1" PCL_VERSION_MINOR ${PCL_VERSIONS_TMP})  
  set(PCL_VERSION "${PCL_VERSION_MAJOR}.${PCL_VERSION_MINOR}")

  string(REGEX REPLACE "/[^/]*/[^/]*$" "" PCL_INCLUDE_DIR ${PCL_CONFIG_FILE})
  #message(STATUS "  (dbg) PCL_INCLUDE_DIR=${PCL_INCLUDE_DIR}")
  
  find_library(PCL_COMMON_LIB 
          NAMES
          pcl_common
          HINTS
          $ENV{PCL_ROOT}
          ${IRG_PACKAGES_DIR}/PCL
          ${IRG_PACKAGES_DIR}/pcl)
  #message(STATUS "  (dbg) PCL_COMMON_LIB=${PCL_COMMON_LIB}")
  string(REGEX REPLACE "/[^/]*$" "" PCL_LIBRARY_DIR ${PCL_COMMON_LIB})
  #message(STATUS "  (dbg) PCL_LIBRARY_DIR=${PCL_LIBRARY_DIR}")
          
  unset(PCL_CONFIG_FILE CACHE)
  unset(PCL_COMMON_LIB  CACHE)

  set( LIBRARY_NAMES
    #pcl_apps
    pcl_common
    pcl_features
    pcl_filters
    #pcl_geometry
    pcl_io
    pcl_io_ply
    pcl_kdtree
    pcl_keypoints
    pcl_octree
    pcl_outofcore
    pcl_people
    pcl_recognition
    pcl_registration
    pcl_sample_consensus
    pcl_search
    pcl_segmentation
    pcl_surface
    pcl_tracking
    pcl_visualization
  )
  get_library_list(PCL ${PCL_LIBRARY_DIR} "d" "${LIBRARY_NAMES}")

  set(PCL_FOUND TRUE)
  message(STATUS "  Found PCL version ${PCL_VERSION} in ${PCL_LIBRARY_DIR}")

else( PCL_CONFIG_FILE )

  set( PCL_FOUND FALSE)
  message(STATUS "  PCL NOT found!!! ${PCL_ROOT_DIR} exists, but could not find pcl_config.h")

endif( PCL_CONFIG_FILE )


