resource "aws_s3_bucket" "test_b" {
  bucket        = "test.2479.b"
  force_destroy = true
}