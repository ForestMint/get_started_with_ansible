# This is about the basics of Ansible




Start the machines

```bash
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


On the control node

```bash
ssh-keygen -t ed25519 -C "jay default"
```
press Enter to leave the file field empty
choose a strong passphrase to make the key much better


find the IPs in the variable /VirtualBox/GuestInfo/Net/0/V4/IP

```bash

vboxmanage list runningvms # display information about the running VMs

vboxmanage guestproperty enumerate <managed-node-1-name> | grep /VirtualBox/GuestInfo/Net/1/V4/IP

vboxmanage guestproperty enumerate <managed-node-2-name> | grep /VirtualBox/GuestInfo/Net/1/V4/IP

vboxmanage guestproperty enumerate <managed-node-3-name> | grep /VirtualBox/GuestInfo/Net/1/V4/IP


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

🥳 IT IS NOW POSSIBLE TO CONNECT TO SERVERS FROM CONTROL NODE WITH SSH !!!!!

No need to have OpenSSH installed on the workstation == control node (just SSH client is needed here, installed by default on any Linux system)

Run the playbook
```bash
ansible-playbook --ask-become-pass install_apache.yml
```


