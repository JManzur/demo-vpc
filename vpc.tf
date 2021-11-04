#JManzur - 06/2021
#Deploy VPC using AWS VPC Module 
#Registry: https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws/latest

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "demo-vpc"
  cidr = "10.10.0.0/16"

  #AZ's and Subnets Definition
  azs              = ["${var.aws_region}a", "${var.aws_region}b", "${var.aws_region}c"]
  private_subnets  = ["10.10.1.0/24", "10.10.2.0/24", "10.10.3.0/24"]
  public_subnets   = ["10.10.11.0/24", "10.10.12.0/24", "10.10.13.0/24"]
  database_subnets = ["10.10.21.0/24", "10.10.22.0/24", "10.10.23.0/24"]
  intra_subnets    = ["10.10.31.0/24", "10.10.32.0/24", "10.10.33.0/24"]

  tags                 = merge(var.project-tags, { Name = "${var.resource-name-tag}-vpc" }, )
  database_subnet_tags = merge(var.project-tags, { Name = "${var.resource-name-tag}-db_subnet" }, )
  private_subnet_tags  = merge(var.project-tags, { Name = "${var.resource-name-tag}-private_subnet" }, )
  public_subnet_tags   = merge(var.project-tags, { Name = "${var.resource-name-tag}-public_subnet" }, )
  intra_subnet_tags    = merge(var.project-tags, { Name = "${var.resource-name-tag}-intra_subnet" }, )

  #Deny Access to DB subnet form public subnet
  create_database_subnet_group = false

  #Routing tables 
  manage_default_route_table = true

  default_route_table_tags  = merge(var.project-tags, { Name = "${var.resource-name-tag}-rt" }, )
  private_route_table_tags  = merge(var.project-tags, { Name = "${var.resource-name-tag}-private_rt" }, )
  public_route_table_tags   = merge(var.project-tags, { Name = "${var.resource-name-tag}-public_rt" }, )
  database_route_table_tags = merge(var.project-tags, { Name = "${var.resource-name-tag}-db_rt" }, )
  intra_route_table_tags    = merge(var.project-tags, { Name = "${var.resource-name-tag}-intra_rt" }, )

  #Nat Gateway
  enable_nat_gateway = true
  single_nat_gateway = true

  nat_gateway_tags = merge(var.project-tags, { Name = "${var.resource-name-tag}-ng" }, )

  #Deny all SG:
  manage_default_security_group  = true
  default_security_group_ingress = []
  default_security_group_egress  = []

  default_security_group_tags = merge(var.project-tags, { Name = "${var.resource-name-tag}-sg" }, )

  #VPC Flow Logs 
  enable_flow_log                      = true
  create_flow_log_cloudwatch_log_group = true
  create_flow_log_cloudwatch_iam_role  = true
  flow_log_max_aggregation_interval    = 60

  vpc_flow_log_tags = merge(var.project-tags, { Name = "${var.resource-name-tag}-vpc_logs" }, )
}

## Data Sources declarations ##
## Fetch the vpc id to print and use the output
data "aws_vpc" "selected" {
  filter {
    name   = "tag:Name"
    values = ["demo-vpc"]
  }

  depends_on = [module.vpc]
}

## Fetch the public subnets ids to print and use the output
data "aws_subnet_ids" "public" {
  vpc_id = data.aws_vpc.selected.id

  filter {
    name   = "tag:Name"
    values = ["demo-public_subnet"]
  }

  depends_on = [module.vpc]
}

## Fetch the privates subnets ids to print and use the output
data "aws_subnet_ids" "private" {
  vpc_id = data.aws_vpc.selected.id

  filter {
    name   = "tag:Name"
    values = ["demo-private_subnet"]
  }
  depends_on = [module.vpc]
}