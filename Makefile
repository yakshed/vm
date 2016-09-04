up: ansible/roles
	git pull -r
	vagrant up --provider=libvirt --provision
        IP=`vagrant ssh-config|grep HostName| cut -d " " -f 4`
        mount $IP:/home/bascht/Code ~/Documents/Code/wemakeit/Code
	vagrant ssh -- -A

../Code/Makefile:
	IP=`vagrant ssh-config|grep HostName| cut -d " " -f 4`
	mount $IP:/home/bascht/Code ~/Documents/Code/wemakeit/Code

ansible/roles:
	cd ansible; ansible-galaxy install -r requirements.yml  -p roles
