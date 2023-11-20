resource "aws_dynamodb_table" "dynamodb_table" {

  hash_key  = var.hashkey
  range_key = (var.rangekey != "" ? var.rangekey : "")
  name      = var.name
  dynamic "attribute" {
    for_each = var.attributes
    content {
      name = attribute.value.name
      type = attribute.value.type
    }
  }

  billing_mode   = var.billing_mode
  read_capacity  = var.read_capacity
  stream_enabled = var.stream_enabled
  tags           = {
    team = var.team
  }
  write_capacity = var.write_capacity

  point_in_time_recovery {
    enabled = true
  }

}
