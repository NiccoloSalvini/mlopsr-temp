#  `{vetiver}` + `{plumber}` on AWS sandbox



## how-to

make sure to have an aws account, then create IAM user with the follwing policies:

- AmazonEC2ContainerRegistryFullAccess
- AmazonEC2FullAccess
- AmazonECS_FullAccess
- AmazonS3FullAccess

then also create a role with the following policies:

- AmazonS3FullAccess
- AmazonECS_FullAccess

at this point paste aws credentials into `.Renviron` file.

```t
  AWS_ACCESS_KEY_ID=SLNKXXXXXXXXXXXXXXXXXXXXSLD
  AWS_SECRET_ACCESS_KEY=lkvT0fi73/cXXXXXXXXXXXXXXXJ0s97sD++1
```

Then in the aws console create a bucket matching the bucket name in `model.R`.

Then you need to add also **Container Registry** service and create new repository, make it private and follow aws push commands for your model. In the end you are going to use aws **ECS**. You do that by creating a cluster with a signle EC2 instance. and the type for the load. Specify deafult VPC and subnet and auto assign public ip as Enabled as well as the port range (i.e. 8000). You need to specify a specific role to enable to ECS to access via R to the S3 bucket. SO you provice ECS with the role as before.

Once you have the cluster ranning you define a task by clicking ont task definition in the ECS dashboard. Go straight down to add container by filling the container name with your preferred name and copy the image URI in in the image blacket. Don't forget to set a bigger memory limit. Don't also forget to pass aws keys as enviroment variable to ECS task container definition otherwise the service it could not access to S3.



## todos

- training pipeline on sagemaker
- explainability pipeline
- aporia wrapper for model observability
- DALEX for models explainibility (reprex pipeline on qmd)
- switch to `{box}`
- create aws role 
- init CI/CD
- tests...

