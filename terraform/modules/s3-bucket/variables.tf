variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
}

variable "acl" {
  description = "The access control list (ACL) for the bucket"
  default     = "private"
}

variable "environment" {
  description = "The environment (dev, prod, etc.)"
  type        = string
}
