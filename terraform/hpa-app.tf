resource "kubernetes_horizontal_pod_autoscaler_v2" "techfood_app_hpa" {
  metadata {
    name = "techfood-app-hpa"
  }

  spec {
    scale_target_ref {
      api_version = "apps/v1"
      kind        = "Deployment"
      name        = kubernetes_deployment.techfood_app.metadata[0].name
    }

    min_replicas = 1
    max_replicas = 10

    metric {
      type = "Resource"
      resource {
        name = "cpu"
        target {
          type               = "Utilization"
          average_utilization = 50
        }
      }
    }
  }
}