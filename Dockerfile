FROM ubuntu:20.04

RUN apt update

RUN apt clean

RUN apt install -y python3 
RUN apt-get update
RUN apt install python3-pip -y
 
RUN apt install git -y
RUN apt update -y

RUN pip install databricks-cli==0.11.0

