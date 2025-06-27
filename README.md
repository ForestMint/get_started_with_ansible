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

Run the playbook
```bash
ansible-playbook --ask-become-pass install_apache.yml
```


