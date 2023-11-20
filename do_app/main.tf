resource "digitalocean_app" "digitalocean_app" {
  spec {
    name   = var.name
    region = var.region

    service {
      name               = var.name
      environment_slug   = var.environment_slug
      instance_count     = var.instance_count
      instance_size_slug = var.instance_size_slug

      github {
        repo           = var.repo
        branch         = "main"
        deploy_on_push = var.deploy_on_push
      }

      dynamic "env" {
        for_each = var.env
        content {
          key   = env.value.key
          value = env.value.value
          scope = env.value.scope
          type  = env.value.type
        }
      }
    }
  }
}