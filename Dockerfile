# Orient DB Dockerfile
#
# https://github.com/oscerd/docker-orientdb

# Pull base image.
FROM oscerd/java:latest
MAINTAINER Andrea Cosentino <ancosen1985@yahoo.com>

ENV ORIENTDB_VERSION orientdb-community-2.0.8

COPY . /src

RUN apt-get update && apt-get install -y curl unzip

ENV ORIENT_URL http://www.orientdb.com/download.php?file=${ORIENTDB_VERSION}.tar.gz
RUN wget ${ORIENT_URL} -O ${ORIENTDB_VERSION}.tar.gz
RUN mkdir /opt/orientdb
RUN tar -xzf ${ORIENTDB_VERSION}.tar.gz -C /opt/orientdb --strip-components=1
RUN rm ${ORIENTDB_VERSION}.tar.gz

EXPOSE 2424 2480

CMD ["/src/start.sh"]

