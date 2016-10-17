# README - Atlassian Suite Vagrant Based VMs

Prerequisites:

  1. VirtualBox 5.1.6+
  2. Vagrant 1.8.6+


This Virtual Machine provides:

  1.  Crowd 2.10.1
  2.  Jira 7.2.1 
  3.  Confluence 5.10.4
  4.  Bitbucket  4.10.1


Using vagrant up will spin up the Crowd server and Jira server, with Crowd being 
the default.  Both the Confluence and Bitbucket servers are set to auto-start
false so they will not be started automatically with the vagrant up.


### Clone this repo:

```
cd /path/to/where/you/will/clone (e.g. cd ~/Documents/VIRTUAL_MACHINES)
https://github.com/hogihung/vagrant_atlassian_suite.git
cd vagrant_atlassian_suite
```

### Start the Vagrant VM and Log In

```
vagrant up
vagrant ssh   # this will log you in to the Crowd server
```

Once logged in to the Crowd server using the above vagrant ssh, you can connect
to the Jira server by doing:

```
ssh 192.168.7.82
```

Alternatively, you can login to the Jira server, or Confluence and Bamboo
assuming they are up, using:

```
vagrant ssh [name]

Examples:
vagrant ssh jira
vagrant ssh confluencie
vagrant ssh bitbucket
```


To start either the Confluence or Bitbucket servers use:

  1.  vagrant up confluence
  2.  vagrant up bitbucket


The Vagrantfile and related files and provisioning files will create an Atlassian
Suite of applications consisting of Crowd, Jira, Confluence and Bitbucket.  The
provisioning only installs the respective software.  Please follow the setup and
configuration instructions for each application on the Atlassian web site.

Also note, that you will need to apply for or use your Licenses for each product.
No licenses are provided in this repo.


Note:  The file host_vms.rb is not currently used.  Sometime in the future I'd 
       like to be able to use that file to define the target host VMs and let
       the Vagrantfile iterate over the hash.
