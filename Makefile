up: ansible/roles
	git pull -r
	vagrant up --provider=libvirt --provision
	vagrant ssh -- -A

ansible/roles:
	cd ansible; ansible-galaxy install -r requirements.yml  -p roles
