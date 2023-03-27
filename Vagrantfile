Vagrant.configure(2) do |config|

  config.vm.synced_folder ".", "/vagrant", disabled: true
  config.vm.provider "virtualbox"
  #config.ssh.private_key_path = 'C:\\packer\\astra1.7.3\\vagrant-key'
  config.ssh.private_key_path = '/mnt/c/packer/astra1.7.3/vagrant-key'


  config.vm.provider "virtualbox" do |v|
    v.memory = 4096
    v.cpus = 4
    v.linked_clone = true
  end

  config.vm.define "dc1" do |dc1|
    dc1.vm.box = "astra-1.7.3-orel-base"
    dc1.vm.hostname = "dc1"
    dc1.vm.network :forwarded_port, guest: 22, host: 9022, id: "ssh"
    dc1.vm.network "private_network", ip: "192.168.56.51"

    dc1.vm.provision "ansible" do |ansible|
      ansible.verbose = "v"
      #ansible.playbook = ".\\ansible\\aldpro.yml"
      ansible.playbook = "./ansible/aldpro.yml"
      ansible.inventory_path = "hosts.ini"
    end

  end

  #dc1.vm.provider "virtualbox" do |vb|
  #  vb.customize ["modifyvm", :id, "--nic3", "natnetwork"]
  #  vb.customize ["modifyvm", :id, "--nat-network3", "AstraNatNetwork"]
  #end

  #dc1.vm.provision "shell", inline: <<-SHELL
  #  if ! ifquery eth2 > /dev/null 2>&1; then
  #    sudo echo "allow-hotplug eth2" >> /etc/network/interfaces
  #    sudo echo "iface eth2 inet static" >> /etc/network/interfaces
  #    sudo echo "    address 10.0.1.100" >> /etc/network/interfaces
  #    sudo echo "    netmask 255.255.255.0" >> /etc/network/interfaces
  #    sudo ifup eth2
  #    ip -4 a show dev eth2
  #  fi
  #SHELL

  #config.vm.define "srv" do |srv1|
  #  srv1.vm.box = "astra-1.7.3-smolensk-fly"
  #  srv1.vm.hostname = "srv1"
  #  srv1.vm.network "private_network", ip: "192.168.56.12"
  #end
end
