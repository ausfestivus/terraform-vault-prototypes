# source: https://github.com/hashicorp/learn-vault-codify/blob/main/community/policies/admin-policy.hcl
# learning: https://developer.hashicorp.com/vault/tutorials/policies/policies?variants=vault-deploy%3Aselfhosted

# Manage our prototypes userpass auth
path "mfa-proto/userpass" {
  capabilities = ["create", "read", "update", "delete", "list"]
}

# Manage identity entities
path "identity/entity" {
  capabilities = ["create", "read", "update", "delete", "list"]
}

path "identity/entity/*" {
  capabilities = ["create", "read", "update", "delete", "list"]
}

path "identity/entity-alias" {
  capabilities = ["create", "read", "update", "delete", "list"]
}

path "identity/entity-alias/*" {
  capabilities = ["create", "read", "update", "delete", "list"]
}

# Manage MFA totp
path "identity/mfa/method/totp" {
  capabilities = ["read", "list"]
}

path "identity/mfa/method/totp/*" {
  capabilities = ["create", "read", "update", "delete", "list"]
}

# Manage MFA login enforcement
path "identity/mfa/login-enforcement/mfa-proto" {
  capabilities = ["create", "read", "update", "delete", "list"]
}

# Allow managing leases
path "sys/leases/*"
{
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

# Manage auth methods broadly across Vault
path "auth/*"
{
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

# Create, update, and delete auth methods
path "sys/auth/*"
{
  capabilities = ["create", "update", "delete", "sudo"]
}

# List auth methods
path "sys/auth"
{
  capabilities = ["read"]
}

# Create and manage ACL policies
path "sys/policies/acl/*"
{
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

# List ACL policies
path "sys/policies/acl"
{
  capabilities = ["list"]
}

# Create and manage secrets engines broadly across Vault.
path "sys/mounts/*"
{
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

# List enabled secrets engines
path "sys/mounts"
{
  capabilities = ["read", "list"]
}

# Read health checks
path "sys/health"
{
  capabilities = ["read", "sudo"]
}

# Allow tokens to query themselves
path "auth/token/lookup-self" {
  capabilities = ["read"]
}

# Allow tokens to renew themselves
path "auth/token/renew-self" {
    capabilities = ["update"]
}

# Allow tokens to revoke themselves
path "auth/token/revoke-self" {
    capabilities = ["update"]
}
