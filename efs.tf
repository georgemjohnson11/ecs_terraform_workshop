resource "aws_efs_file_system" "cellov2_storage" {
  creation_token = "nona_efs"
  encrypted = true
  tags = {
    Name = "ECS-EFS-cellov2"
  }
}

resource "aws_efs_file_system" "cellov2_resources" {
  creation_token = "cellov2_resources"
  encrypted = true
  tags = {
    Name = "ECS-EFS-cellov2-resources"
  }
}

resource "aws_efs_file_system" "cellov2_users" {
  creation_token = "cellov2_users"
  encrypted = true
  tags = {
    Name = "ECS-EFS-cellov2-users"
  }
}

resource "aws_efs_mount_target" "nona_cellov2_mount_east_1a" {
  file_system_id = aws_efs_file_system.cellov2_storage.id
  subnet_id      = "subnet-052eecc33236879ab"
}

resource "aws_efs_mount_target" "nona_cellov2_mount_east_1b" {
  file_system_id = aws_efs_file_system.cellov2_resources.id
  subnet_id      = "subnet-057e022aad32f1037"
}

resource "aws_efs_mount_target" "nona_cellov2_mount_east_1c" {
  file_system_id = aws_efs_file_system.cellov2_users.id
  subnet_id      = "subnet-0354ec48abaa57fe9"
}

resource "aws_efs_access_point" "access-nona_cellov2_mount_east_storage" {
  file_system_id = aws_efs_file_system.cellov2_storage.id

  posix_user {
    gid = 1000
    uid = 1000
  }

  root_directory {
    path = "/"
    creation_info {
      owner_gid   = 1000
      owner_uid   = 1000
      permissions = "0777"
    }
  }
}

resource "aws_efs_access_point" "access-nona_cellov2_mount_east_users" {
  file_system_id = aws_efs_file_system.cellov2_users.id

  posix_user {
    gid = 1000
    uid = 1000
  }

  root_directory {
    path = "/"
    creation_info {
      owner_gid   = 1000
      owner_uid   = 1000
      permissions = "0777"
    }
  }
}

resource "aws_efs_file_system" "cellov1_storage" {
  creation_token = "nona_cellov1_efs"
  encrypted = true
  tags = {
    Name = "ECS-EFS-cellov1"
  }
}

resource "aws_efs_mount_target" "nona_cellov1_mount_east_1a" {
  file_system_id = aws_efs_file_system.cellov1_storage.id
  subnet_id      = "subnet-0e44ce85adb766818"
}


resource "aws_efs_access_point" "access-nona_cellov1_mount_east" {
  file_system_id = aws_efs_file_system.cellov1_storage.id

  posix_user {
    gid = 1000
    uid = 1000
  }

  root_directory {
    path = "/"
    creation_info {
      owner_gid   = 1000
      owner_uid   = 1000
      permissions = "0777"
    }
  }
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

resource "aws_efs_mount_target" "nona_knox_mount_east_1a" {
  file_system_id = aws_efs_file_system.knox_storage.id
  subnet_id      = "subnet-0d7d847bd9e4c7e00"
}

resource "aws_efs_mount_target" "nona_knox_mount_east_1b" {
  file_system_id = aws_efs_file_system.knox_storage.id
  subnet_id      = "subnet-0fdce4f93f8473f67"
}

resource "aws_efs_access_point" "access-nona_knox_mount_east" {
  file_system_id = aws_efs_file_system.knox_storage.id

  posix_user {
    gid = 1000
    uid = 1000
  }

  root_directory {
    path = "/"
    creation_info {
      owner_gid   = 1000
      owner_uid   = 1000
      permissions = "0777"
    }
  }
}

