#!/bin/bash
# Requires first that the Docker subnetwork has been created.
# TODO Edit the Dockerfile for the ansible container to have a non-root user to use for SSHing into the container.

sudo docker run --it -v $(pwd):/ansible/playbooks --net ansinet --ip 192.169.0.10 josiah14/ansible:2.4.1.0_rev0
