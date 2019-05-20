# Docker container for building Arduino binaries

This container provides an installation of the Arduino.cc application, a virtual X11 server, and cmake.

It is designed for use in a CI environment, but can be used wherever the Arduino toolchain is needed.

Example usage:

    cd /path/to/my/arduino-project

    # Use Arduino to build a binary
    docker run -it --rm -v $(pwd):/workspace -u $(id -u):$(id -g) aarontc/arduino-builder arduino-builder -compile -hardware /arduino/hardware -tools /arduino/hardware/tools/avr -tools /arduino/tools-builder -fqbn arduino:avr:uno -libraries /workspace/libraries -verbose -build-path /workspace/build /workspace/myproject.ino

    # Use CMake to build a binary
    # (TODO)
