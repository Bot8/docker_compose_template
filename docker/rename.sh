#!/bin/bash
if [ -z $1 ];
  then echo "Do not set new name";
  else
    sed -i -e "s/project/$1/g" docker-compose.yaml;
    sed -i -e "s/project/$1/g" nginx/etc/conf.d/default.conf;
    sed -i -e "s/project/$1/g" artisan.sh;
    sed -i -e "s/project/$1/g" composer.sh;
fi
