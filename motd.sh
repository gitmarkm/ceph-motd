#!/bin/bash
fggrn="$(tput setaf 2)"
fgyel="$(tput setaf 3)"
fgmag="$(tput setaf 5)"
fgcyn="$(tput setaf 6)"
fgrset="$(tput sgr0)"
clear
printf 'Calulating usage ... ';printf '\r'
hostName=`hostname -s`
health=`ceph health`
ceph status > /tmp/motdStats.txt
monNode=`grep election /tmp/motdStats.txt | awk '{print $6}'`
spaceUsed=${fgyel}`grep used /tmp/motdStats.txt | awk '{print $1}'`${fgrset}
spaceUsedUOM=${fgyel}`grep used /tmp/motdStats.txt | awk '{print $2}'`${fgrset}
spaceTotal=${fgyel}`grep used /tmp/motdStats.txt | awk '{print $7}'`${fgrset}
spaceTotalUOM=${fgyel}`grep used /tmp/motdStats.txt | awk '{print $8}'`${fgrset}
osdsTotal=${fgyel}`grep osdmap /tmp/motdStats.txt | awk '{print $3}'`${fgrset}
osdsUp=${fgyel}`grep osdmap /tmp/motdStats.txt | awk '{print $5}'`${fgrset}
osdsIn=${fgyel}`grep osdmap /tmp/motdStats.txt | awk '{print $7}'`${fgrset}
OSDnode1=`ceph osd tree | grep "\-2" | cut -d " " -f 8`
OSDnode2=`ceph osd tree | grep "\-3" | cut -d " " -f 8`
monIP=${fgcyn}`grep ${monNode}\$ /etc/hosts | awk '{printf $1}'`${fgrset}
monStorIP=${fgmag}`grep ${monNode}-stor\$ /etc/hosts | awk '{printf $1}'`${fgrset}
OSDnode1IP=${fgcyn}`grep ${OSDnode1}\$ /etc/hosts | awk '{printf $1}'`${fgrset}
OSDnode2IP=${fgcyn}`grep ${OSDnode2}\$ /etc/hosts | awk '{printf $1}'`${fgrset}
OSDnode1StorIP=${fgmag}`grep ${OSDnode1}-stor\$ /etc/hosts | awk '{printf $1}'`${fgrset}
OSDnode2StorIP=${fgmag}`grep ${OSDnode2}-stor\$ /etc/hosts | awk '{printf $1}'`${fgrset}
echo -e "#=========================================================================
# DEBU NFV Storage Cluster powered by:                  Usage
#$fgyel                 _       _  ___   ____    _ $fgrset --------------------------- 
#$fgyel   ___ ___ _ __ | |__   / |/ _ \ |___ \  / | $fgrset OSDs Total    : $osdsTotal
#$fgyel  / __/ _ \ '_ \| '_ \  | | | | |  __) | | | $fgrset OSDs Up / In  : $osdsUp / $osdsIn
#$fgyel | (_|  __/ |_) | | | | | | |_| | / __/ _| | $fgrset Storage Total : $spaceTotal $spaceTotalUOM
#$fgyel  \___\___| .__/|_| |_| |_|\___(_)_____(_)_| $fgrset Storage Used  : $spaceUsed $spaceUsedUOM
#$fgyel          |_|                               $fgrset ---------------------------
# Kernel: `uname -r`           Cluster Status: \e[33m$health\e[0m
# OS release: `cat /etc/redhat-release | awk '{print $1 " " $2 " " $4 " " $5}'`    --------------------------- 
#=========================================================================
# Ceph Monitor Node...: ${fggrn}${monNode}${fgrset} (oam:${monIP})  (storage:${monStorIP})
# Ceph OSD Nodes .....: ${fggrn}${OSDnode1}${fgrset} (oam:${OSDnode1IP})  (storage:${OSDnode1StorIP})
#                     : ${fggrn}${OSDnode2}${fgrset} (oam:${OSDnode2IP})  (storage:${OSDnode2StorIP})
#=========================================================================
# ${hostName} uptime: `uptime -p`
"
