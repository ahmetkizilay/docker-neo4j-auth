#neo4j_auth

Start neo4j database with docker with specified credentials. This docker image is based on the [image](https://registry.hub.docker.com/u/tpires/neo4j/dockerfile/) by Tiago Pires

To disable authorization call it with `-e NEO4J_AUTH=none`. For example:
> docker run -i -t -e NEO4J_AUTH=none --cap-add=SYS_RESOURCE -p 7474:7474 ahmetkizilay/neo4j

To set custom username password call it with `-e NEO4J_AUTH=username:password`. For example:
> docker run -i -t -e NEO4J_AUTH=neo4j:password --cap-add=SYS_RESOURCE -p 7474:7474 ahmetkizilay/neo4j
