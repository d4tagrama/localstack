# TSE - Technical Take-Home Challenge

## Task 1: Terraform Deployments on LocalStack

This Terraform configuration performs the following:

- Creates an **S3 bucket**
- Creates an **SQS queue**
- Sets up an **S3 event notification** that sends a message to the SQS queue when a file is uploaded to the bucket

### Project Overview

The included `docker-compose.yml` file spins up two containers:

1. **LocalStack** – Simulates AWS services locally with debug mode enabled.
2. **LocalStack CLI** – A helper container that includes `awslocal` and `tflocal`, used to interact with LocalStack using AWS CLI and Terraform.

### Infrastructure Setup

1. Clone the repository:

```bash
git clone https://github.com/d4tagrama/localstack.git
```

2. Navigate to the build directory and run the LocalStack startup script:

```bash
cd localstack/build
./deploy-localstack.sh  
```

3. Provision Infrastructure

You can provision the infrastructure using either Terraform (tflocal) or AWS CLI (awslocal):

- Option A: Using Terraform (tflocal)

    Navigate to the iac directory and execute:

    ```bash
    cd localstack/iac
    ./deploy-tflocal.sh
    ```


    This will initialize and apply the Terraform configuration using the LocalStack provider.


* Option B: Using AWS CLI (awslocal)

    While still in the iac directory, run:
    ```bash
    cd localstack/iac
    ./deploy-awslocal.sh
    ```

Notice that you can destroy the infrastructure using the provided destroy scripts.

### Completation Creteria

1. A docker-compose.yml that starts up LocalStack with debug mode enabled ([docker-compose](build/)).
2. A Terraform configuration that creates the resources described in the task ([Terraform code](iac/))
3. A shell script that invokes the awslocal commands to interact with the created cloud infrastructure, and returns the output ([tflocal](iac/deploy-awslocal.sh), [awslocal](iac/deploy-tflocal.sh)).
4. A log file containing the debug log output of LocalStack after applying the Terraform
configuration and running the shell script [logfile](build/localstack.log).