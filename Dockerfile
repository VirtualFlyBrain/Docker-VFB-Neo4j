FROM neo4j:2.3-enterprise

RUN apt-get -y update && apt-get -y install ssh

ENV NEO4J_CACHE_MEMORY=2048
ENV NEO4J_HEAP_MEMORY=5120
ENV NEO4J_ALLOW_STORE_UPGRADE=true
ENV NEO4J_AUTH=none

ENV NEOCONF="/var/lib/neo4j/conf/neo4j.properties"
ENV NEOSERCONF="/var/lib/neo4j/conf/neo4j-server.properties"

RUN echo '' >> ${NEOSERCONF} && \
echo 'read_only=false' >> ${NEOSERCONF} 
