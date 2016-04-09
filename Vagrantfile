Vagrant.configure("2") do |config|
    config.vm.define 'web' do |config|
        config.vm.box = 'ubuntu/trusty64'
        config.vm.hostname = 'web'
        config.vm.synced_folder '.', '/vagrant', disabled: true
    end
end
