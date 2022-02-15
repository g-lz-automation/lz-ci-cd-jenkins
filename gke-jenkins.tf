module "jenkins" {
  source            = "dritux/jenkins/kubernetes"
  version           = "1.0.0"
  create_namespace  = true
}
