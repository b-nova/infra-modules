resource "vault_approle_auth_backend_role" "role" {
  backend        = var.backend
  role_name      = var.name
  token_max_ttl  = 14400
  token_ttl      = 3600
  token_policies = var.policies
}

data "vault_approle_auth_backend_role_id" "role_id" {
  backend   = var.backend
  role_name = vault_approle_auth_backend_role.role.role_name
}
