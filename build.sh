#!/bin/bash

rm -rf /opt/icestorm/bin /opt/icestorm/share

cd /build

git clone https://github.com/cliffordwolf/icestorm.git 
git clone https://github.com/YosysHQ/nextpnr.git 
git clone https://github.com/YosysHQ/arachne-pnr.git
git clone https://github.com/YosysHQ/yosys.git
	
cd /build/icestorm && sed -i 's#/usr/local$#/opt/icestorm#' config.mk && make -j$(nproc) && make install
	
cd /build/nextpnr && cmake -DARCH=ice40 -DCMAKE_INSTALL_PREFIX=/opt/icestorm -DICEBOX_ROOT=/opt/icestorm/share/icebox . && make -j$(nproc) && make install

cd /build/arachne-pnr && sed -i 's#/usr/local$#/opt/icestorm#' Makefile && make -j$(nproc) && make install

cd /build/yosys && sed -i 's#/usr/local$#/opt/icestorm#' Makefile && make -j$(nproc) && make install
