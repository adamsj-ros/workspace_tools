#!/usr/bin/env bash

usage()
{
    printf "defaults:\n image = %s\n tag = %s\n both = %s\n container = %s\n path = %s\n dds path = %s\n net host = %s\n" $image $tag $imagetag $container $file_path $dds_volume_map $nethost
    printf "options:\n [-i] image name\n [-t] change tag\n [-b] both image and tag\n [-c] container name\n [-p] path/to/volume/map\n [-d] dds source path\n [-n] use --net=host option to share host network\n"
}

file_path=`pwd`
dds_volume_map=""
container=`basename $file_path`"_opendds-f"
image="objectcomputing/opendds_ros2"
tag="latest"
imagetag=$image":"$tag
prev_image=$image
prev_tag=$tag
nethost=""

while getopts ":hp:c:i:d:nt:b:" opt; do
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
    t )
        tag=$OPTARG
    ;;
    b )
        imagetag=$OPTARG
    ;;
    h )
        usage
        exit
    ;;
esac
done

echo "default image:tag = "$imagetag
if [ $image != $prev_image ] || [ $tag != $prev_tag ];then
    imagetag=$image":"$tag
    echo "changing image:tag to "$imagetag
fi

docker ps -f "name=$container"|grep -v CONTAINER >/dev/null
start_container=$?
if [ $start_container == 1 ]; then
    echo "starting "$container" at "$file_path" from "$imagetag
    docker run $nethost -d --rm --name $container $dds_volume_map -v $file_path:/opt/workspace $imagetag bash -c "while true; do sleep 5; done"
fi
docker exec -it $container bash
