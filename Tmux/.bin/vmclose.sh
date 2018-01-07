#!/bin/bash
# Close a vm by the name

read -p 'Please type a vm name for Close: ' vm

echo
echo '=============================='
echo " You type VM is: $vm"
echo '=============================='
echo
VBoxManage controlvm $vm acpipowerbutton 
