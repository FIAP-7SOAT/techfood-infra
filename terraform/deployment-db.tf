resource "kubernetes_deployment" "postgres" {
  metadata {
    name = "postgres"
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "postgres"
      }
    }

    template {
      metadata {
        labels = {
          app = "postgres"
        }
      }

      spec {
        container {
          name  = "postgres"
          image = "postgres:13.3-alpine"

          port {
            container_port = 5432
          }

          env {
            name = "POSTGRES_DB"
            value_from {
              secret_key_ref {
                name = "secrets"
                key  = "POSTGRES_DB"
              }
            }
          }

          env {
            name = "POSTGRES_PASSWORD"
            value_from {
              secret_key_ref {
                name = "secrets"
                key  = "POSTGRES_PASSWORD"
              }
            }
          }

          env {
            name = "POSTGRES_USER"
            value_from {
              secret_key_ref {
                name = "secrets"
                key  = "POSTGRES_USER"
              }
            }
          }

          volume_mount {
            name       = "postgres-data"
            mount_path = "/var/lib/postgresql/data"
          }

          volume_mount {
            name       = "postgres-scripts"
            mount_path = "/docker-entrypoint-initdb.d"
          }
        }
      }

      volume {
        name = "postgres-data"
        persistent_volume_claim {
          claim_name = "postgres-pvc"
        }
      }

      volume {
        name = "postgres-scripts"
        config_map {
          name = kubernetes_config_map.postgres_init_scripts.metadata[0].name
        }
      }
    }
  }
}