# -*- mode: ruby -*-
VM_NAME=File.basename(File.dirname(__FILE__))
AVAILABLE_MEMORY=`free -m`.lines[1].split(" ")[1].to_i / 1024

Vagrant.configure(2) do |config|
  config.vm.box = "bascht/vm"
  config.vm.box_version = ">= 0.9.3"
  config.vm.hostname = "DevVm"
  config.ssh.username = "bascht"
  config.ssh.password = "bascht"
  config.ssh.insert_key = true

  config.vm.provider :libvirt do |libvirt|
    libvirt.memory = AVAILABLE_MEMORY > 16 ? 4069 : 2048
    libvirt.cpus = 4
    libvirt.random_hostname = true
    libvirt.cpu_mode = "host-model"
    libvirt.nested = true
    libvirt.storage :file,
                    :path => "#{VM_NAME}Home",
                    :device => "vdh",
                    :size => "15G",
                    :allow_existing => true
  end

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "ansible/playbook.yml"
    ansible.extra_vars = {
      ansible_shell_executable: '/bin/bash',
      vm_hostname: VM_NAME }
  end

  config.vm.synced_folder '~/Documents', '/home/bascht/Documents', type: 'sshfs'
  config.vm.synced_folder './', '/vagrant', type: 'sshfs'
  config.vm.synced_folder '~/.homesick/repos/private', '/home/bascht/.homesick/repos/private', type: 'rsync'
  config.vm.synced_folder '~/.local/share/fonts', '/home/bascht/.local/share/fonts', type: 'rsync'
end
