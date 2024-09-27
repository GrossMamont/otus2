MACHINES = {
    :"my-kernel-update" => {
                :box_name => "rockylinux/8",
                :box_version => "4.0.0",
                :cpus => 4,
                :memory => 4096,
              }
  }
  
  Vagrant.configure("2") do |config|
    MACHINES.each do |boxname, boxconfig|
      config.vm.synced_folder ".", "/vagrant"
      #config.vm.synced_folder ".", "/vagrant", type: "nfs"
      config.vm.define boxname do |box|
        box.vm.box = boxconfig[:box_name]
        box.vm.box_version = boxconfig[:box_version]
        box.vm.host_name = boxname.to_s
        box.vm.provider "virtualbox" do |v|
          v.memory = boxconfig[:memory]
          v.cpus = boxconfig[:cpus]
        end

        box.vm.provision "shell", path: "./step1.sh"

        box.vm.provision "shell", reboot: true

        box.vm.provision "shell", path: "./step2.sh"

      end
    end
  end