# for M1 Mac need a discription below 
FROM --platform=linux/arm64 debian:latest

# update and install the essential package
RUN apt update -y
RUN apt install -y sudo gcc make binutils libc6-dev gdb

# add user "tomo" and set the password for
RUN useradd -m -s /bin/bash tomo
RUN echo "tomo:tomo" | chpasswd

# add "tomo" to superuser
RUN gpasswd -a tomo sudo

# make a directory "mycc"
RUN mkdir /home/tomo/mycc

# run the container with "tomo"
USER tomo

# set the work directory
WORKDIR /home/tomo