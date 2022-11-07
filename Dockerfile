# syntax=docker/dockerfile:1

FROM python:3.8-slim-buster

WORKDIR /opt
RUN /usr/local/bin/python -m pip install --upgrade pip
RUN apt-get update  && apt-get -y  install git
RUN pip install python-whois flask
RUN mkdir /opt/whois_api_server
COPY ./whois_api_server.py /opt/whois_api_server/whois_api_server.py
EXPOSE 9119/TCP

CMD [ "python3", "/opt/whois_api_server/whois_api_server.py"]
