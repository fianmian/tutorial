echo ">>> Running foreground.sh" >> /tmp/debug.log

#!/bin/bash
set -e

# Install dependencies
apt-get update -y
apt-get install -y wget unzip

# Install Terraform
TERRAFORM_VERSION="1.8.5"
wget -q https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip
unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip >/dev/null
mv terraform /usr/local/bin/
chmod +x /usr/local/bin/terraform

# Verify
terraform version