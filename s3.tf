resource "aws_s3_bucket" "project_bucket" {
  bucket = "mybucket"
}

resource "aws_s3_bucket_cors_configuration" "project_bucket_cors" {
  bucket = var.bucket_url

  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["PUT", "POST"]
    allowed_origins = [var.coldsis_website]
    expose_headers  = ["ETag"]
    max_age_seconds = 3000
  }

  cors_rule {
    allowed_methods = ["GET"]
    allowed_origins = ["*"]
  }
}