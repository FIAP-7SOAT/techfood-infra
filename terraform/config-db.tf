resource "kubernetes_config_map" "postgres_init_scripts" {
  metadata {
    name = "postgres-init-scripts"
  }

  data = {
    "1_schema.sql" = <<-EOT
      -- Table: tb_products
      CREATE TABLE IF NOT EXISTS tb_products (
          id UUID NOT NULL,
          ...
      );
    EOT

    "2_data.sql" = <<-EOT
      INSERT INTO tb_products (id, category, price, description, imageurl, name) VALUES
      ('f47ac10b-58cc-4372-a567-0e02b2c3d479', 1, 10.50, 'X-burguer com queijo e alface', 'http://example.com/images/xburguer.jpg', 'X-Burguer'),
      ...
    EOT
  }
}