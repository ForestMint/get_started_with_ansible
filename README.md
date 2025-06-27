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

Install OpenSSH on all the servers == nodes == mamaged nodes
```bash
sudo apt install openssh-server
```

No need to have OpenSSH installed on the workstation == control node (just SSH client is needed here, installed by default on any Linux system)

Run the playbook
```bash
ansible-playbook --ask-become-pass install_apache.yml
```


