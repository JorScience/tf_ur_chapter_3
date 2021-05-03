resource "aws_dynamodb_table" "terraform_locks" {
    name = "terraform-up-and-running-lock"
    billing_mode = "PAY_PER_REQUEST"
    hash_key = "LockID"

    attribute {
        name = "LockID"
        type = "S"
    }
}