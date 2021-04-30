# multicloud-docker
This is a tool for building a multi-cloud that connects aws, gcp, and azure with vpn with terraform.
You can build a terraform environment on the docker container.

# Pre setting

```
mkdir ./.secret

cat << EOL > ./.secret/admin-rc.txt
# AWS Credential
AWS_ACCESS_KEY_ID="<aws_access_key_id>"
AWS_SECRET_ACCESS_KEY="<aws_secret_access_key>"

# Azure Credential
export ARM_SUBSCRIPTION_ID="<arm_subscription_id>"
export ARM_CLIENT_ID="<arm_client_id>"
export ARM_CLIENT_SECRET="<arm_client_secret>"
export ARM_TENANT_ID="<arm_tenant_id>"
EOL

# GCP Service Account 
vi ./.secret/gcp-service-account.json
```

# Container build and run

```
### Build
docker build . -t multicloud-docker:latest

### Run
docker run -it --name multicloud-docker --env-file .secret/admin-rc.txt multicloud-docker:latest
```

# Terraform execute

```
# Terraform init
terraform init

# tf file format check
terraform fmt -check

# Terraform plan
terraform plan 

# Terraform apply
time TF_LOG=debug TF_LOG_PATH="./terraform_log_`date "+%Y%m%d-%H%M%S"`" terraform apply
```
