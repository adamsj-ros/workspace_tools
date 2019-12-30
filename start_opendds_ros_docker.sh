#!/usr/bin/env bash
file_path=$HOME
container="opendds-e"
image="adamsjoci/opendds_ros2_docker:latest"
start_container="no"
while getopts ":hp:c:i:s" opt; do
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
    s ) 
        start_container="yes"
    ;;    
    h ) echo "options: [-p] path/to/volume/map [-c] container name [-i] image name [-s] start the container then connect"
    exit
    ;;
esac
done

if [ $start_container == "yes" ]; then
    echo "starting "$container" at "$file_path" from "$image
    docker run -d --rm --name $container -v $file_path:/opt/workspace $image bash -c "while true; do sleep 5; done"
fi
docker exec -it $container bash
