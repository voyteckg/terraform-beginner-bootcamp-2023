# Terraform Beginner Bootcamp 2023

## Semantic Versioning :mage: !

This project is going to utilize semantic versioning for its tagging.
[https://semver.org/](https://semver.org/)

The general format:

**MAJOR.MINOR.PATCH**, eg. `1.0.1`

- **MAJOR** version when you make incompatible API changes
- **MINOR** version when you add functionality in a backward compatible manner
- **PATCH** version when you make backward compatible bug fixes
Additional labels for pre-release and build metadata are available as extensions to the MAJOR.MINOR.PATCH format.

## Isntall Terrafrom CLI

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