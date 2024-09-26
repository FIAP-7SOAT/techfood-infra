resource "kubernetes_service" "techfood_app" {
  metadata {
    name = "techfood-app"
  }

  spec {
    type = "NodePort"

    port {
      port        = 8080
      target_port = 8080
      node_port   = 30080
    }

    selector = {
      app = kubernetes_deployment.techfood_app.metadata[0].labels["app"]
    }
  }
}