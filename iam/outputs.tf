output "access_key_id" {
  value = var.create_access_key ? aws_iam_access_key.iam_user_key[0].id : "Not created"
}

output "secret_access_key" {
  sensitive = true
  value     = var.create_access_key ? aws_iam_access_key.iam_user_key[0].secret : "Not created"
}