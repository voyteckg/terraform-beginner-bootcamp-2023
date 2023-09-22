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
