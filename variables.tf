variable "vpc_id" {
  description = "The ID of the VPC where the subnets will be created."
  type        = string
}

variable "igw_id" {
  description = "The ID of the Internet Gateway."
  type        = string
}

variable "public_subnet_ids" {
  description = "The IDs of the public subnets."
  type        = list(string)
}

variable "private_subnet_ids" {
  description = "The IDs of the private subnets."
  type        = list(string)
}

variable "full_private_subnet_ids" {
  description = "The IDs of the full private subnets."
  type        = list(string)
}

variable "public_subnet_cidrs" {
  description = "A list of CIDR blocks for the public subnets."
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "A list of CIDR blocks for the private subnets."
  type        = list(string)
}
variable "full_private_subnet_cidrs" {
  description = "A list of CIDR blocks for the full private subnets."
  type        = list(string)
}

variable "nat_gateway_id" {
  description = "The ID of the NAT Gateway."
  type        = string
}