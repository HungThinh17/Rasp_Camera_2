#include "camera.h"

int main() {
    Camera camera;

    if (!camera.initialize()) {
        return -1; // Initialization failed
    }

    if (!camera.capture("/home/pi/pictures/image1.jpg")) {
        return -1; // Capture failed
    }

    std::cout << camera.get_info() << std::endl;
    return 0;
}
