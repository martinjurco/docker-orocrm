#!/bin/bash

docker run --name orocrm -p 8080:80 -p 8081:8080 -v /orocrm/app/config:/oro-data/config -v /oro-data/attachements:/orocrm/app/attachements -d ondrejsika/orocrm

