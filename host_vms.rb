# To use with irb, first start irb
# Then run:  load './host_vms.rb'
@vms = Hash.new

@vms[:crowd] = {box: "bento/ubuntu-14.04",
              ip: "192.168.7.81",
              cpus: 1,
              ram: 1024,
              host_name: "crowd",
              pre_install: {file: "provisioning/crowd/pre_install.sh", privileged: false},
              install: {file: "provisioning/crowd/crowd_provision.sh", privileged: true},
              ports: [
                       {host_port: 8095, guest_port: 8095, id: "crowd"},
                     ],
              files: [
                       {source: "files/crowd/crowd-init.properties", destination: "crowd-init.properties"},
                     ]
              }

@vms[:jira] = {box: "bento/ubuntu-14.04",
              ip: "192.168.7.82",
              cpus: 2,
              ram: 2048,
              host_name: "jira",
              pre_install: {file: "provisioning/jira/pre_install.sh", privileged: false},
              install: {file: "provisioning/jira/jira_provision.sh", privileged: true},
              ports: [
                       {host_port: 8080, guest_port: 8080, id: "jira"},
                       {host_port: 8005, guest_port: 8005, id: "jira-rmi"}
                     ],
              files: [
                       {source: "files/jira/response.varfile", destination: "response.varfile"},
                     ]
              }

@vms[:confluence] = {box: "bento/ubuntu-14.04",
              ip: "192.168.7.83",
              cpus: 1,
              ram: 1024,
              host_name: "jira",
              pre_install: {file: "provisioning/confluence/pre_install.sh", privileged: false},
              install: {file: "provisioning/confluence/confluence_provision.sh", privileged: true},
              ports: [
                       {host_port: 8090, guest_port: 8090, id: "confluence"},
                       {host_port: 8000, guest_port: 8000, id: "confluence-rmi"}
                     ],
              files: [
                       {source: "files/confluence/response.varfile", destination: "response.varfile"},
                     ]
              }


@vms[:bitbucket] = {box: "bento/ubuntu-14.04",
              ip: "192.168.7.84",
              cpus: 1,
              ram: 2048,
              host_name: "bitbucket",
              pre_install: {file: "provisioning/bitbucket/pre_install.sh", privileged: false},
              install: {file: "provisioning/bitbucket/bitbucket_provision.sh", privileged: true},
              ports: [
                       {host_port: 8084, guest_port: 7990, id: "bitbucket"},
                       {host_port: 8006, guest_port: 8006, id: "bitbucket-control"}
                     ],
              files: [
                       {source: "files/bitbucket/response.varfile", destination: "response.varfile"},
                     ]
              }

