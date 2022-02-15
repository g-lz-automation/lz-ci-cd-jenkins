data "local_file" "helm_chart_values" {
  filename = "${path.module}/jenkins-values.yaml"
}

resource "helm_release" "jenkins" {
  name       = "jenkins"
  repository = "https://charts.jenkins.io"
  chart      = "jenkins"
  version    = "3.11.4"
  timeout    = 1200

  values = [data.local_file.helm_chart_values.content]

  depends_on = [
    kubernetes_secret.gh-secrets,
  ]
}
