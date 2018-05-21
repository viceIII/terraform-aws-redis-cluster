#
# Subnet group resources
#
resource "aws_elasticache_subnet_group" "redis" {
  name       = "${var.redis_identifier}-redis-subnet-group-${var.environment}"
  subnet_ids = ["${var.subnet_ids}"]
}

#
# ElastiCache resources
#
resource "aws_elasticache_replication_group" "redis" {
  replication_group_id          = "${lower(var.redis_identifier)}"
  replication_group_description = "Replication group for Redis"
  automatic_failover_enabled    = "${var.automatic_failover_enabled}"
  number_cache_clusters         = "${var.desired_clusters}"
  node_type                     = "${var.instance_type}"
  engine_version                = "${var.engine_version}"

  /*parameter_group_name          = "${var.parameter_group}"*/
  subnet_group_name  = "${aws_elasticache_subnet_group.redis.name}"
  security_group_ids = ["${var.security_group_ids}"]
  maintenance_window = "${var.maintenance_window}"
  port               = "6379"

  tags {
    Name        = "${var.redis_identifier}-${var.environment}-redis-replication-group"
    Environment = "${var.environment}"
  }
}
