certificate-dev:
	mkdir -p cert && \
	openssl req -nodes -x509 -newkey rsa:4096 -keyout cert/key.pem -out cert/cert.pem -days 365 -subj "/C=RU/ST=Kaliningrad/L=Kaliningrad/O=KrasnoperovVitaliy/OU=Bullet/CN=*" -sha256

certificate-prod:
	mkdir -p cert && \
	openssl req -nodes -x509 -newkey rsa:4096 -keyout cert/key.pem -out cert/cert.pem -days 365 -subj "/C=RU/ST=Kaliningrad/L=Kaliningrad/O=KrasnoperovVitaliy/OU=Bullet/CN=*.krasnoperov.tk" -sha256

server-dev:
	eval $(egrep -v '^#' .env | xargs) python3 main.py

client-dev:
	eval $(egrep -v '^#' .env | xargs) python3 client.py

proto:
	rm -f protocol/*_pb2*
	rm -rf protocol/__pycache__
	find protocol -type f -name "*.proto" -exec protoc --python_out=. {} \;
