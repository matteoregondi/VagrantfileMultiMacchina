Vagrant.configure("2") do |config|
  # Installo vagrant-proxyconf  se non esite
 if Vagrant.has_plugin?("vagrant-proxyconf")
  puts "vagrant-proxyconf plugin already installed"
 else
  puts "Installing vagrant-proxyconf plugin"
  system "vagrant plugin install vagrant-proxyconf"
 end

 # Setup  proxy
 PROXY="http://10.20.5.51:8888"
 ENABLE_PROXY=true
 BASE_INT_NETWORK_DB="10.10.20.11"
 BASE_INT_NETWORK_WEB="10.10.20.10"
 BASE_HOST_ONLY_NETWORK="192.168.56.10"



  # definisco la prima Vm Web
  config.vm.define "web.m340" do |web|
    web.vm.box = "ubuntu/jammy64"
    web.vm.network "private_network", ip: BASE_HOST_ONLY_NETWORK
    web.vm.network "private_network", ip: BASE_INT_NETWORK_WEB, virtualbox__intnet:true
 
    web.vm.provider "virtualbox" do |vb|
      vb.name="web.m340"
      vb.memory = "4096"
      vb.cpus = 2
      vb.gui=true
    end
    if ENABLE_PROXY
       web.proxy.http=PROXY
    end  
    web.vm.provision "shell", path: "Scripts/Web.sh"
    web.vm.synced_folder "./Site", "/var/www/html"
  end

  # definisco la seconda Vm Db
  config.vm.define "db.m340" do |db|
    db.vm.box = "ubuntu/jammy64"
    db.vm.network "private_network", ip: BASE_INT_NETWORK_DB, virtualbox__intnet:true
    db.vm.provider "virtualbox" do |vb|
      vb.name="db.m340"
      vb.memory = "4096"
      vb.cpus = 1
      vb.gui=true
    end
    if ENABLE_PROXY
      db.proxy.http=PROXY
    end  
    db.vm.provision "shell", path: "Scripts/Db.sh"

      
  end

end