# Demo VPC
Terraform template to deploy a VPC with segmented subnets, basic routing tables, security groups and of course everything properly tagged.

## Resources deployed by this manifest:
- 1 Private subnet per AZ.
- 1 Database private subnet per AZ.
- 1 Intranet subnet (segregated - no internet)  per AZ.
- 1 Public subnet per AZ.
- 1 Route table per subnet.
- Single NAT Gateway.
- Single Internet Gateway.
- VPC flow logs.
- Demo "Denny All" Security Group.

### Deployment diagram (One AZ):

![App Screenshot](https://lh3.googleusercontent.com/-SmjZX8ZbVkA/YWcDw3FwvTI/AAAAAAAAFso/mUHURQ-LW2o02NfSmHmJzIdVPBice2cBQCLcBGAsYHQ/s16000/demo-vpc.drawio.png)

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

- [AWS VPC Terraform module](https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws/latest)

## Author

- [@jmanzur](https://github.com/JManzur)