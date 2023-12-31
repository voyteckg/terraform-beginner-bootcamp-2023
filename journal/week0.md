# Terraform Beginner Bootcamp 2023 - Week 0
- [Semantic Versioning](#semantic-versioning)
- [Install Terrafrom CLI](#install-terrafrom-cli)
  * [Considerations with the Terraform CLI changes](#considerations-with-the-terraform-cli-changes)
  * [Refactoring into Bash Scripts](#refactoring-into-bash-scripts)
  * [Shebang](#shebang)
- [Execution Considerations](#execution-considerations)
  * [Linux Permissions Consideration](#linux-permissions-consideration)
  * [GitHub Lifecycle (Before, Init, Command)](#github-lifecycle--before--init--command-)
  * [WORKING ENV VARS](#working-env-vars)
    + [Printing Vars](#printing-vars)
    + [Scoping of Env Vars](#scoping-of-env-vars)
    + [Persisting Env Vars in Gitpod](#persisting-env-vars-in-gitpod)
  * [AWS CLI Installation](#aws-cli-installation)
  * [Regions in AWS](#regions-in-aws)
- [Terraform Basics](#terraform-basics)
  * [Terraform Registry](#terraform-registry)
  * [Terraform Console](#terraform-console)
    + [Terraform Init](#terraform-init)
    + [Terraform Plan](#terraform-plan)
    + [Terraform Apply](#terraform-apply)
    + [Terraform Destroy](#terraform-destroy)
  * [Terrafrom Lock Files](#terrafrom-lock-files)
  * [Terraform State Files](#terraform-state-files)
  * [Terraform Directory](#terraform-directory)
- [Issues with Terraform Cloud Login and Gitpod Workspace](#issues-with-terraform-cloud-login-and-gitpod-workspace)

## Semantic Versioning

This project is going to utilize semantic versioning for its tagging.
[https://semver.org/](https://semver.org/)

The general format:

**MAJOR.MINOR.PATCH**, eg. `1.0.1`

- **MAJOR** version when you make incompatible API changes
- **MINOR** version when you add functionality in a backward compatible manner
- **PATCH** version when you make backward compatible bug fixes
Additional labels for pre-release and build metadata are available as extensions to the MAJOR.MINOR.PATCH format.

## Install Terrafrom CLI

### Considerations with the Terraform CLI changes
the Terraform CLI installation instructions have changed due to gpg keyring changes. So the original gitpod.yml bash. So we needed refer to the latest install CLI instructions.


[Install Terraform CLI](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli])
https://www.cyberciti.biz/faq/how-to-check-os-version-in-linux-command-line/

### Refactoring into Bash Scripts

While fixing tehe Terraform gpg depreciation issues we notice that bash scripts steps were a considerable amount more code. So we decided to create a bash script to istall the Terrarom CLI

This bash script is located here [./bin/install_terraform_cli)[./bin/instll_terraform_cli]

- This will keep the Gitpod Task File ([.gitpod.yml]).gitpod.yml] tidy
- This allow us an easier way.

### Shebang

A Shebang tells the bash cript what program will interpret the script. eg. `#!/bin/bash`

## Execution Considerations

When executing bash cript we can use `./`
https://pl.wikipedia.org/wiki/Shebang

If we are using a script in .gitpod.yml we need to point the script to a program to interpret it.

### Linux Permissions Consideration

Linux permissions works as follows

https://pl.wikipedia.org/wiki/Chmod

```sh
ls -la list + hidden file
```
```sh
chmod u+x ./bin/install_terraform_cli.sh
```
```sh
chmod 777 ./bin/install_terraform_cli.sh
```

### GitHub Lifecycle (Before, Init, Command)

We need to be carefull when using init because it will not rerun if we restart an existing workspace.

https://www.gitpod.io/docs/configure/workspaces/tasks


### WORKING ENV VARS

WE CAN LIST OUT ALL ENVIRONMENTAL VARIABLE (ENV VARS) USING THE `ENV` command

We can filter specific env var using grep eg. `env | grep AWS_`

In the terminal we can set using `export HELLO='world'`

We can set env var temporarily when just running a command

```sh
HELLO='world' ./bin/print_message
```
Within a bash script we cn set env without writing export

```sh
#!/usr/bin/env bash
HELLO='world'

echo $HELLO
```
#### Printing Vars

We can print a env using echo eg. `echo $HELLO`

#### Scoping of Env Vars

When you open new bash terminals in VSCode it will not be aware of env vars that you have set in another windows

If you want to Env Vars to persist acress all furue bash terminals that ae you open you need to set env vars in your bash profile eg. `.bash_profile`

#### Persisting Env Vars in Gitpod

We can persist env vars into gitpod by storing them in Gitpod Secrets Storage.

```
gp env HELLO='world'
```

All future workspaces launched will set the env vars for all bash terminals opened in workspaces.

Yo cvan also set en vars in the `.gitpod.yml`

### AWS CLI Installation

AWS CLI is installed for the project.

AWS CLI is installed for the project via the bash [`./bin/install_aws_cli`](./bin/install_aws_cli)

[Getting Started Install](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)

We can check if our AWS credentials is configured correctly by running the following command:
```sh
aws sts get-caller-identity
```
https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-envvars.html

### Regions in AWS

https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Concepts.RegionsAndAvailabilityZones.html

If it is succesfull you shoul see a json payload return that looks like this:

```json
{
    "UserId": "AIDAR6YRTCW736CEJNZY5",
    "Account": "1234566789012",
    "Arn": "arn:aws:iam::684547446207:user/terraform-beginner-bootcamp"
}
```
We'll need to genearate AWS CLI credits

## Terraform Basics

### Terraform Registry

Terraform sources their providers and modules from Terraform registry which locstes at [registry.terraform.io](https://registry.terraform.io/)

- **Providers** is an interface to APIs that will allow to create resources in terraform
- **Modules** are a way to make large amount of terrafrom code modular, portable and sharable

[Random Terraform Provider](https://registry.terraform.io/providers/hashicorp/random)
### Terraform Console

We can see a list of all the Terraform commands by simply typing `terraform`

#### Terraform Init

At the start of a new terraform project we will run `terraform init` to download the binaries for the terraform providers that we'll use in this project.

#### Terraform Plan

This will generate out a changeset, about the state of our infrastructure and what will be changed

#### Terraform Apply

`terrafrom apply`

This will run a plan a pass the changeset to execute by terraform.

If we want to automatically approve an apply we can provide the auto approve flag `terraform apply --auto-aprove`

#### Terraform Destroy

`terraform destroy`
This will destroy resources
You can use approve flag

`terraform apply --auto-aprove`

### Terrafrom Lock Files

`.terraform.lock.hcl` contains the locked verioning for the providers or modules.

The Terraform Lock File should be commited to you Version Control System (VSC) eg. GitHub

### Terraform State Files

`.terraform.tfstate` contain information about the currnt state of yur infrastructudre.

This file **should not to be commited** to your VCS.

This file can cotain sensitive data.

If you lose this file, you lose knowing the stae of your infrastructure.

`.terraform.tfstate.backup` is the previous state file state

### Terraform Directory 

`.terraform` directory contains binaries of terraform providers.

## Issues with Terraform Cloud Login and Gitpod Workspace

When attemtping to run `terraform login` it will launch bash a wiswig view to generate a token. However is does not work as expected in gitpod VSCode in the browser.

The workauround is manually generate a token in Terraform cloud

```
https://app.terraform.io/app/settings/tokens?source=terraform-login
```

then create the flile manualy here
```sh
touch /home/gitpod/.terraform.d/credentials.tfrc.json
open /home/gitpod/.terraform.d/credentials.tfrc.json
```
provide the following code
```
{
  "credentials": {
    "app.terraform.io": {
      "token": "YOUR-TOKEN"
    }
  }
}
```

We have automated this workaroud with the following bash script [bin/generate_tfrc_credentials](bin/generate_tfrc_credentials)
