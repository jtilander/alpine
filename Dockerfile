FROM alpine:3.5
MAINTAINER Jim Tilander

RUN apk add --no-cache \
		bash \
		curl \
		git \
		make

ADD bin/lib-x64.tgz /

ENV VISUAL=vi

ENV P4_VERSION 16.2
RUN curl -sSL -O http://cdist2.perforce.com/perforce/r${P4_VERSION}/bin.linux26x86_64/p4 && mv p4 /usr/bin/p4 && chmod +x /usr/bin/p4

COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["ping"]
