resource "kubernetes_persistent_volume" "postgres_pv" {
  metadata {
    name = "postgres-pv"
  }

  spec {
    capacity = {
      storage = "1Gi"
    }

    access_modes = ["ReadWriteOnce"]

    storage_class_name = "standard"

    host_path {
      path = "/mnt/data/postgres"
    }
  }
}