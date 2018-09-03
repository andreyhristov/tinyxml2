FROM andreyhristov/ubuntu1804_arm64_pylon5:latest

RUN [ "cross-build-start" ]

RUN apt-get update \
	&& DEBIAN_FRONTEND=noninteractive apt-get install -y \
	unzip \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/*


RUN [ "cross-build-end" ]
