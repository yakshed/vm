# -*- mode: ruby -*-
VM_NAME=File.basename(File.dirname(__FILE__))
AVAILABLE_MEMORY=`free -m`.lines[1].split(" ")[1].to_i / 1024
BOOTSTRAPPED=File.exist?("#{ENV['VAGRANT_DOTFILE_PATH']}/machines/default/libvirt/action_provision")

Vagrant.configure(2) do |config|
  config.vm.box_version = ">= 1.9.4"
  config.vm.box = "generic/ubuntu1804"
  config.vm.hostname = "DevVm"

  config.vm.provider :libvirt do |libvirt|
    libvirt.memory = AVAILABLE_MEMORY > 16 ? 4069 : 2048
    libvirt.cpus = 4
    libvirt.random_hostname = true
    libvirt.cpu_mode = "host-model"
    libvirt.nested = true
    libvirt.management_network_address = "10.40.0.0/24"
    libvirt.storage :file,
                    :path => "#{VM_NAME}Home",
                    :serial => "code",
                    :size => "15G",
                    :allow_existing => true
    libvirt.storage :file,
                    :path => "#{VM_NAME}Docker",
                    :serial => "docker",
                    :size => "25G",
                    :allow_existing => true
  end

  if BOOTSTRAPPED
    config.ssh.username = "bascht"
    config.ssh.password = "bascht"
    config.vm.provision "shell", path: "ansible/bootstrap.sh"

    config.vm.provision "ansible" do |ansible|
      ansible.playbook = "ansible/playbook.yml"
      ansible.extra_vars = {
        ansible_shell_executable: '/bin/bash',
        vm_hostname: VM_NAME.sub(/Vm$/, "").downcase + ".vm.bascht.space" }
    end
  else
    config.vm.provision "shell", path: "vagrant-bootstrap.sh"
  end

  config.vm.synced_folder '~/Documents', '/home/bascht/Documents', type: 'sshfs'
  config.vm.synced_folder './', '/vagrant', type: 'sshfs'
  config.vm.synced_folder '~/.homesick/repos/', '/home/bascht/.homesick/repos/', type: 'sshfs'
  config.vm.synced_folder '~/.local/share/fonts', '/home/bascht/.local/share/fonts', type: 'sshfs'
end
