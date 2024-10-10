#ifndef CAMERA_H
#define CAMERA_H

#include <string>
#include <opencv2/opencv.hpp> // Include OpenCV
#include <libcamera/libcamera.h>

class Camera {
public:
    Camera();
    ~Camera();

    bool initialize();
    bool capture(const std::string& output_path);
    std::string get_info() const;

private:
    cv::Mat frame;  // OpenCV matrix to hold the image
    // Add any necessary private members, e.g., camera state, configuration
};

#endif // CAMERA_H
