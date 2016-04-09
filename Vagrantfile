# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = '2'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    config.vm.define 'web' do |config|
        config.vm.box = 'ubuntu/trusty64'
        config.vm.hostname = 'web'
        config.vm.synced_folder '.', '/vagrant', disabled: true
    end
end
