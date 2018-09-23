#!/bin/sh

echo -e '*****************************************************'
echo -e "copy .kube file to bastion host"
echo -e '*****************************************************\n'

ansible masters[0] -b -m fetch -a "src=/root/.kube/config dest=/root/.kube/config flat=yes"

echo -e '\n\n*****************************************************'
echo -e "Verify user is system:admin"
echo -e '*****************************************************\n'

oc whoami

echo -e '\n\n*****************************************************'
echo -e 'check all node'
echo -e '*****************************************************\n'
oc get nodes --show-labels

echo -e '\n\n*****************************************************'
echo -e 'Check pod status'
echo -e '*****************************************************\n'

oc get pod --all-namespaces -o wide
