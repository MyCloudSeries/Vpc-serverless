resource "aws_s3_bucket" "project_bucket" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket_acl" "project_bucket_acl" {
  bucket = aws_s3_bucket.project_bucket.id
  acl    = "public-read"
}
resource "aws_s3_bucket_cors_configuration" "project_bucket" {
  bucket = aws_s3_bucket.project_bucket.bucket

  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["PUT", "POST"]
    allowed_origins = [var.coldsis_website]
    expose_headers  = ["ETag"]
    max_age_seconds = 3000
  }

  cors_rule {
    allowed_methods = ["GET"]
    allowed_origins = [var.coldsis_website]
  }
}

