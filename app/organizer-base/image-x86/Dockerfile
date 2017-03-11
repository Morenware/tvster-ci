FROM debian:jessie
RUN rm /bin/sh && ln -s /bin/bash /bin/sh
RUN apt-get update
RUN apt-get -y install sudo git wget ntfs-3g curl ssh less unzip vim telnet net-tools locales
RUN useradd -m osmc && echo "osmc:osmc" | chpasswd && adduser osmc sudo
ENV INSTALL_DIR /tmp

# Install Transmission
ADD install-transmission.sh $INSTALL_DIR/install-transmission.sh
RUN chmod +x $INSTALL_DIR/install-transmission.sh
RUN $INSTALL_DIR/install-transmission.sh
ADD settings.json $INSTALL_DIR/
ADD transmission-daemon-defaults $INSTALL_DIR/
RUN mkdir -p /opt/software/logs/transmission \
    mkdir -p /var/lib/transmission-daemon/info
RUN cp $INSTALL_DIR/transmission-daemon-defaults /etc/default/
RUN cp $INSTALL_DIR/settings.json /var/lib/transmission-daemon/info
RUN /etc/init.d/transmission-daemon start

# Install Java & Filebot
RUN mkdir -p /opt/software
RUN echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main" | tee /etc/apt/sources.list.d/webupd8team-java.list
RUN echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main" | tee -a /etc/apt/sources.list.d/webupd8team-java.list
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886
RUN apt-get update
RUN echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | sudo debconf-set-selections
RUN apt-get install -y oracle-java8-installer
RUN java -version
RUN wget https://sourceforge.net/projects/filebot/files/filebot/FileBot_4.7.7/filebot_4.7.7_amd64.deb/download -O $INSTALL_DIR/filebot_x86.deb
RUN dpkg -i $INSTALL_DIR/filebot_x86.deb

# Configure filebot
RUN filebot -script fn:sysinfo
ADD osdb.txt $INSTALL_DIR/
RUN cat $INSTALL_DIR/osdb.txt | filebot -script fn:configure
RUN rm $INSTALL_DIR/osdb.txt
