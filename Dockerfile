FROM andreyhristov/ubuntu1804_arm64_pylon5:0.1


RUN apt-get update \
	&& DEBIAN_FRONTEND=noninteractive apt-get install -y \
	unzip \
	&& git clone
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/*

RUN wget https://codeload.github.com/andreyhristov/tinyxml2/zip/master -0 master.zip && unzip master.zip && rm master.zip


RUN [ "cross-build-start" ]

RUN for i in "tinyxml2" ; do printf "============== %15s ==============\n" $i; cd /$i; make -j2; done

RUN [ "cross-build-end" ]
