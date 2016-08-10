# -*- mode: ruby -*-
Vagrant.configure(2) do |config|
  config.vm.box = "bascht/vm"
  config.vm.box_version = ">= 0.1.53"

  config.ssh.username = "bascht"
  config.ssh.password = "bascht"
  config.ssh.insert_key = true

  config.vm.provider :libvirt do |libvirt|
    libvirt.memory = 4096
    libvirt.cpus = 4
    libvirt.random_hostname = true
    libvirt.cpu_mode = "host-model"
    libvirt.nested = true
  end

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "ansible/playbook.yml"
  end

  config.vm.synced_folder '~/Documents', '/home/bascht/Documents', type: 'sshfs'
  config.vm.synced_folder '~/.homesick/', '/home/bascht/.homesick', type: 'rsync'
end
