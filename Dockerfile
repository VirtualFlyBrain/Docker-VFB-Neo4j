FROM neo4j:enterprise 

ENV NEOCONF="/var/lib/neo4j/conf/neo4j.conf"
ENV NEOSERCONF=${NEOCONF}

RUN sed -i s/dbms.security.auth_enabled=true/dbms.security.auth_enabled=false/ ${NEOSERCONF} && \
echo 'read_only=false' >> ${NEOSERCONF} && \
sed -i s/#allow_store_upgrade=true/allow_store_upgrade=true/ ${NEOCONF}

