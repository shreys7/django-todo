variable "shared_config_files" {
  type = list(string)
  default = ["C:/Users/yash/.aws/config"]
}


variable "shared_credentials_files"{
  type = list(string)
  default = ["C:/Users/yash/.aws/credentials"]
}

variable "db-username" {
  type = string
  default = "postgres"
}
variable "db-pass" {
  type = string
  default = "postgres"
}
