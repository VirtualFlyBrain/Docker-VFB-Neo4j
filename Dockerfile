FROM neo4j:enterprise 

RUN apt-get -y update && apt-get -y install ssh

RUN sed -i s/wrapper.java.initmemory=512/wrapper.java.initmemory=1024/ /var/lib/neo4j/conf/neo4j-wrapper.conf
RUN sed -i s/wrapper.java.maxmemory=512/wrapper.java.maxmemory=5120/ /var/lib/neo4j/conf/neo4j-wrapper.conf

ENV NEOCONF="/var/lib/neo4j/conf/neo4j.conf"
ENV NEOSERCONF=${NEOCONF}

RUN sed -i s/dbms.security.auth_enabled=true/dbms.security.auth_enabled=false/ ${NEOSERCONF} && \

sed -i s/#dbms.security.auth_enabled=false/dbms.security.auth_enabled=false/ ${NEOSERCONF} && \
echo '' >> ${NEOSERCONF} && \
echo 'read_only=false' >> ${NEOSERCONF} && \
sed -i s/#allow_store_upgrade=true/allow_store_upgrade=true/ ${NEOCONF} && \
sed -i s/#dbms.allow_format_migration=true/dbms.allow_format_migration=true/ ${NEOCONF} && \
sed -i s/#dbms.logs.query.enabled=true/dbms.logs.query.enabled=true/ ${NEOCONF} && \
echo 'dbms.logs.query.parameter_logging_enabled=true' >> ${NEOSERCONF} 
