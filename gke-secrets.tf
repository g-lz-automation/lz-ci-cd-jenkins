/*****************************************
  K8S secrets for configuring K8S executers
 *****************************************/
resource "kubernetes_secret" "jenkins-secrets" {
  metadata {
    name = var.jenkins_k8s_config
  }
  data = {
    project_id          = module.enables-google-apis.project_id
    kubernetes_endpoint = "https://${google_container_cluster.jenkins-gke.endpoint}"
    ca_certificate      = google_container_cluster.jenkins-gke.master_auth.0.cluster_ca_certificate
    jenkins_tf_ksa      = module.enables-google-apis.project_id
  }
}

/*****************************************
  K8S secrets for GH
 *****************************************/
resource "kubernetes_secret" "gh-secrets" {
  metadata {
    name = "github-secrets"
  }
  data = {
    github_username = var.github_username
    github_repo     = var.github_repo
    github_token    = var.github_token
  }
}
