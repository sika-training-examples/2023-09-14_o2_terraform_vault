resource "vault_identity_entity" "foo" {
  name     = "foo-entity"
  policies = []
}

resource "vault_generic_endpoint" "userpass_foo" {
  depends_on = [
    vault_auth_backend.userpass,
  ]
  path                 = "auth/userpass/users/foo"
  ignore_absent_fields = true

  data_json = jsonencode(
    {
      "password" = "foo"
    }
  )
}

resource "vault_identity_entity_alias" "userpass_foo" {
  depends_on = [
    vault_generic_endpoint.userpass_foo,
  ]
  name           = "foo"
  mount_accessor = vault_auth_backend.userpass.accessor
  canonical_id   = vault_identity_entity.foo.id
}
