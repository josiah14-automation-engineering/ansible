#===============================================================================
#
#          FILE: base-baremetal-centos7-conf.sh
#
#         USAGE: ./base-baremetal-centos7-conf.sh
#
#   DESCRIPTION: Sets-up the base system needed for a CentOS 7 system to be
#                to be discoverable by Ansible, which will complete the
#                configuration procedure.
#
#       OPTIONS: NONE
# PREREQUISITES: NONE
#  REQUIREMENTS:
#                - yum is installed and the machine is connected to the internet.
#                - This script runs with sudo privileges.
#         NOTES: ---
#        AUTHOR: Josiah Berkebile
#  ORGANIZATION: Myself
#       CREATED: 04/15/2018 06:20:40 PM
#===============================================================================

# Treat undefined environment variables as an error
set -u

yum install -y openssh-server initscripts
sshd-keygen
/usr/sbin/sshd &
disown %1
echo 'root:root' | chpasswd

exit 0
