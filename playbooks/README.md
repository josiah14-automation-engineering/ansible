# TODO LIST for Ansible Playbook

0. Figure out how to tell ansible where servers are before they have static IP setup.
1. Ansible gets all servers set-up with static IP
  - Gandalf - 192.168.0.11
  - Gollum - 192.168.0.20
  - Frodo - 192.168.0.21
  - Samwise - 192.168.0.22
2. Ansible configures Gandalf server as DNS Master and runs the DNS Master service
3. Ansible configures all 4 servers to use the DNS Master to resolve the server names to their IPs
4. Ansible configures SSH on all 4 servers so that only passwordless SSH keys can be used (no passwords).  Will need to allow root login for Hadoop later, unfortunately.
5. BONUS: rig up systems to use the LastPass CLI client to grab the SSH key passwords and add each SSH key to the SSH Agent on system boot.
6. BONUS: rewrite so that DNS works with DHCP to resolve host names to dynamic ip addresses of servers in cluster.

---
## Getting ready for Hadoop

6. Disable SELinux and firewalld through Ansible, also.

As far as I know, this should get the system ready for CDH installation.

Cloudera Manager: Flume Configuration -> plugin directories: defaults -> /usr/lib/flume-ng/plugins.d /twitter/lib/twitter-source.jar /mobile-app/lib/mobilesource.jar, /var/lib/flume-ng/plugins.d

External Data Stream -> Flume Source -> Flume Channel (queue/cache) -> Sink (sends to HDFS)
