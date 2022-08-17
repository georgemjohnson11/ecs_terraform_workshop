resource "aws_elasticache_subnet_group" "neptune" {
  name       = "neptune-cache-subnet"
  subnet_ids = ["subnet-0fc37686a7f0dcead"]
}

resource "aws_elasticache_cluster" "neptune-redis" {
  cluster_id           = "nona-redis"
  engine               = "redis"
  node_type            = "cache.t3.micro"
  num_cache_nodes      = 1
  parameter_group_name = "default.redis5.0"
  engine_version       = "5.0.6"
  port                 = 6379
  subnet_group_name    = aws_elasticache_subnet_group.neptune.name
}
