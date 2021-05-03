provider "aws" {
    region = "us-east-2"
}

terraform {
    backend "s3" {
        bucket              = "terraform-up-and-running-state-jorikschra"
        key                 = "global/s3/terraform.tfstate"
        region              = "us-east-2"
        dynamodb_table      = "terraform-up-and-running-locks"
        encrypt             = true
    }
}

output "s3_bucket_arn" {
    value       = aws_s3_bucket.terraform_state.arn
    description = "The ARN of the S3 bucket"
}

output "dynamodb_table_name" {
    value = aws_dynamodb_table.terraform_locks.name
    description = "The name of the DynamoDB table"
}
