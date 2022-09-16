FROM ghcr.io/amirulandalib/mltb-alpine-docker:latest

# if you want to load image from dockerhub then replace the above one with this one 👇
# FROM amirulandalib/mltb-alpine-docker:latest

WORKDIR /usr/src/app


COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt
RUN chmod +x aria.sh

CMD ["bash","start.sh"]
