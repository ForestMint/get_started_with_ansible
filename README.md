# This is about the basics of Ansible


<!--
```bash
sudo useradd -m jay
```

```bash
sudo su jay
```

-->

Start the machines

```bash

#cd control_node
#vagrant up
#cd ..
cd managed_node_1
vagrant up
vagrant ssh
(sudo useradd -m p851962) && (sudo passwd p851962)
cd ..

cd managed_node_2
vagrant up
vagrant ssh
(sudo useradd -m p851962) && (sudo passwd p851962)
cd ..

cd managed_node_3
vagrant up
vagrant ssh
(sudo useradd -m p851962) && (sudo passwd p851962)
cd ..
```




On each machine (vagrant ssh)

```bash
sudo systemctl start ssh 
```

```bash
sudo systemctl status ssh 
```

On the control node



```bash
ssh-keygen -t ed25519 -C "jay default"
```
press Enter to leave the file field empty
choose a strong passphrase to make the key much better

view the files created for the SSH keys (private key and public key)
```bash
ls -la .ssh # does not work
```

view the content of the public key
```bash
cat .ssh/id_ed25519.pub
```

view the content of the private key
```bash
cat .ssh/id_ed25519
```

set the VM's network to "Bridge adapter ; wlan0"
it closes all the vagrant ssh connections

<!--
the following commands failed so I do it with GUI
-->
```bash
VBoxManage modifyvm <managed-node-1-name> --nic1 bridged --bridgeadapter1 wlan0


VBoxManage modifyvm <managed-node-2-name> --nic1 bridged --bridgeadapter1 wlan0


VBoxManage modifyvm <managed-node-3-name> --nic1 bridged --bridgeadapter1 wlan0
```





find the IPs in the variable /VirtualBox/GuestInfo/Net/0/V4/IP

```bash

vboxmanage list runningvms # display information about the running VMs

vboxmanage guestproperty enumerate <managed-node-1-name> | grep /VirtualBox/GuestInfo/Net/0/V4/IP

vboxmanage guestproperty enumerate <managed-node-2-name> | grep /VirtualBox/GuestInfo/Net/0/V4/IP

vboxmanage guestproperty enumerate <managed-node-3-name> | grep /VirtualBox/GuestInfo/Net/0/V4/IP


```

ping the IP addresses to check they repond

```bash
ping <managed-node-1-IP>

ping <managed-node-2-IP>

ping <managed-node-3-IP>
```




copy the public key to each server you want to access to
```bash
ssh-copy-id -i ~/.ssh/id_ed25519.pub <server-ip-address>
```

view on each server the public key freshly added in authorized_keys
```bash
ls -la .ssh # does not work
cat .ssh/authorized_keys # does not work either
```

🥳 IT IS NOW POSSIBLE TO CONNECT TO SERVERS FROM CONTROL NODE WITH SSH !!!!!

No need to have OpenSSH installed on the workstation == control node (just SSH client is needed here, installed by default on any Linux system)

Run the playbook
```bash
ansible-playbook --ask-become-pass install_apache.yml
```


