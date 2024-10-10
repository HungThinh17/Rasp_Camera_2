#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Function to print usage
usage() {
    echo "Usage: $0 {setup|build|test}"
    echo "Commands:"
    echo "  setup   - Installs required packages and sets up the project directory."
    echo "  build   - Builds the project using CMake."
    echo "  test    - Runs the built application."
    exit 1
}

# Check if at least one argument is passed
if [ "$#" -ne 1 ]; then
    usage
fi

# Set project directory
PROJECT_DIR="$HOME/rasp_camera_2"

case $1 in
    setup)
        # Update and upgrade the system
        echo "Updating and upgrading the system..."
        sudo apt update && sudo apt upgrade -y

        # Install required packages
        echo "Installing required packages..."
        sudo apt install -y libopencv-dev python3-opencv cmake g++

        # Create project directory if it doesn't exist
        if [ ! -d "$PROJECT_DIR" ]; then
            echo "Creating project directory at $PROJECT_DIR..."
            mkdir -p "$PROJECT_DIR"
        else
            echo "Project directory already exists at $PROJECT_DIR."
        fi

        echo "Setup complete! You can now add your source files to $PROJECT_DIR."
        ;;

    build)
        # Check if source files exist
        if [ ! -f "$PROJECT_DIR/CMakeLists.txt" ] || [ ! -f "$PROJECT_DIR/main.cpp" ] || [ ! -f "$PROJECT_DIR/camera.cpp" ] || [ ! -f "$PROJECT_DIR/camera.h" ]; then
            echo "Error: Source files not found in $PROJECT_DIR. Please ensure CMakeLists.txt, main.cpp, camera.cpp, and camera.h exist."
            exit 1
        fi

        # Create build directory
        BUILD_DIR="$PROJECT_DIR/build"
        if [ ! -d "$BUILD_DIR" ]; then
            echo "Creating build directory at $BUILD_DIR..."
            mkdir -p "$BUILD_DIR"
        fi

        # Build the project
        cd "$BUILD_DIR"
        echo "Running CMake..."
        cmake ..
        echo "Building the project..."
        make

        echo "Build complete! You can now run the application."
        ;;

    test)
        # Check if the built executable exists
        if [ ! -f "$PROJECT_DIR/build/camera_app" ]; then
            echo "Error: The application executable 'camera_app' does not exist. Please build the project first."
            exit 1
        fi

        # Run the application
        echo "Running the camera application..."
        "$PROJECT_DIR/build/camera_app"
        ;;

    *)
        usage
        ;;
esac
