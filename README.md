# ceph-motd
motd addition to /etc/profile for simple status updates of ceph cluster

This bash script simply displays status of cluster and node identification for
a single Monitor node and two OSD nodes.  The "looping" structure for multiple
nodes and roles is not contained in this release.

To use:

 - Copy motd.sh to /usr/local/bin
 - Verify executable mode (chmod 755 motd.sh)
 - Add these two lines to the end of /etc/profile file by running this command:
   echo -e "\n# ceph cluster motd execution\n/usr/local/bin/motd.sh" >> /etc/profile
 - Verify /tmp is available to write.
 - Done.

--
markm
