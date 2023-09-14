resource "vault_policy" "super-admin" {
  name = "super-admin"

  policy = <<EOT
path "*" {
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}
EOT
}

resource "vault_policy" "read-all-on-path-secret" {
  name = "read-all-on-path-secret"
  policy = file("policies/read-all-on-path-secret.hcl")
}
