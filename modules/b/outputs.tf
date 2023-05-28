output "bucket_arn" {
  description = "ARN of test bucket b"
  value       = aws_s3_bucket.test_b.arn
}
