#!/usr/bin/env bash
file_path=`pwd`
dds_volume_map=""
container=`basename $file_path`"_opendds-f"
image="objectcomputing/opendds_ros2:DDS-3.15"
nethost=""
while getopts ":hp:c:i:d:n" opt; do
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
    d )
        dds_volume_map="-v "$OPTARG":/opt/OpenDDS/"
    ;;
    n )
        nethost="--net=host"
    ;;
    h ) echo "options: [-p] path/to/volume/map [-c] container name [-i] image name [-d] dds source path [-n] use --net=host option to share host network"
    exit
    ;;
esac
done

docker ps -f "name=$container"|grep -v CONTAINER >/dev/null
start_container=$?
if [ $start_container == 1 ]; then
    echo "starting "$container" at "$file_path" from "$image
    docker run $nethost -d --rm --name $container $dds_volume_map -v $file_path:/opt/workspace $image bash -c "while true; do sleep 5; done"
fi
docker exec -it $container bash
