module "jenkins-project" {
  source                      = "terraform-google-modules/project-factory/google"
  random_project_id           = "true"
  default_service_account     = "deprivilege"
  name                        = "prj-jenkins"
  org_id                      = "906003358053"
  billing_account             = "01D518-048AA1-030B5D"
  folder_id                   = "929982949293"
}
