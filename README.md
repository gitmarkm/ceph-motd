# ceph-motd
motd addition to /etc/profile for simple status updates of ceph cluster

This bash script simply displays status of cluster and node identification for
a single Monitor node and two OSD nodes.  The "looping" structure for multiple
nodes and roles is not contained in this release.

To use:

1. Copy motd.sh to /usr/local/bin
2. Verify executable mode (chmod 755 motd.sh)
3. Add these two lines to the end of /etc/profile file the following lines:

 # ceph cluster motd execution
 /usr/local/bin/motd.sh

4. Verify /tmp is available to write.
5. Done.

--
markm
