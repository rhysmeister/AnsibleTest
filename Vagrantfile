Vagrant.configure("2") do |config|
  config.vm.box = "centos/7"
  # Add 4GB RAM
  config.vm.provider :virtualbox do |vb|
    vb.name = "AnsibleTest"
    vb.customize [
      "modifyvm", :id,
      "--name", "AnsibleTest",
      "--memory", "4096"
    ]
  end

  config.vm.hostname = "AnsibleTest"

  config.vm.provision :ansible do |ansible|
    ansible.playbook = "AnsibleTest.yml"
  end

end
