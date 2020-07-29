# -*- mode: ruby -*-
# vi: set ft=ruby :

# frozen_string_literal: true

specs = {
  mem: 2048,
  cpus: 2
}

Vagrant.configure('2') do |config|
  config.vm.box = 'generic/ubuntu2004'
  config.vm.provider 'virtualbox' do |vb|
    vb.cpus = specs[:cpus]
    vb.mem = specs[:mem]
  end

  # config.vm.provision :shell, inline:
  # end
end
