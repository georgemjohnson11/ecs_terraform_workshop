# note: another bucket is created in main.tf for 
# the terraform state file



#Fluigi
resource "aws_s3_bucket" "nonasoftware" {
  bucket = "nonasoftware"

  tags = {
    Name        = "nonasoftware"
    Environment = "prod"
  }
  acl    = "private"

 versioning {
   enabled = true
 }

 server_side_encryption_configuration {
   rule {
     apply_server_side_encryption_by_default {
       kms_master_key_id = aws_kms_key.nonasoftware_bucketstate_key.arn
       sse_algorithm     = "aws:kms"
     }
   }
 }
}

resource "aws_s3_bucket_public_access_block" "nonasoftware-block" {
 bucket = aws_s3_bucket.nonasoftware.id

 block_public_acls       = false
 block_public_policy     = false
 ignore_public_acls      = false
 restrict_public_buckets = false
}


resource "aws_kms_key" "nonasoftware_bucketstate_key" {
 description             = "This key is used to encrypt bucket objects"
 deletion_window_in_days = 10
 enable_key_rotation     = true
}

resource "aws_kms_alias" "nonasoftware-alias" {
 name          = "alias/nonasoftware_bucketstate_key"
 target_key_id = aws_kms_key.nonasoftware_bucketstate_key.key_id
}

#Fluigi
resource "aws_s3_bucket" "fluigi" {
  bucket = "fluigi"

  tags = {
    Name        = "fluigi"
    Environment = "prod"
  }
  acl    = "private"

 versioning {
   enabled = true
 }

 server_side_encryption_configuration {
   rule {
     apply_server_side_encryption_by_default {
       kms_master_key_id = aws_kms_key.fluigi_bucketstate_key.arn
       sse_algorithm     = "aws:kms"
     }
   }
 }
}

resource "aws_s3_bucket_public_access_block" "fluigi-block" {
 bucket = aws_s3_bucket.fluigi.id

 block_public_acls       = true
 block_public_policy     = true
 ignore_public_acls      = true
 restrict_public_buckets = true
}


resource "aws_kms_key" "fluigi_bucketstate_key" {
 description             = "This key is used to encrypt bucket objects"
 deletion_window_in_days = 10
 enable_key_rotation     = true
}

resource "aws_kms_alias" "fluigi-alias" {
 name          = "alias/fluigi_bucketstate_key"
 target_key_id = aws_kms_key.fluigi_bucketstate_key.key_id
}