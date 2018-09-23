#!/bin/sh


#list the masters, nodes, and all of the host groups.
echo 'ansible all --list-hosts'
ansible all --list-hosts

#Verify that all of your hosts are running
echo 'ansible all -m ping'
ansible all -m ping

#Verify Installation and Configuration of Docker
echo 'ansible nodes -m shell -a"systemctl status docker | grep Active"'
ansible nodes -m shell -a"systemctl status docker | grep Active"

#Make sure that the Docker version is correct for the desired OpenShift version
echo 'ansible nodes -m shell -a"docker version|grep Version"'
ansible nodes -m shell -a"docker version|grep Version"


#List the repositories on the bastion host
echo 'yum repolist'
yum repolist

#List the repositories on all the other hosts
echo 'ansible all -m shell -a"yum repolist"'
ansible all -m shell -a"yum repolist"

#Examine the NFS server to see which NFS volumes are shared
echo 'ansible nfs -m shell -a"exportfs"'
ansible nfs -m shell -a"exportfs"


#On the bastion host, install the atomic-openshift-utils and atomic-openshift-clients package , already installed
echo 'yum -y install atomic-openshift-utils atomic-openshift-clients'
yum -y install atomic-openshift-utils atomic-openshift-clients

