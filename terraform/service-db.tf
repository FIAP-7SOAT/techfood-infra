resource "kubernetes_service" "postgres_service" {
  metadata {
    name = "postgres"
  }

  spec {
    type = "ClusterIP"

    port {
      port        = 5432
      target_port = 5432
    }

    selector = {
      app = "postgres"
    }
  }
}