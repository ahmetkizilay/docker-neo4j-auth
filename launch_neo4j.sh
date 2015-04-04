#!/bin/bash

if [ -n "$NEO4J_AUTH" ]; then
  if [ "$NEO4J_AUTH" == "none" ]; then
      echo 'disabling authentication'
      echo 'dbms.security.auth_enabled=false' >> /var/lib/neo4j/conf/neo4j-server.properties
  else
      echo "will use custom credentials"
      mkdir -p /var/lib/neo4j/data/dbms
      echo -n $NEO4J_AUTH | ./build_auth_string.sh > /var/lib/neo4j/data/dbms/auth
  fi
else
  echo "authorization not set"
fi

/bin/bash -c /launch.sh