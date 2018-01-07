#!/bin/bash
# Start a vm by the name

read -p 'Please type a vm name for Start: ' vm

echo
echo '=============================='
echo " You type VM is: $vm"
echo '=============================='
echo
VBoxManage startvm $vm --type headless
