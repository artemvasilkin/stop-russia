resource "random_shuffle" "az" {
  input = [
    "eastasia", # East Asia
    "japaneast", # JA West
    "japanwest", # JA West
    "koreacentral", # KR Central
    "koreasouth", # KR South
    "southeastasia", # Southeast Asia
    "southindia", # IN South
    "westindia", # IN West
    "centralindia" # (Asia Pacific) Central India
  ]
  result_count = 1
}

resource "azurerm_resource_group" "learn_docker_sr" {
  name     = var.resource_group_name
  # location = var.region # region from vars
  location = random_shuffle.az.result[0] # random asian region
}

resource "azurerm_container_group" "learn_docker_sr" {
  name                = sha1("learn_docker_sr-${data.azurerm_client_config.current.tenant_id}") # sha1 for unique name that is automagic
  location            = azurerm_resource_group.learn_docker_sr.location
  resource_group_name = azurerm_resource_group.learn_docker_sr.name

  ip_address_type     = "None"
  os_type             = "Linux"
  restart_policy      = "Always"

  container {
    name   = "learn-docker-sr-0"
    image  = "abagayev/stop-russia:latest"
    cpu    = var.cpu_spec
    memory = var.mem_spec
  }

  # replicate/uncomment additional `container` blocks here

  # container {
  #   name   = "learn-docker-sr-1"
  #   image  = "abagayev/stop-russia:latest"
  #   cpu    = var.cpu_spec
  #   memory = var.mem_spec
  # }

  # container {
  #   name   = "learn-docker-sr-2"
  #   image  = "abagayev/stop-russia:latest"
  #   cpu    = var.cpu_spec
  #   memory = var.mem_spec
  # }
  # container {
  #   name   = "learn-docker-sr-3"
  #   image  = "abagayev/stop-russia:latest"
  #   cpu    = var.cpu_spec
  #   memory = var.mem_spec
  # }
  # container {
  #   name   = "learn-docker-sr-4"
  #   image  = "abagayev/stop-russia:latest"
  #   cpu    = var.cpu_spec
  #   memory = var.mem_spec
  # }
  # container {
  #   name   = "learn-docker-sr-5"
  #   image  = "abagayev/stop-russia:latest"
  #   cpu    = var.cpu_spec
  #   memory = var.mem_spec
  # }
  # container {
  #   name   = "learn-docker-sr-6"
  #   image  = "abagayev/stop-russia:latest"
  #   cpu    = var.cpu_spec
  #   memory = var.mem_spec
  # }

  # container {
  #   name   = "learn-docker-sr-7"
  #   image  = "abagayev/stop-russia:latest"
  #   cpu    = var.cpu_spec
  #   memory = var.mem_spec
  # }
}
