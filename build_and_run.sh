#!/bin/sh
#

set -e


#########################################
#
# Download source and build war
#
#########################################
function download_and_build_war {
	rm -rf ./tmp

	mkdir tmp

	git clone git@github.com:lucamgal/pin-manager-micro.git ./tmp

	cd tmp && chmod +x mvnw && ./mvnw clean package

	cd .. && mv ./tmp/pin-manager-rest/target/*.war ./tomcat/dist/pin-manager.war
}


download_and_build_war

docker-compose down

docker-compose rm -f

docker-compose build --no-cache

docker-compose up -d
