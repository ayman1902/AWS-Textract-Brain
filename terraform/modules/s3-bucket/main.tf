resource "aws_s3_bucket" "this" {
  bucket = var.bucket_name

  # Enable static website hosting
  website {
    index_document = "index.html"  # Default document for the website
    # error_document = "error.html"  # Optional: Set an error document
  }

  # Remove the object_ownership line
  tags = {
    Name        = var.bucket_name
    Environment = var.environment
  }
}
resource "aws_s3_bucket_public_access_block" "this" {
  bucket = aws_s3_bucket.this.id

  block_public_acls       = false
  ignore_public_acls      = false
  block_public_policy     = false
  restrict_public_buckets = false
}


resource "aws_s3_bucket_policy" "this" {
  bucket = aws_s3_bucket.this.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid       = "PublicReadGetObject",
        Effect    = "Allow",
        Principal = "*",
        Action    = "s3:GetObject",
        Resource  = "${aws_s3_bucket.this.arn}/*"
      },
    ]
  })
}

output "bucket_name" {
  value = aws_s3_bucket.this.bucket
}

output "website_endpoint" {
  value = aws_s3_bucket.this.website_endpoint
}
