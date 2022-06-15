resource "aws_efs_file_system" "cellov2_storage" {
  creation_token = "nona_efs"
  encrypted = true
  tags = {
    Name = "ECS-EFS-FS-NONA"
  }
}

resource "aws_efs_mount_target" "nona-mount" {
  file_system_id = aws_efs_file_system.cellov2_storage.id
  subnet_id      = "subnet-052eecc33236879ab"
}

