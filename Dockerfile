##
##
# call docker run with `-e NEO4J_AUTH=none` to disable authentication
##
##
# based on the neo4j image by Tiago Pires
# find the image here: https://registry.hub.docker.com/u/tpires/neo4j/dockerfile/
FROM tpires/neo4j
MAINTAINER Ahmet Kizilay, ahmet.kizilay@gmail.com

add launch_neo4j.sh /
add build_auth_string.sh /
run chmod +x /launch_neo4j.sh
run chmod +x /build_auth_string.sh
run apt-get install bsdmainutils -y

## turn on indexing: http://chrislarson.me/blog/install-neo4j-graph-database-ubuntu
## enable neo4j indexing, and set indexable keys to name,age
run sed -i "s|#node_auto_indexing|node_auto_indexing|g" /var/lib/neo4j/conf/neo4j.properties
run sed -i "s|#node_keys_indexable|node_keys_indexable|g" /var/lib/neo4j/conf/neo4j.properties

expose 7474
expose 1337

workdir /

# entrypoint
cmd ["/bin/bash", "-c", "/launch_neo4j.sh"]