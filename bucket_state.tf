resource "aws_s3_bucket" "terraform_state" {
    bucket = "terraform-up-and-running-state-jorikschra"

    # Prevent accidental deletion
    lifecycle {
        prevent_destroy = true
    }

    # Enable versioning
    versioning {
        enabled = true
    }

    # Enable server-side encryption
    server_side_encryption_configuration {
      rule {
          apply_server_side_encryption_by_default {
              sse_algorithm = "AES256"
          } 
      }
    }
}