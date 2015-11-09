# -*- mode: ruby -*-
Vagrant.configure(2) do |config|
  config.vm.box = "s3than/trusty64"

  config.vm.provider :libvirt do |libvirt|
    libvirt.memory = 4096
    libvirt.cpus = 4
  end

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "playbook.yml"
  end

  config.vm.synced_folder '~/Documents', '/home/vagrant/Documents', type: 'nfs'
  config.vm.synced_folder '~/.homesick/', '/home/vagrant/.homesick', type: 'rsync'
end
