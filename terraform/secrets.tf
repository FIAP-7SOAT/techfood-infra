resource "kubernetes_secret" "secrets" {
  metadata {
    name = "secrets"
  }

  data = {
    POSTGRES_DB             = "dGVjaGZvb2Q="  # base64 encoded
    POSTGRES_USER           = "cG9zdGdyZXM="
    POSTGRES_PASSWORD       = "cG9zdGdyZXM="
    SPRING_DATASOURCE_URL   = "amRiYzpwb3N0Z3Jlc3FsOi8vcG9zdGdyZXM6NTQzMi90ZWNoZm9vZA=="
    SPRING_DATASOURCE_USERNAME = "cG9zdGdyZXM="
    SPRING_DATASOURCE_PASSWORD = "cG9zdGdyZXM="
  }
}