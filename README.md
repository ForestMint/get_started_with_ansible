# This is about the basics of Ansible




## 📦 Start the machines


### Node 1

```bash
cd managed_node_1
vagrant up
vagrant ssh
(sudo apt-get install sshpass) && (sudo useradd -m p851962) && (sudo passwd p851962) 
```

### Node 2

```bash
cd managed_node_2
vagrant up
vagrant ssh
(sudo apt-get install sshpass) && (sudo useradd -m p851962) && (sudo passwd p851962) 
```

### Node 3

```bash
cd managed_node_3
vagrant up
vagrant ssh
(sudo apt-get install sshpass) && (sudo useradd -m p851962) && (sudo passwd p851962) 
```
## 🔑 Set the SSH key

### Run the following on the control node

#### Creation of the key

```bash
ssh-keygen -t ed25519 -C "jay default"
```
press Enter to leave the file field empty
choose a strong passphrase to make the key much better


#### Copying the public key to each server you want to access to

```bash
ssh-copy-id -i ~/.ssh/id_ed25519.pub <managed-node-1-IP>
```

```bash
ssh-copy-id -i ~/.ssh/id_ed25519.pub <managed-node-2-IP>
```

```bash
ssh-copy-id -i ~/.ssh/id_ed25519.pub <managed-node-3-IP>
```

🥳 IT IS NOW POSSIBLE TO CONNECT TO SERVERS FROM CONTROL NODE WITH SSH !!!!!

No need to have OpenSSH installed on the workstation == control node (just SSH client is needed here, installed by default on any Linux system)




## 🅰️🔑 Set the Ansible key

### Run the following on the control node

Make sure to type a different type from those previously typed for SSH key
Don't create a passphrase
```bash
ssh-keygen -t ed25519 -C "ansible"
```

Copy the ansible key to all the 3 servers with ssh-copy-id command like higher in this file
```bash
ssh-copy-id -i ~/.ssh/ansible.pub <managed-node-1-IP>
```

```bash
ssh-copy-id -i ~/.ssh/ansible.pub <managed-node-2-IP>
```

```bash
ssh-copy-id -i ~/.ssh/ansible.pub <managed-node-3-IP>
```
At each copy command, the passphrase of the SSH key is to be asked for

Connect to each server with SSH and run the following to check the presence of the 2 keys with the command below
```bash
cat .ssh/authoriwed_keys
```

Check the connection with ansible key to each server
```bash
ssh -i ~/.ssh/ansible <managed-node-1-IP>
```
```bash
ssh -i ~/.ssh/ansible <managed-node-2-IP>
```
```bash
ssh -i ~/.ssh/ansible <managed-node-3-IP>
```

## 🅰️ Install Ansible and do first checks

### Proceed installation

#### Arch Linux
```bash
pacman -S ansible
sudo pacman -S sshpass
```

### check success of installation
```bash
ansible --version
```

### create file inventory and add in it the IPs of the servers we want to manage
```bash
nano inventory
```

### check success of use of Ansible

```bash
ansible all --key-file ~/.ssh/ansible -i /home/p851962/inventory -m ping
```

### Run the playbooks

```bash
ansible-playbook -i /home/p851962/inventory my_playbook.yml --private-key=~/.ssh/ansible -kK
```
the 2 passwords typed here seem not to matter