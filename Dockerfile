FROM debian:stretch

RUN mkdir /build && apt-get update && \
	apt-get install -y build-essential clang clang-format bison flex \
	libreadline-dev gawk tcl-dev libffi-dev git mercurial graphviz \
	xdot pkg-config python python3 libftdi-dev \
	qt5-default python3-dev libboost-all-dev cmake

COPY build.sh /build/build.sh
					 
ENTRYPOINT ["/bin/bash"]
CMD ["/build/build.sh"]

