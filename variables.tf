variable "project_id" {
  type = string
}

variable "pool_id" {
  type = string
}

variable "provider_id" {
  type = string
}

variable "role" {
  type = list(string)
}

variable "biding_role" {
  type = string
}

variable "service_account_id" {
  type = string
}
variable "pool-provider" {
  description = "A map of pool-provider with their configurations"
  type = map(object({
    project                            = string
    workload_identity_pool_id          = string
    workload_identity_pool_provider_id = string
    display_name                       = string
    description                        = string
    disabled                           = bool
    attribute_mapping                  = map(string)
    oidc = object({
      issuer_uri = string
    })
  }))
}

variable "tfc_identity_pool" {
  description = "A map of identity pool with their configurations"
  type = map(object({
    project                   = string
    workload_identity_pool_id = string
    display_name              = string
    description               = string
    disabled                  = bool
  }))
}

variable "workload_sa" {
  description = "A map of workload sa with their configurations"
  type = map(object({
    service_account_id = string
    binding_role               = string
    members            = list(string)
  }))
}


variable "sa_roles" {
  description = "A map of Roles of SA in Workload Federation with their configurations"
  type = map(object({
    service_account_id = string
    role               = list(string)
    member             = string
  }))
}