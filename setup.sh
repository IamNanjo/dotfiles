#!/usr/bin/env bash

ansible-galaxy collection install community.general
ansible-playbook --ask-become-pass playbook.yaml
