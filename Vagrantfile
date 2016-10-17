#load './host_vms.rb'

Vagrant.configure("2") do |config|

  config.vm.define "crowd", primary: true do |crowd|
    crowd.vm.box = "bento/ubuntu-14.04"
    crowd.vm.hostname = 'crowd'

    crowd.vm.network :private_network, ip: "192.168.7.81"

    crowd.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--memory", 2048]
      v.customize ["modifyvm", :id, "--name", "crowd"]
    end

    crowd.vm.provision "file", source: "files/crowd/crowd-init.properties", destination: "crowd-init.properties"
    crowd.vm.provision "shell", path: "provisioning/crowd/pre_install.sh", privileged: true
    crowd.vm.provision "shell", path: "provisioning/crowd/crowd_provision.sh", privileged: true

    crowd.vm.network "forwarded_port", guest: 8095, host: 8081, id: "crowd"
  end

  config.vm.define "jira" do |jira|
    jira.vm.box = "bento/ubuntu-14.04"
    jira.vm.hostname = 'jira'

    jira.vm.network :private_network, ip: "192.168.7.82"

    jira.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--cpus", 2]
      v.customize ["modifyvm", :id, "--memory", 2048]
      v.customize ["modifyvm", :id, "--name", "jira"]
    end

    jira.vm.provision "file", source: "files/jira/response.varfile", destination: "response.varfile"
    jira.vm.provision "shell", path: "provisioning/jira/pre_install.sh", privileged: true
    jira.vm.provision "shell", path: "provisioning/jira/jira_provision.sh", privileged: true

    jira.vm.network "forwarded_port", guest: 8080, host: 8082, id: "jira"
    jira.vm.network "forwarded_port", guest: 8005, host: 9082, id: "jira-rmi"
  end

  config.vm.define "confluence", autostart: false do |confluence|
    confluence.vm.box = "bento/ubuntu-14.04"
    confluence.vm.hostname = 'confluence'

    confluence.vm.network :private_network, ip: "192.168.7.83"

    confluence.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--memory", 2048]
      v.customize ["modifyvm", :id, "--name", "confluence"]
    end

    confluence.vm.provision "file", source: "files/confluence/response.varfile", destination: "response.varfile"
    confluence.vm.provision "shell", path: "provisioning/confluence/pre_install.sh", privileged: true
    confluence.vm.provision "shell", path: "provisioning/confluence/confluence_provision.sh", privileged: true

    confluence.vm.network "forwarded_port", guest: 8080, host: 8083, id: "confluence"
    confluence.vm.network "forwarded_port", guest: 8005, host: 9083, id: "confluence-rmi"
  end

  config.vm.define "bitbucket", autostart: false do |bitbucket|
    bitbucket.vm.box = "bento/ubuntu-14.04"
    bitbucket.vm.hostname = 'bitbucket'

    bitbucket.vm.network :private_network, ip: "192.168.7.84"

    bitbucket.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--memory", 2048]
      v.customize ["modifyvm", :id, "--name", "bitbucket"]
    end
 
    bitbucket.vm.provision "file", source: "files/bitbucket/response.varfile", destination: "response.varfile"
    bitbucket.vm.provision "shell", path: "provisioning/bitbucket/pre_install.sh", privileged: true
    bitbucket.vm.provision "shell", path: "provisioning/bitbucket/bitbucket_provision.sh", privileged: true

    bitbucket.vm.network "forwarded_port", guest: 7990, host: 8084, id: "bitbucket"
    bitbucket.vm.network "forwarded_port", guest: 8005, host: 9084, id: "bitbucket-control"
  end
end
