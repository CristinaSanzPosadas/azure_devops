#!/bin/bash

ansible-playbook -i hosts acr_playbook.yaml
ansible-playbook -i hosts aks_playbook.yaml
ansible-playbook -i hosts vm_playbook.yaml
