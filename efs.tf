resource "aws_efs_file_system" "cellov2_storage" {
  creation_token = "nona_efs"
  encrypted = true
  tags = {
    Name = "ECS-EFS-cellov2"
  }
}

resource "aws_efs_mount_target" "nona_cellov2_mount" {
  file_system_id = aws_efs_file_system.cellov2_storage.id
  subnet_id      = "subnet-052eecc33236879ab"
}

resource "aws_efs_file_system" "cellov1_storage" {
  creation_token = "nona_cellov1_efs"
  encrypted = true
  tags = {
    Name = "ECS-EFS-cellov1"
  }
}

resource "aws_efs_mount_target" "nona_cellov1_mount" {
  file_system_id = aws_efs_file_system.cellov1_storage.id
  subnet_id      = "subnet-052eecc33236879ab"
}



resource "aws_efs_file_system" "clothov4_storage" {
  creation_token = "nona_clothov4_efs"
  encrypted = true
  tags = {
    Name = "ECS-EFS-clothov4"
  }
}

resource "aws_efs_mount_target" "nona_clothov4_mount" {
  file_system_id = aws_efs_file_system.clothov4_storage.id
  subnet_id      = "subnet-052eecc33236879ab"
}

# knox
resource "aws_efs_file_system" "knox_storage" {
  creation_token = "nona_knox_efs"
  encrypted = true
  tags = {
    Name = "ECS-EFS-knox"
  }
}

resource "aws_efs_mount_target" "nona_knox_mount" {
  file_system_id = aws_efs_file_system.knox_storage.id
  subnet_id      = "subnet-052eecc33236879ab"
}


