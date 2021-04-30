FROM python:3.8

ARG pip_installer="https://bootstrap.pypa.io/get-pip.py"
ARG awscli_version="1.16.168"

# install aws-cli
RUN pip install awscli==${awscli_version}

# install sam
RUN pip install --user --upgrade aws-sam-cli
ENV PATH $PATH:/root/.local/bin

# install command & azure-cli.
RUN apt update && apt install -y less vim wget unzip curl npm && npm install azure-cli

# install terraform.
RUN wget https://releases.hashicorp.com/terraform/0.14.4/terraform_0.14.4_linux_amd64.zip && \
    unzip ./terraform_0.14.4_linux_amd64.zip -d /usr/local/bin/

# copy resources.
COPY ./main.tf /root/
COPY ./providers.tf /root/
COPY ./variables.tf /root/
COPY ./aws /root/aws
COPY ./google /root/google
COPY ./azure /root/azure
COPY ./vpn /root/vpn
COPY ./.secret/gcp-service-account.json /root/.config/gcloud/gcp-service-account.json
COPY ./terraform.tfvars /root/

# initialize command.
ENTRYPOINT ["/bin/bash"]

WORKDIR /root
