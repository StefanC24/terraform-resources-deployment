variable "client_id" {
  description = "Azure AD Application Client ID"
  type        = string
  sensitive   = true
}

variable "client_secret" {
  description = "Azure AD Application Client Secret"
  type        = string
  sensitive   = true
}

variable "tenant_id" {
  description = "Azure AD Tenant ID"
  type        = string
  sensitive   = true
}

variable "subscription_id" {
  description = "Azure Subscription ID"
  type        = string
  sensitive   = true
}