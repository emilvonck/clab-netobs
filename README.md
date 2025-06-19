# clab-netobs

```bash
docker run -it --rm -v ${PWD}/clab-netobs/ansible-inventory.yml:/ansible-inventory.yml \
    -v ${PWD}/playbooks/onboard.yml:/onboard.yml \
    alpine/ansible ansible-playbook -i ansible-inventory.yml onboard.yml
```