# S3 Module
module "s3_bucket" {
  source      = "./modules/s3-bucket"
  bucket_name = var.bucket_name
  acl         = var.acl
  environment = var.environment
}

# ACM Module for SSL
module "acm" {
  source      = "./modules/acm"
  domain_name = var.domain_name
  zone_id     = module.route53.route53_zone_id
}

# CloudFront Module
module "cloudfront" {
  source              = "./modules/cloudfront"
  domain_name         = var.domain_name
  s3_bucket_id        = module.s3_bucket.bucket_id
  s3_website_endpoint = module.s3_bucket.website_endpoint
  acm_certificate_arn = module.acm.certificate_arn
}

# Route53 Module for DNS
module "route53" {
  source                  = "./modules/route53"
  domain_name             = var.domain_name
  cloudfront_domain_name  = module.cloudfront.cloudfront_distribution_domain
  cloudfront_zone_id      = module.cloudfront.cloudfront_distribution_domain
}
