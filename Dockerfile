FROM andreyhristov/ubuntu1804_arm64_pylon5:latest

RUN [ "cross-build-start" ]

RUN apt-get update \
	&& DEBIAN_FRONTEND=noninteractive apt-get install -y \
	unzip \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/*

RUN wget https://codeload.github.com/andreyhristov/tinyxml2/zip/master -O master.zip && unzip master.zip && rm master.zip

RUN for i in "tinyxml2-master" ; do printf "============== %15s ==============\n" $i; cd /$i; make; done

RUN [ "cross-build-end" ]
