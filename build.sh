#!/bin/bash

export VSPHERE_USERNAME=$(vault kv get /kv/packer/vsphere | jq -r '.data.username')
export VSPHERE_PASSWORD=$(vault kv get /kv/packer/vsphere | jq -r '.data.password')

export ROOT_PASSWORD=$(vault kv get /kv/packer/vm | jq -r '.data.password')

packer build -var "vsphere_password=$VSPHERE_PASSWORD" -var "guest_password=$ROOT_PASSWORD" /templates/clone.json
