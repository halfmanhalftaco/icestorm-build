icestorm-build
--------------

This docker container sets up a build environment for the 
[Project IceStorm](http://www.clifford.at/icestorm/) tools for Lattice ICE40
FPGA devices. This allows one to easily build and install the icestorm 
toolchain without installing a bunch of dependencies system-wide.

This builds `icestorm`, `nextpnr`, `arachnepnr` and `yosys`.

This currently assumes a Debian 9 (Stretch) system and an install destination of `/opt/icestorm`

Runtime packages needed on the host:

```
$ sudo apt-get install libboost-chrono1.62.0 libboost-python1.62.0 libboost-atomic1.62.0 libboost-program-options1.62.0 libftdi1
```

# Usage

```
$ sudo mkdir -p /opt/icestorm
$ git clone https://github.com/halfmanhalftaco/icestorm-build.git && cd icestorm-build
$ docker build -t icestorm-build .
$ docker run -ti -v /opt/icestorm:/opt/icestorm icestorm-build

# Clean up:
$ docker rm $(docker ps -lq)
$ docker rmi icestorm-build
```
