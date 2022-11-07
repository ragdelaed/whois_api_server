docker build . -t whois_api_server
docker run -d -p 9119:9119 whois_api_server