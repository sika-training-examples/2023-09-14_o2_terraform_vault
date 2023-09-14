resource "vault_auth_backend" "userpass" {
  type = "userpass"
}

resource "vault_mount" "kv2-secret" {
  path = "secret"
  type = "kv-v2"
}
