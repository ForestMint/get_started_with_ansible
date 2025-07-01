# This is about the basics of Ansible

## 📦 Start and set the machines

### Control node

```bash
cd control node
vagrant up
vagrant ssh
sudo apt install ansible -y
ansible --version
(sudo useradd -m alfredo) && (sudo passwd alfredo) && (sudo usermod -aG sudo alfredo)
apt-get install sshpass
sshpass -V
su alfredo
```

### Managed node 1

```bash
cd managed_node_1
vagrant up
vagrant ssh
(sudo apt-get install sshpass) && (sudo useradd -m alfredo) && (sudo passwd alfredo) && (sudo usermod -aG sudo alfredo)
```

### Managed node 2

```bash
cd managed_node_2
vagrant up
vagrant ssh
(sudo apt-get install sshpass) && (sudo useradd -m alfredo) && (sudo passwd alfredo) && (sudo usermod -aG sudo alfredo)
```

### Managed node 3

```bash
cd managed_node_3
vagrant up
vagrant ssh
(sudo apt-get install sshpass) && (sudo useradd -m alfredo) && (sudo passwd alfredo) && (sudo usermod -aG sudo alfredo)
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

In our case :
```bash
ssh-copy-id -i ~/.ssh/id_ed25519.pub 192.168.56.10
ssh-copy-id -i ~/.ssh/id_ed25519.pub 192.168.56.11
ssh-copy-id -i ~/.ssh/id_ed25519.pub 192.168.56.12
```


🥳 IT IS NOW POSSIBLE TO CONNECT TO SERVERS FROM CONTROL NODE WITH SSH !!!!!

No need to have OpenSSH installed on the workstation == control node (just SSH client is needed here, installed by default on any Linux system)

## 🅰️🔑 Set the Ansible key

### Run the following on the control node

Make sure to type a different type from those previously typed for SSH key (type "/home/alfredo/.ssh/ansible")
Don't create a passphrase
```bash
ssh-keygen -t ed25519 -C "ansible"
```

check that the 4 keys are present
```bash
cd /home/alfredo/.ssh/
ls
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

In our case :
```bash
ssh-copy-id -i ~/.ssh/ansible.pub 192.168.56.10
ssh-copy-id -i ~/.ssh/ansible.pub 192.168.56.11
ssh-copy-id -i ~/.ssh/ansible.pub 192.168.56.12
```

Connect to each server with SSH and run the following to check the presence of the 2 keys with the command below (I get permission denied)
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

## 🅰️ Set Ansible and do first checks

### create file inventory and add in it the IPs of the servers we want to manage
```bash
cd ~
vim inventory
```

### check success of use of Ansible

```bash
ansible all --key-file ~/.ssh/ansible -i ~/inventory -m ping
```

### create file my_playbook.yml and copy-paste in it the content of the file my_playbook.yml of this repoitory
```bash
vim my_playbook.yml
```

### run the playbook

```bash
ansible-playbook -i ~/inventory ~/my_playbook.yml --private-key=~/.ssh/ansible -kK
```
the 2 passwords typed here seem not to matter (e.g. if I type 'tata' and 'tata' without having set 'tata' as a password earlier in this process it still works)
