# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = '2'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # Ensure we use our vagrant private key
  config.ssh.insert_key = false
  config.ssh.private_key_path = '~/.vagrant.d/insecure_private_key'

  config.vm.define 'ansibleflask.local' do |machine|
    machine.vm.box = 'ubuntu/trusty64'

    machine.vm.network :private_network, ip: '192.168.88.22'
    machine.vm.hostname = 'ansibleflask.local'
    machine.vm.synced_folder '.', '/vagrant', disabled: true

    machine.vm.provision "ansible" do |ansible|
      ansible.verbose = "v"
      ansible.playbook = "tests/test.yml"
      ansible.sudo = true
      ansible.inventory_path = 'vagrant-inventory'
      ansible.host_key_checking = false
    end
  end
end
