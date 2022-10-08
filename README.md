# terraform-create-ec2-instance

## This is a sample project for create ec2 instance using terraform

## 1. Intsall [Terraform CLI](https://www.terraform.io/downloads) & Intsall [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
---
## 2. Craete AWS security credentials profile that containes the `aws_access_key_id`&`aws_secret_access_key` into default location ex: `$HOME\.aws\credentials` and that containes the `region` into default location ex: `$HOME\.aws\config` then do the following:
```bash
$ aws configure
AWS Access Key ID [None]: xxxxxxxxxxxxxxxxxxxxxxxx
AWS Secret Access Key [None]: xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
Default region name [None]: xxxxxxx
Default output format [None]: json
```
---
## 3. Create `providers.tf` file Which contains the information of specific providers like azure, aws , google, etc...
---
## 4. Make sure you are in the directory that contains the `providers.tf` file to import terraform library bassed on specific provider then do the following:
```bash
terraform init
```
---
## 4. Create `main.tf` file That contains the specifications resources that you will build ex: EC2 instance specs
---
## 5. Create `security.tf` file That containes the security group attached to the ec2 instence Also the keypair that will be used to connect on the ec2 instence & allow inbound outbound connection
---
## 6. Create `variables.tf` file That containes all the variables with the data that you should expose to public, Make sure you generate SSH key if you don't have one and add `variable name` only into the `variables.tf` file then do the following:
```bash
ssh-keygen 
```
---
## OR use 
## 6. [file Functions](https://www.terraform.io/language/functions/file) then do the following:
```bash
resource "aws_key_pair" "ubuntu-key" {
  key_name = "ubuntu-key"
  public_key = file("$HOME\\.ssh\\id_rsa.pub")

}
```
---
## OR use
## 6. Create `terraform.tfvars` file That contains the variables that you will not share it on the version control Add your public ssh key to the `terraform.tfvars` Remember to add it to `.gitignore` file
---
## 7. Check what will be created if you apply That command is to check and show if there is an error before applying it 
```bash
terraform plan
```
---
## 8. Apply the infrastruction That command is start building the infrastructure on the cloud
```bash  
terraform apply # It will first show your the plan then you have to type yes to build
# OR 
terraform apply -auto-approve # To plan and apply changes without confirming
```
---
## 9. Connect to the created EC2 instence with private key
```bash

chmod 400 "$HOME\\.ssh\\id_rsa"
ssh -i "$HOME\\.ssh\\id_rsa" <user@ec2...>
```
---
## 10. Destroy created resources That command is Destroy builded the infrastructure on the cloud
```bash
# This command will show you first what it will destroy then ask you to type yes to confirm
terraform destroy
# OR
terraform destroy -auto-approve # To immediately destroy all the created resources without confirming 
```