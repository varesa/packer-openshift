FROM hashicorp/packer:1.3.2

RUN apk update && apk add jq && rm -rf /var/cache/apk/*

COPY ca.crt /usr/local/share/ca-certificates/openshift.crt
RUN update-ca-certificates

WORKDIR /bin

RUN wget https://github.com/jetbrains-infra/packer-builder-vsphere/releases/download/v2.0.1/packer-builder-vsphere-clone.linux -O packer-builder-vsphere-clone &&\
    wget https://github.com/jetbrains-infra/packer-builder-vsphere/releases/download/v2.0.1/packer-builder-vsphere-iso.linux -O packer-builder-vsphere-iso
RUN chmod +x /bin/packer-builder-vsphere-clone /bin/packer-builder-vsphere-iso

RUN wget https://releases.hashicorp.com/vault/0.11.4/vault_0.11.4_linux_amd64.zip -O /tmp/vault.zip && unzip /tmp/vault.zip && rm /tmp/vault.zip
ENV VAULT_FORMAT=json

COPY ../build.sh /

ENTRYPOINT []
CMD /bin/bash
