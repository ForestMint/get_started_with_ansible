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

No need to have OpenSSH installed on the workstation == control node (just SSH client is needed here, installed by default on any Linux system)

Run the playbook
```bash
ansible-playbook --ask-become-pass install_apache.yml
```


