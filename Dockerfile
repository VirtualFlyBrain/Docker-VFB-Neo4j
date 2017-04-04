FROM neo4j:2.3-enterprise

RUN sed -i s/dbms.security.auth_enabled=true/dbms.security.auth_enabled=false/ /var/lib/neo4j/conf/neo4j-server.properties && \
echo 'read_only=false' >> /var/lib/neo4j/conf/neo4j-server.properties && \
sed -i s/#allow_store_upgrade=true/allow_store_upgrade=true/ /var/lib/neo4j/conf/neo4j.properties

