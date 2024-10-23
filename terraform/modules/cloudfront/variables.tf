variable "s3_bucket_id" {
  description = "The S3 bucket ID"
  type        = string
}

variable "s3_website_endpoint" {
  description = "The S3 website endpoint"
  type        = string
}

variable "acm_certificate_arn" {
  description = "The ACM certificate ARN"
  type        = string
}

variable "domain_name" {
  description = "The domain name for CloudFront"
  type        = string
}
