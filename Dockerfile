FROM swift:4.2

WORKDIR /app
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
RUN apt-get update \
&& apt-get -q -y install apt-utils \
dialog \
wget
RUN /bin/bash -c "$(wget -qO- https://apt.vapor.sh)"
RUN apt-get -q -y install vapor


