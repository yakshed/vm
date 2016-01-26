# -*- mode: ruby -*-
Vagrant.configure(2) do |config|
  config.vm.box = "bascht/vm"

  config.ssh.username = "bascht"
  config.ssh.password = "bascht"
  config.ssh.insert_key = true

  config.vm.provider :libvirt do |libvirt|
    libvirt.memory = 4096
    libvirt.cpus = 4
    libvirt.random_hostname = true
  end

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "playbook.yml"
  end

  config.vm.synced_folder '~/Documents', '/home/bascht/Documents', type: 'nfs'
  config.vm.synced_folder '~/.homesick/', '/home/bascht/.homesick', type: 'rsync'
end
