variable "filename" {
     default = "gm.txt"
}

variable "content" {
     default = " I have what"
}

variable "vpc" {
     default = "vpc-040b8cf9bab07cf60"
}

variable "subnet" {
 type        = list(string)
 description = "Public Subnet CIDR values"
 default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}
 
variable "private_subnet_cidrs" {
 type        = list(string)
 description = "Private Subnet CIDR values"
 default     = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
}

variable "SSH_Key" {
     default = ""
}
