## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_random"></a> [random](#provider\_random) | 3.6.3 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_deployment"></a> [deployment](#module\_deployment) | ./modules/deployment | n/a |
| <a name="module_volume"></a> [volume](#module\_volume) | ./modules/volume | n/a |

## Resources

| Name | Type |
|------|------|
| [random_id.admin_password](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/id) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_admin_email"></a> [admin\_email](#input\_admin\_email) | Gitea admin email | `string` | n/a | yes |
| <a name="input_admin_password"></a> [admin\_password](#input\_admin\_password) | Gitea admin password, defaults to randomly generated | `string` | `""` | no |
| <a name="input_admin_user"></a> [admin\_user](#input\_admin\_user) | Gitea admin username, defaults to user part of email address | `string` | `""` | no |
| <a name="input_do_token"></a> [do\_token](#input\_do\_token) | DigitalOcean API token | `string` | n/a | yes |
| <a name="input_domain_sub"></a> [domain\_sub](#input\_domain\_sub) | The sub-domain where Gitea will be accessible | `string` | `"gitea"` | no |
| <a name="input_domain_zone"></a> [domain\_zone](#input\_domain\_zone) | DigitalOcean domain zone under which the A record for Gitea should be added | `string` | n/a | yes |
| <a name="input_gitea_app_name"></a> [gitea\_app\_name](#input\_gitea\_app\_name) | n/a | `string` | `"What a lovely cuppa"` | no |
| <a name="input_gitea_runner_version"></a> [gitea\_runner\_version](#input\_gitea\_runner\_version) | Gitea Act Runner image version (-dind-rootless will be appended) | `string` | `"latest"` | no |
| <a name="input_gitea_ssh_port"></a> [gitea\_ssh\_port](#input\_gitea\_ssh\_port) | Gitea SSH port, set to 0 to disable | `number` | `22` | no |
| <a name="input_gitea_version"></a> [gitea\_version](#input\_gitea\_version) | Gitea image version (-rootless will be appended) | `string` | `"1"` | no |
| <a name="input_ratelimit_average"></a> [ratelimit\_average](#input\_ratelimit\_average) | Maximum rate, in requests per second, allowed from a given source | `number` | `40` | no |
| <a name="input_ratelimit_burst"></a> [ratelimit\_burst](#input\_ratelimit\_burst) | Maximum number of requests allowed to go through in a second | `number` | `60` | no |
| <a name="input_region"></a> [region](#input\_region) | DigitalOcean region | `string` | n/a | yes |
| <a name="input_size"></a> [size](#input\_size) | DigitalOcean droplet size, defaults to cheapest | `string` | n/a | yes |
| <a name="input_ssh_key_name"></a> [ssh\_key\_name](#input\_ssh\_key\_name) | Installation SSH key name on DigitalOcean, contents will be automatically generated | `string` | `"Terraform install key - Gitea"` | no |
| <a name="input_ssh_port"></a> [ssh\_port](#input\_ssh\_port) | SSH port for sshd on host | `number` | `2222` | no |
| <a name="input_swap_size"></a> [swap\_size](#input\_swap\_size) | Size for swap space, as used in fallocate | `string` | `"2G"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags for resources where applicable | `list(string)` | <pre>[<br>  "gitea"<br>]</pre> | no |
| <a name="input_volume_name"></a> [volume\_name](#input\_volume\_name) | DigitalOcean volume name | `string` | `"gitea-data"` | no |
| <a name="input_volume_size"></a> [volume\_size](#input\_volume\_size) | DigitalOcean volume size in GiB | `number` | `5` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_address"></a> [address](#output\_address) | HTTP address of deployment |
| <a name="output_admin_password"></a> [admin\_password](#output\_admin\_password) | Gitea admin password |
| <a name="output_admin_user"></a> [admin\_user](#output\_admin\_user) | Gitea admin user |
| <a name="output_fqdn"></a> [fqdn](#output\_fqdn) | Fully qualified domain name of deployment |
| <a name="output_ipv4"></a> [ipv4](#output\_ipv4) | Public IPv4 address of deployment |
| <a name="output_volume_id"></a> [volume\_id](#output\_volume\_id) | DigitalOcean Block Volume ID |
