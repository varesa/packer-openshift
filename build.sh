#!/bin/bash

export VSPHERE_ADDRESS=$(vault kv get /kv/packer/vsphere | jq -r '.data.address')
export VSPHERE_USERNAME=$(vault kv get /kv/packer/vsphere | jq -r '.data.username')
export VSPHERE_PASSWORD=$(vault kv get /kv/packer/vsphere | jq -r '.data.password')

export ROOT_PASSWORD=$(vault kv get /kv/packer/vm | jq -r '.data.password')

if [ ! -f $1 ]
then
    echo Please provide template as a parameter
    exit 1
fi

packer build \
    -var "vsphere_address=$VSPHERE_ADDRESS" -var "vsphere_username=$VSPHERE_USERNAME" -var "vsphere_password=$VSPHERE_PASSWORD" \
    -var "guest_password=$ROOT_PASSWORD" \
    $1
