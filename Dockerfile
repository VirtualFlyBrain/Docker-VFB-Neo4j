FROM neo4j:enterprise

ENV NEO4J_ACCEPT_LICENSE_AGREEMENT=yes

ENV NEO4J_dbms_memory_pagecache_size=512M
ENV NEO4J_dbms_memory_heap_initial__size=512M
ENV NEO4J_dbms_memory_heap_maxSize=10G

ENV NEO4J_dbms_allowFormatMigration=true
ENV NEO4J_dbms_connectors_default__listen__address=0.0.0.0
ENV NEO4J_dbms_connector_http_listen__address=${NEO4J_dbms_connectors_default__listen__address}:7474
ENV NEO4J_dbms_connector_https_listen__address=${NEO4J_dbms_connectors_default__listen__address}:7473
ENV NEO4J_dbms_connector_bolt_listen__address:=${NEO4J_dbms_connectors_default__listen__address}:7687

#enable security of setting readonly to false:
ENV NEO4J_dbms_security_auth__enabled=false
ENV NEO4J_AUTH=none
ENV NEOREADONLY=false
RUN echo -e "\nread_only=${NEOREADONLY}\n" >> ${NEOSERCONF}

#for pulling static DB copy
RUN apk update && apk add openssh 
