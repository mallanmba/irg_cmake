######################################################################
# Find script for OpenCV
#
# The FindOpenCV script provided by Willow Garage follows Boost 
# convention for variable names, (i.e. MyProject_VARIABLE) not 
# the CMake variable convention (i.e. MYPROJECT_VARIABLE)
# We create variables in their form for compatibility
#
# Output Variables:
# -----------------
# OpenCV_FOUND           : TRUE if search succeded
# OpenCV_INCLUDE_DIR     : include path
# OpenCV_LIBRARIES       : libraries in one variable (use this in your CMakeLists)
# OpenCV_LIBRARY_DIR     : library path
# OPENCV_opencv_LIBRARY      : full path to cv
#
######################################################################

include( IrgPackageFind )
include( GetLibraryList )

set(     PACKAGE OpenCV )
set( PACKAGE_DIR opencv )
set(    BASE_LIB opencv_core )

irg_package_find( "${PACKAGE}" "${PACKAGE_DIR}" "${BASE_LIB}")

##
## If additional libraries need to be found, do
## so here
################################################
if( ${PACKAGE_FOUND} ) 

  set( LIBRARY_NAMES
    opencv_calib3d
    opencv_contrib
    opencv_features2d
    opencv_flann
    opencv_gpu
    opencv_highgui
    opencv_imgproc
    opencv_legacy
    opencv_ml
    opencv_objdetect
    opencv_ts
    opencv_video
  )
  get_library_list(OPENCV ${OPENCV_LIBRARY_DIR} "d" "${LIBRARY_NAMES}")
  
  ## Compatibility variables 
  set( OpenCV_FOUND        ${OPENCV_FOUND} )
  set( OpenCV_INCLUDE_DIR  ${OPENCV_INCLUDE_DIR} )
  set( OpenCV_LIBRARIES    ${OPENCV_LIBRARIES} )
  set( OpenCV_LIBRARY_DIR  ${OPENCV_LIBRARY_DIR} )
  set( OPENCV_LIB_COMPONENTS ${LIBRARY_NAMES} )
  set( OpenCV_DIR          ${OPENCV_ROOT_DIR} )
  
  #Find OpenCV version by looking at cvver.h
  file(STRINGS ${OpenCV_INCLUDE_DIR}/opencv2/core/version.hpp OpenCV_VERSIONS_TMP REGEX "^#define CV_[A-Z]+_VERSION[ \t]+[0-9]+$")
  string(REGEX REPLACE ".*#define CV_MAJOR_VERSION[ \t]+([0-9]+).*" "\\1" OpenCV_VERSION_MAJOR ${OpenCV_VERSIONS_TMP})
  string(REGEX REPLACE ".*#define CV_MINOR_VERSION[ \t]+([0-9]+).*" "\\1" OpenCV_VERSION_MINOR ${OpenCV_VERSIONS_TMP})
  string(REGEX REPLACE ".*#define CV_SUBMINOR_VERSION[ \t]+([0-9]+).*" "\\1" OpenCV_VERSION_PATCH ${OpenCV_VERSIONS_TMP})
  set(OpenCV_VERSION ${OpenCV_VERSION_MAJOR}.${OpenCV_VERSION_MINOR}.${OpenCV_VERSION_PATCH} CACHE STRING "" FORCE)
  
endif( ${PACKAGE_FOUND} ) 

