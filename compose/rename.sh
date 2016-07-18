#!/bin/bash
if [ -z $1 ]; then echo "Do not set new name"; else sed -i -e "s/my_project/$1/g" docker-compose.yaml; fi
