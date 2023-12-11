
#service_account_id = "projects/apidev-apigeex-sandbox-d29a/serviceAccounts/git-cicd@apidev-apigeex-sandbox-d29a.iam.gserviceaccount.com"
#biding_role        = "roles/iam.workloadIdentityUser"

tfc_identity_pool = {
 "uat-example" = {
    project = ""
    workload_identity_pool_id          = ""
    display_name                       = ""
    description                        = ""
  }
}


pool-provider = {
  "uat-example" = {
    project = ""
  workload_identity_pool_id          = ""
  workload_identity_pool_provider_id = ""
  display_name                       = ""
  description                        = ""
  }
}

workload_sa = {
  "uat-example" = {
     service_account_id = ""
    binding_role = []
    members = [] ##["principalSet://iam.googleapis.com/projects/896403917428/locations/global/workloadIdentityPools/terraform-pool-prod/attribute.repository/pedroaddias/apigee-sample"]
  }
}




sa_roles = {
  "uat-example" = {
    service_account_id = ""
    role = []
    member = "" #"serviceAccount:git-cicd@apidev-apigeex-sandbox-d29a.iam.gserviceaccount.com"
  }
}
