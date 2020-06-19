#!/usr/bin/env bash
file_path=`pwd`
container=`basename $file_path`"_opendds-e"
image="objectcomputing/opendds_ros2:latest"
while getopts ":hp:c:i:" opt; do
case ${opt} in
    p )
        file_path=$OPTARG
    ;;
    c )
        container=$OPTARG
    ;;
    i )
        image=$OPTARG
    ;;
    h ) echo "options: [-p] path/to/volume/map [-c] container name [-i] image name"
    exit
    ;;
esac
done

docker ps -f "name=$container"|grep -v CONTAINER >/dev/null
start_container=$?
if [ $start_container == 1 ]; then
    echo "starting "$container" at "$file_path" from "$image
    docker run -d --rm --name $container -v $file_path:/opt/workspace $image bash -c "while true; do sleep 5; done"
fi
docker exec -it $container bash
