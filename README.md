# Demo VPC
Terraform template to deploy a VPC with segmented subnets, basic routing tables, security groups and of course everything properly tagged.

## Tested with: 

| Environment | Application | Version  |
| ----------------- |-----------|---------|
| WSL2 Ubuntu 20.04 | terraform | v1.0.0  |
| WSL2 Ubuntu 20.04 | aws-cli | v2.2.12 |

## Deployment

To deploy this project:
 
Clone the project

```bash
  git clone https://github.com/JManzur/demo-vpc.git
```

Go to the project directory

```bash
  cd vpc-demo
```

Link aws account

```bash
  aws configure
```

Init terraform in order to download the appropriate modules

```bash
  terraform init
```

Edit the necesaries variables and cidr and apply

```bash
  terraform apply
```

## Resources

Here are some related projects

[AWS VPC Terraform module](https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws/latest)

## Author

- [@jmanzur](https://github.com/JManzur)