#!/usr/bin/env bash
set -eo pipefail

RED='\033[1;31m'
NC='\033[0m' # No Color
FORK=automaticrippingmachine
TAG=latest
function usage() {
    echo -e "\nUsage: setup.sh [OPTIONS]"
    echo -e " -f <fork>\tSpecify the fork to pull from on DockerHub. \n\t\tDefault is \"$FORK\""
    echo -e " -t <tag>\tSpecify the tag to pull from on DockerHub. \n\t\tDefault is \"$TAG\""
}

while getopts 'f:t:' OPTION
do
    case $OPTION in
    f)    FORK=$OPTARG
          ;;
    t)    TAG=$OPTARG
          ;;
    ?)    usage
          exit 2
          ;;
    esac
done
IMAGE="$FORK/automatic-ripping-machine:$TAG"

function install_reqs() {
    apt update -y && apt upgrade -y
    apt install -y curl lsscsi
}

function add_arm_user() {
    echo -e "${RED}Adding arm user${NC}"
    # create arm group if it doesn't already exist
    if ! [[ "$(getent group arm)" ]]; then
        groupadd arm
    else
        echo -e "${RED}arm group already exists, skipping...${NC}"
    fi

    # create arm user if it doesn't already exist
    if ! id arm >/dev/null 2>&1; then
        useradd -m arm -g arm
        passwd arm
    else
        echo -e "${RED}arm user already exists, skipping...${NC}"
    fi
    usermod -aG cdrom,video arm
}

function setup_mountpoints() {
    echo -e "${RED}Creating mount points${NC}"
    for dev in /dev/sr?; do
        mkdir -p "/mnt$dev"
    done
    chown arm:arm /mnt/dev/sr*
}

# start here
install_reqs
add_arm_user
setup_mountpoints

echo -e "${RED}Installation complete. A template command to run the ARM container is located in: $(echo ~arm) ${NC}"
