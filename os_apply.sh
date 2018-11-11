#!/bin/sh

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

# Create a placeholder secret if it does not already exist, do not overwrite
if ! oc get secret vault >/dev/null 2>&1;
then
    oc apply -f os/vault-secret.yml
fi

# Create an imagestream
oc apply -f os/imagestream.yml

# Create a buildconfig
oc apply -f os/buildconfig.yml

# Packer templates
tmpfile=$(mktemp)
oc create configmap templates --from-file $DIR/templates --dry-run -o yaml\
    | grep -v creationTimestamp > $tmpfile
oc apply -f $tmpfile && rm $tmpfile

#job.yml
