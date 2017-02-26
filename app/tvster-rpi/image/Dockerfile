FROM resin/rpi-raspbian:jessie
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
RUN apt-get -y install oracle-java8-jdk
RUN java -version
RUN wget https://sourceforge.net/projects/filebot/files/filebot/FileBot_4.7.8/filebot_4.7.8_armhf.deb -O $INSTALL_DIR/filebot_arm.deb
RUN dpkg -i $INSTALL_DIR/filebot_arm.deb

# This does not work for now when building in Mac, regardless of qemu emulation
# RUN filebot -script fn:sysinfo
# RUN cat osdb.txt | filebot -script fn:configure

