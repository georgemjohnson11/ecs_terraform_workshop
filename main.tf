provider "aws" {
  region  = "us-east-1"
  version = "~> 3.63"
}


terraform {
  backend "s3" {
    bucket      = "nona-tfstate"
    key         = "state/terraform.tfstate"
    kms_key_id  = "alias/nona_bucketstate_key"
    encrypt     = true
    region      = "us-east-1"
  }
}

resource "aws_s3_bucket" "nona_tfstate" {
  bucket = "nona-tfstate"

  tags = {
    Name        = "nona_tfstate"
    Environment = "prod"
  }
  acl    = "private"

 versioning {
   enabled = true
 }

 server_side_encryption_configuration {
   rule {
     apply_server_side_encryption_by_default {
       kms_master_key_id = aws_kms_key.nona_bucketstate_key.arn
       sse_algorithm     = "aws:kms"
     }
   }
 }
}

resource "aws_s3_bucket_public_access_block" "block" {
 bucket = aws_s3_bucket.nona_tfstate.id

 block_public_acls       = true
 block_public_policy     = true
 ignore_public_acls      = true
 restrict_public_buckets = true
}


resource "aws_kms_key" "nona_bucketstate_key" {
 description             = "This key is used to encrypt bucket objects"
 deletion_window_in_days = 10
 enable_key_rotation     = true
}

resource "aws_kms_alias" "key-alias" {
 name          = "alias/nona_bucketstate_key"
 target_key_id = aws_kms_key.nona_bucketstate_key.key_id
}