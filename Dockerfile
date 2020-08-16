FROM alpine:latest
LABEL maintainer="waka9999"
EXPOSE 58080/tcp
EXPOSE 8000/tcp
RUN mkdir -p /service/config
RUN mkdir -p /service/monolith
WORKDIR /service
ADD wrapper /service
ADD launcher.sh /service
ADD config/ /service/config
ADD monolith /service/monolith
RUN apk add --update curl && rm -rf /var/cache/apk/*
RUN chmod +x wrapper
RUN chmod +x monolith/hello
RUN chmod +x launcher.sh
CMD /service/wrapper
