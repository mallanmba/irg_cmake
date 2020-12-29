cmake_minimum_required(VERSION 3.5)
project(irg_cmake)

find_package(ament_cmake REQUIRED)
  
ament_package(CONFIG_EXTRAS "cmake/irg_cmake-extras.cmake.in")
