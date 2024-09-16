# tf-do-gitea

## Terraform definitions for Gitea on DigitalOcean

### Prerequisites

- DigitalOcean API R+W token with scopes:
    - `block_storage`
    - `block_storage_action`
    - `domain`
    - `droplet`
    - `regions`
    - `sizes`
    - `ssh_key`
    - `tag`
- Public domain name managed on DigitalOcean
- Terraform CLI
- Docker Engine (for generating docs)

### Terraform

> **Note**
> State is stored as local files

- [Inputs](TERRAFORM.md#inputs)
- [Outputs](TERRAFORM.md#outputs)

### Install

- Create `local.tfvars` file and fill necessary variables
- Deploy with `make apply` command

### Uninstall

- Destroy resources (except for Block storage) with `make destroy`
