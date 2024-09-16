# Define the paths to your modules
TERRAFORM_DIR := .
TFVARS_FILE := local.tfvars

# Define commands
TF := terraform
DOCKER := docker

.PHONY: all docs init fmt validate apply destroy clean

# Initialize Terraform project
init:
	@echo "Initializing Terraform..."
	$(TF) init -upgrade

# Generate readme for Terraform values
docs:
	@echo "Generating Terraform docs..."
	$(DOCKER) run --rm --volume "$(shell pwd):/terraform-docs" -u $(shell id -u) quay.io/terraform-docs/terraform-docs markdown /terraform-docs > TERRAFORM.md

# Format Terraform files
fmt:
	@echo "Formatting Terraform files..."
	$(TF) fmt -recursive

# Validate Terraform files
validate:
	@echo "Validating Terraform configuration..."
	$(TF) validate

# Apply Terraform configuration
apply: init fmt validate
	@echo "Applying Terraform configuration..."
	$(TF) apply -var-file=$(TFVARS_FILE) -auto-approve

# Destroy resources (only for the deployment module)
destroy: init
	@echo "Destroying the gitea module resources..."
	$(TF) destroy -var-file=$(TFVARS_FILE) -target=module.deployment -auto-approve

# Remove local Terraform state files
clean:
	@echo "Cleaning up local Terraform state files..."
	rm -rf .terraform
	rm -rf .terraform.lock.hcl
	rm -rf terraform.tfstate*
	rm -rf .terraform.tfstate.backup
