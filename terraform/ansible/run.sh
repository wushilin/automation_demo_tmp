#!/bin/sh
#
#
ansible-playbook -i hosts.yaml confluent.platform.all --skip-tags pip-package,validate_ssl_keys_certs
