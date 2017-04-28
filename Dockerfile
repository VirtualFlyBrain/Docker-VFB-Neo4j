FROM neo4j:enterprise 

ENV NEOCONF="/var/lib/neo4j/conf/neo4j.conf"
ENV NEOSERCONF=${NEOCONF}

RUN sed -i s/dbms.security.auth_enabled=true/dbms.security.auth_enabled=false/ ${NEOSERCONF} && \
echo '' >> ${NEOSERCONF} && \
echo 'read_only=false' >> ${NEOSERCONF} && \
sed -i s/#allow_store_upgrade=true/allow_store_upgrade=true/ ${NEOCONF} && \
sed -i s/#dbms.logs.query.enabled=true/dbms.logs.query.enabled=true/ ${NEOCONF} && \
echo 'dbms.logs.query.parameter_logging_enabled=true' >> ${NEOSERCONF} 
