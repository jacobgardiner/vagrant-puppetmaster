#!/bin/bash

# If you're not root, exit
if [ "$EUID" -ne "0" ]; then
  echo "This script must be run as root." >&2
  exit 1
fi

# Install the puppetlabs repo
if ! rpm -qa | grep -qw puppetlabs-release; then
	rpm -ivh https://yum.puppetlabs.com/el/6/products/x86_64/puppetlabs-release-6-10.noarch.rpm
fi

# Install Puppet
if ! rpm -qa | grep -qw puppet; then
	yum install puppet -y
fi

# Disable iptables 
/etc/init.d/iptables stop
rm /etc/sysconfig/iptables

# Disable SELinux
sed -i 's/enforcing/permissive/' /etc/selinux/config
echo 0 >/selinux/enforce
