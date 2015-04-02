#!/bin/bash

if [ "$NEO4j_AUTH" == "none" ]; then
    echo 'dbms.security.auth_enabled=false' >> /var/lib/neo4j/conf/neo4j-server.properties
    echo 'disabling authentication'
else
    echo 'will have to use credentials'
fi

/bin/bash -c /launch.sh