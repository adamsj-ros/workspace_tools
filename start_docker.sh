#!/usr/bin/env bash

usage()
{
    printf "defaults:\n image = %s\n tag = %s\n both = %s\n container = %s\n path = %s\n net host = %s\n shell = %s\n" $image $tag $imagetag $container $file_path $network $shell
    printf "options:\n [-i] image name\n [-t] change tag\n [-b] both image and tag\n [-c] container name\n [-p] path/to/volume/map\n [-n] use another netowrk option like none, host, a container net, or docker network\n [-z] use zsh (if installed in image) \n"
}

file_path=`pwd`
container=`basename $file_path`"-container"
image="ros"
tag="foxy"
imagetag=$image":"$tag
prev_image=$image
prev_tag=$tag
network="host"
shell="bash"

while getopts ":hp:c:i:n:t:b:z" opt; do
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
    n )
        #https://docs.docker.com/engine/reference/run/#network-settings
        #none, bridge, host, container:, or network
        network=$OPTARG
    ;;
    t )
        tag=$OPTARG
    ;;
    b )
        imagetag=$OPTARG
    ;;
    z )
        shell="zsh"
    ;;
    h )
        usage
        exit
    ;;
esac
done


docker ps -f "name=$container"|grep -v CONTAINER >/dev/null
start_container=$?
if [ $start_container == 1 ]; then
    if [ $image != $prev_image ] || [ $tag != $prev_tag ];then
        imagetag=$image":"$tag
        echo "changing image:tag to "$imagetag
    else
        echo "using default image:tag = "$imagetag
    fi
    echo "starting "$container" at "$file_path" from "$imagetag
    if [ `uname` = "Darwin" ];then
        docker run --net=$network -d --rm --name $container -v $file_path:/opt/workspace $imagetag $shell -c "while true; do sleep 5; done"
    elif [ `uname` = "Linux" ];then
        #https://github.com/osrf/rocker#installation
        rocker --home --oyr-run-arg " --privileged" --name $container --network $network --nvidia --ssh --user --x11 $imagetag $shell
    fi
fi

if [[ `uname` = "Darwin" || ( $start_container == 0 && `uname` = "Linux" ) ]];then
    docker exec -it -w $file_path $container $shell
fi
