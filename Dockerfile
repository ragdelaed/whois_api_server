# syntax=docker/dockerfile:1

FROM python:3.8-slim-buster

WORKDIR /opt

RUN /usr/local/bin/python -m pip install --upgrade pip
RUN apt-get update  && apt-get -y  install git lsof ips net-tools watch host
RUN pip install flask 
RUN mkdir /opt/whois_api_server /opt/python-whois

RUN git clone https://github.com/ragdelaed/python-whois /opt/python-whois
RUN cd /opt/python-whois && python setup.py  install
RUN cp /opt/python-whois/pwhois /usr/local/bin
RUN chmod +x /usr/local/bin/pwhois
COPY ./whois_api_server.py /opt/whois_api_server/whois_api_server.py


CMD [ "python3", "/opt/whois_api_server/whois_api_server.py"]