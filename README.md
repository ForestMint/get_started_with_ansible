# This is about the basics of Ansible

Start the machines

```bash
cd control_node
vagrant up
cd ..
cd managed_node_1
vagrant up
cd ..
cd managed_node_2
vagrant up
cd ..
cd managed_node_3
vagrant up
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
ls -la .ssh
```

view the content of the public key
```bash
cat .ssh/id_ed25519.pub
```

view the content of the private key
```bash
cat .ssh/id_ed25519
```

copy the public key to each server you want to access to
```bash
ssh-copy-id -i ~/.ssh/id_ed25519.pub <server-ip-address>
```

view on each server the public key freshly added in authorized_keys
```bash
ls -la .ssh
cat .ssh/authorized_keys

```

🥳 IT IS NOW POSSIBLE TO CONNECT TO SERVERS FROM CONTROL NODE WITH SSH !!!!!

No need to have OpenSSH installed on the workstation == control node (just SSH client is needed here, installed by default on any Linux system)

Run the playbook
```bash
ansible-playbook --ask-become-pass install_apache.yml
```


