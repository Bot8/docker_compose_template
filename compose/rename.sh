#!/bin/bash
if [ -z $1 ]; then echo "Do not set new name"; else sed -i -e "s/my_project/$1/g" docker-compose.yaml; sed -i -e "s/php:9000/$1\_php/g" nginx/etc/conf.d/default.conf; fi
