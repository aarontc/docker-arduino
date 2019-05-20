FROM ubuntu:bionic
MAINTAINER Aaron Ten Clay <aarontc@aarontc.com>

ARG ARDUINO_IDE_VERSION=1.8.9

RUN \
	apt-get update && \
	apt-get install -y \
		wget \
		openjdk-8-jre \
		xvfb \
		xz-utils \
		build-essential \
		cmake && \
	apt-get clean -y && \
	apt-get autoremove -y && \
	rm -rf /var/lib/apt/lists/*

# Let the wget be cached in case changes need to be made to the symlinking steps
RUN wget -q -O- https://downloads.arduino.cc/arduino-${ARDUINO_IDE_VERSION}-linux64.tar.xz | tar -xJC /opt
RUN \
	ln -s /opt/arduino-${ARDUINO_IDE_VERSION} /arduino && \
	ln -s /opt/arduino-${ARDUINO_IDE_VERSION}/arduino /usr/local/bin/arduino && \
	ln -s /opt/arduino-${ARDUINO_IDE_VERSION}/arduino-builder /usr/local/bin/arduino-builder

COPY bin/ /usr/local/bin/

ENV DISPLAY :1.0

WORKDIR /workspace
ENTRYPOINT [ "/usr/local/bin/start-session" ]
CMD [ "/bin/bash" ]
