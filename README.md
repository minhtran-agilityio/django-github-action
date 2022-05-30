# DEPLOY DJANGO APPLICATION TO AWS ECS WITH GITHUB ACTION


## Github Action

GitHub Actions is a continuous integration and continuous delivery (CI/CD) platform that allows you to automate your build, test, and deployment pipeline. You can create workflows that build and test every pull request to your repository, or deploy merged pull requests to production.
  
## Technical Stack

- Django
- Docker
- PostgreSQL
- Docker-compose
- Bash

## AWS

- [github.com/aws-actions/configure-aws-credentials](http://github.com/aws-actions/configure-aws-credentials) – Configure AWS credential and region environment variables for use in other GitHub Actions
- [github.com/aws-actions/amazon-ecr-login](http://github.com/aws-actions/amazon-ecr-login) – Log in the local Docker client to one or more Amazon Elastic Container Registry (ECR) registries
- [github.com/aws-actions/amazon-Amazon ECS-render-task-definition](http://github.com/aws-actions/amazon-ecs-render-task-definition) – Insert a container image URI into an Amazon ECS task definition JSON file
- [github.com/aws-actions/amazon-Amazon ECS-deploy-task-definition](http://github.com/aws-actions/amazon-ecs-deploy-task-definition) – Registers an Amazon ECS task definition and deploys it to an Amazon ECS service

## Setup

### Install AWS CDK

- Install AWS CDK: https://docs.aws.amazon.com/cdk/v2/guide/cli.html

### Initialize AWS ECS Cluster

1. Move to directory ecs-devops-sandbox-sdk
    ```
    cd ecs-devops-sandbox-sdk
    ```

2. Manually create a virtualenv on MacOS and Linux:
    ```
    python3 -m venv .venv
    ```

3. Activate environment
   ```
   source .venv/bin/activate
   ```

4. Install the required dependencies
   ```
   pip install -r requirements.txt
   ```

5. Boostrapping
    ```
    cdk bootstrap
    ```

6. Deploy stack
    ```
    cdk deploy
    ```

### Useful commands

 * `cdk ls`          : list all stacks in the app
 * `cdk synth`       : emits the synthesized CloudFormation template
 * `cdk deploy`      : deploy this stack to your default AWS account/region
 * `cdk diff`        : compare deployed stack with current state
 * `cdk docs`        : open CDK documentation
 * `cdk detroy`      : delete stack

### Create AWS CodeBuild

... 

### Update ECS Task Definition

...

### Create Github Action Secrets Keys

Follow: https://github.com/Azure/actions-workflow-samples/blob/master/assets/create-secrets-for-GitHub-workflows.md

- `AWS_ACCESS_KEY_ID`
- `AWS_SECRET_ACCESS_KEY`


### Create Environment Variables for building docker image

- `ENVIRONMENT`
- `SECRET_KEY`
- `DEBUG`
- `DATABASE_ENGINE`
- `DATABASE_HOST`
- `DATABASE_PORT`
- `DATABASE_NAME`
- `DATABASE_USER`
- `DATABASE_PASSWORD`
- `COLLECT_STATICS`
- `DATABASE_MIGRATE`
- `DEBUG_DATABASE_MIGRATE`
- `RESET_DATABASE`
- `GENERATE_SAMPLE_DATA`
  
### Update Github Action Workflow settings

...

## Run django app

1. Create `.env` file, follow sample `env.template` file

2. Run app
    ```
    docker-compose up --build
    ```

3. Run test
    ```
    docker-compose -f docker-compose.test.yaml up --build
    ```

## Test Github Action

- Make code change and push code to repo
  