resource "kubernetes_deployment" "techfood_app" {
  metadata {
    name = "techfood-app"
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "techfood-app"
      }
    }

    template {
      metadata {
        labels = {
          app = "techfood-app"
        }
      }

      spec {
        container {
          name  = "techfood-app"
          image = "pcantarelli/techfood"

          port {
            container_port = 8080
          }

          env {
            name = "SPRING_DATASOURCE_URL"
            value_from {
              secret_key_ref {
                name = "secrets"
                key  = "SPRING_DATASOURCE_URL"
              }
            }
          }
          
          env {
            name = "SPRING_DATASOURCE_USERNAME"
            value_from {
              secret_key_ref {
                name = "secrets"
                key  = "SPRING_DATASOURCE_USERNAME"
              }
            }
          }

          env {
            name = "SPRING_DATASOURCE_PASSWORD"
            value_from {
              secret_key_ref {
                name = "secrets"
                key  = "SPRING_DATASOURCE_PASSWORD"
              }
            }
          }

          resources {
            requests = {
              cpu    = "100m"
              memory = "200Mi"
            }
            limits = {
              cpu    = "500m"
              memory = "500Mi"
            }
          }
        }
      }
    }
  }
}