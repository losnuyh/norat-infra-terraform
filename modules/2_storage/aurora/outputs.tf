output "db_write_host" {
  value = aws_rds_cluster.main.endpoint
}

output "db_read_host" {
  value = aws_rds_cluster.main.reader_endpoint
}

output "db_port" {
  value = aws_rds_cluster.main.port
}
