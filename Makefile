up: roles
	git pull -r
	vagrant up --provider=libvirt --provision
	vagrant ssh -- -A

roles:
	ansible-galaxy install -r requirements.yml  -p roles

