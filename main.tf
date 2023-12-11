
resource "google_iam_workload_identity_pool" "tfc_identity_pool" {
  for_each = var.tfc_identity_pool
  project = each.value.project
  workload_identity_pool_id =  each.value.workload_identity_pool_id
  display_name              = each.value.display_name
  description               = each.value.description
  disabled                  = false

}

resource "google_iam_workload_identity_pool_provider" "pool-provider" {
  for_each = var.pool-provider

  project = each.value.project
  workload_identity_pool_id          = each.value.workload_identity_pool_id
  workload_identity_pool_provider_id = each.value.workload_identity_pool_provider_id
  display_name                       = each.value.display_name
  description                        = each.value.description
  disabled                           = false

  attribute_mapping = {
    "attribute.actor"      = "assertion.actor"
    "attribute.repository" = "assertion.repository"
    "google.subject"       = "assertion.sub"
  }

  oidc {
    issuer_uri = "https://token.actions.githubusercontent.com"
  }

}

resource "google_service_account_iam_binding" "workload_sa" {
  for_each = var.workload_sa
  service_account_id = each.value.service_account_id#"projects/apidev-apigeex-sandbox-d29a/serviceAccounts/git-cicd@apidev-apigeex-sandbox-d29a.iam.gserviceaccount.com"
  role               = each.value.binding_role
  members = each.value.members #["principalSet://iam.googleapis.com/projects/896403917428/locations/global/workloadIdentityPools/terraform-pool-prod/attribute.repository/pedroaddias/apigee-sample"]
  depends_on = [ google_iam_workload_identity_pool_provider.pool-provider ]
}


resource "google_service_account_iam_member" "gce-default-account-iam" {
  for_each = var.sa_roles
  service_account_id = each.value.service_account_id
  role               = each.value.role
  member             = each.value.member
  #"serviceAccount:git-cicd@apidev-apigeex-sandbox-d29a.iam.gserviceaccount.com"
}

