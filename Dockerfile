FROM neo4j:enterprise 

RUN apk update && apk add openssh

# Location of config files (separate in v2)
ENV NEOCONF="/var/lib/neo4j/conf/neo4j.conf"
ENV NEOSERCONF=${NEOCONF}
# Read_only setting:
ENV NEO4J_dbms_read_only=true
# Default is open access (read_only) change bellow to require below user/password:
ENV NEO4J_dbms_security_auth_enabled=false
ENV NEO4J_AUTH=neo4j/password
# Enable upgrading of DB:
ENV NEO4J_ALLOW_STORE_UPGRADE=true
ENV NEO4J_dbms_allowFormatMigration=true
# Max memory size (typically half the default):
ENV NEO4J_dbms_memory_heap_maxSize=10G
ENV NEO4J_dbms_logs_query_enabled=true
ENV NEO4J_dbms_logs_query_allocation_logging_enabled=true
# Log all queries that take longer then (seconds):
ENV NEO4J_dbms_logs_query_threshold=0
# Accept Neo4j license:
ENV NEO4J_ACCEPT_LICENSE_AGREEMENT=yes
