# terraform for pve

## setup

Terraform is installed in a container, checkout the dockerfile for more information: [dockerfile](https://github.com/moffoso/containers/blob/main/terraform/dockerfile)

### Create a pve-api-key for terraform

Navigate under `datacenter` to `Permissions > API-Tokens > Add`
Deselect the checkbox `Privilege Seperation` for the time being (I will revisit this at a later date)
