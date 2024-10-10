cmake_minimum_required(VERSION 3.12)  # Set the minimum version of CMake required
project(CameraProject)                 # Name of the project

# Find the required packages
find_package(libcamera REQUIRED)       # Find the libcamera package
find_package(OpenCV REQUIRED)          # Find the OpenCV package

# Set C++ standard (adjust this based on your needs)
set(CMAKE_CXX_STANDARD 11)             # Use C++11 standard
set(CMAKE_CXX_STANDARD_REQUIRED ON)    # Ensure C++11 standard is required

# Include directories for OpenCV and libcamera (if needed)
include_directories(${OpenCV_INCLUDE_DIRS})

# Add the executable target
add_executable(camera_app main.cpp camera.cpp)

# Link libraries to the target
target_link_libraries(camera_app PRIVATE libcamera ${OpenCV_LIBS})  # Link to libcamera and OpenCV
