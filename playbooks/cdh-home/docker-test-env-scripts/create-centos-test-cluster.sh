#!/bin/bash -
# TODO: First, a Dockerfile which use centos:7.4.1708 as the base image,
#       run an SSH server, and have a user that can SSH to the boxes need to be
#       created.  This will be assumed to be the the original state of a physical
#       node with a fresh install of CentOS 7.4 on it.  The Dockerfile should not
#       do any more than the bare minimum.
# TODO: Write this scipt such that 4 containers are created on subnet
#       192.169.0.0/16
#===============================================================================
#
#          FILE: create-centos-test-cluster.sh
#
#         USAGE: ./create-centos-test-cluster.sh
#
#   DESCRIPTION: Creates a test cluster of 4 CentOS 7.4 Docker containers for
#                testing Ansible scripting.
#
#       OPTIONS:
#  REQUIREMENTS: The Docker subnetwork on 192.169.0.0/16 has been created.
#          BUGS:
#         NOTES:
#        AUTHOR: Josiah Berkebile
#  ORGANIZATION:
#       CREATED: 03/11/2018 03:19:26 AM
#      REVISION: 0
#===============================================================================

set -o nounset                                  # Treat unset variables as an error

sudo docker run --rm -d centos:7.4.1708 --net ansinet --ip 192.169.0.11 & # Gandalf
sudo docker run --rm -d centos:7.4.1708 --net ansinet --ip 192.169.0.20 & # Gollum
sudo docker run --rm -d centos:7.4.1708 --net ansinet --ip 192.169.0.21 & # Frodo
sudo docker run --rm -d centos:7.4.1708 --net ansinet --ip 192.169.0.22 & # Samwise

wait # wait for the containers to finish starting before exiting the script.
