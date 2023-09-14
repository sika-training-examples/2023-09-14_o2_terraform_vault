resource "vault_identity_entity" "bar" {
  name = "bar-entity"
  policies = [
    vault_policy.read-all-on-path-secret.name,
  ]
}

resource "vault_generic_endpoint" "userpass_bar" {
  depends_on = [
    vault_auth_backend.userpass,
  ]
  path                 = "auth/userpass/users/bar"
  ignore_absent_fields = true

  data_json = jsonencode(
    {
      "password" = "bar"
    }
  )
}

resource "vault_identity_entity_alias" "userpass_bar" {
  depends_on = [
    vault_generic_endpoint.userpass_bar,
  ]
  name           = "bar"
  mount_accessor = vault_auth_backend.userpass.accessor
  canonical_id   = vault_identity_entity.bar.id
}
