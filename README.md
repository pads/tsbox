tsbox
=====

tsbox is a Vagrant configuration to provision a virtual machine with [TiddlySpace](http://tiddlyspace.com/).

Requires
========

* [VirtualBox](https://www.virtualbox.org/)
* [Vagrant](http://vagrantup.com/) 

How
===

Before beginning, choose a suitable virtual machine from http://www.vagrantbox.es/
This configuration supports Debian-based installations and has been tested against Squeeze (v6).

Clone this repository, enter the directory and run:

	vagrant box add <box_url> tsbox

Replace <box_url> with a suitable virtual machine e.g. http://puppet-vagrant-boxes.puppetlabs.com/debian-606-x64.box

Then run:

	vagrant up

The virtual machine will start and once up and running, install and configure TiddlySpace.  To gain access to the box run:

	vagrant ssh

For further help around vagrant run:

	vagrant -h

Web Access
==========

The server is setup to run under the DNS name of tiddlyspace.org and ports 8000 and 8081 are forwarded to the host.

To enable subdomains to work so that you can access spaces, install and configure dnsmasq.

If all goes well, access:

	http://tiddlyspace.org:8000

To do
=====

Some things that could be done:

* Make things secure.
* Provide optional components (e.g. twikifier).
* Support other operating systems and configurations.
* Create a custom box file.
