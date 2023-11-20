//TODO Tom, make configs
resource "aws_db_instance" "db_instance" {
  allocated_storage                     = 20
  auto_minor_version_upgrade            = true
  availability_zone                     = "eu-central-1b"
  backup_retention_period               = 7
  backup_window                         = "23:51-00:21"
  ca_cert_identifier                    = "rds-ca-2019"
  copy_tags_to_snapshot                 = true
  db_subnet_group_name                  = "default-vpc-366bb05f"
  delete_automated_backups              = true
  deletion_protection                   = false
  enabled_cloudwatch_logs_exports       = []
  engine                                = "postgres"
  engine_version                        = "11.12"
  iam_database_authentication_enabled   = false
  identifier                            = "database-magnolia-local"
  instance_class                        = "db.t2.micro"
  iops                                  = 0
  license_model                         = "postgresql-license"
  maintenance_window                    = "sat:03:56-sat:04:26"
  max_allocated_storage                 = 0
  monitoring_interval                   = 0
  multi_az                              = false
  option_group_name                     = "default:postgres-11"
  parameter_group_name                  = "default.postgres11"
  performance_insights_enabled          = true
  performance_insights_kms_key_id       = "arn:aws:kms:eu-central-1:914541419452:key/16185f26-7a65-475a-8e7c-550680d5b243"
  performance_insights_retention_period = 7
  port                                  = 5432
  publicly_accessible                   = false
  security_group_names                  = []
  skip_final_snapshot                   = true
  storage_encrypted                     = false
  storage_type                          = "gp2"
  tags                                  = {}
  username                              = "postgres"
  vpc_security_group_ids                = [
    "sg-af64d8c6",
  ]

  timeouts {}
}
