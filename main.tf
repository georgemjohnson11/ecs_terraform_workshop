provider "aws" {
  region  = "us-east-1"
  version = "~> 2.63"
}


terraform {
  backend "s3" {
    bucket = "ecsworkshopbucket"
    key    = "state/terraform.tfstate"
    region = "us-east-1"
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

# nonasoftware.org
module "wordpress-ecs" {
  source  = "atpoirie/wordpress-ecs/aws"
  version = "1.0.0"
  ecs_service_subnet_ids = module.vpc.private_subnets
  lb_subnet_ids = module.vpc.public_subnets
  db_subnet_group_subnet_ids = module.vpc.database_subnets
>>>>>>> Stashed changes
}