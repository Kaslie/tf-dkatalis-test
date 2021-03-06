variable "profile" {
  type      = string
  default   = "dkatalis-test"
}

variable "db_name" {
  type      = string
  default   = "dkatalis"
}

variable "db_user" {
  type = string
}

variable "db_password" {
  type = string
}

variable "instance_type" {
  type = map(string)
  default = {
    "cpu-2-4" = "ecs.t5-c1m2.large"
  }
}