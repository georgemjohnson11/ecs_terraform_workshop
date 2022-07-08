variable "key_name" {
  type        = string
  default     = "constellationjs"
  description = "The name for ssh key, used for aws_launch_configuration"
}

variable "cluster_name" {
  type        = string
  default     = "nona-research-foundation"
  description = "The name of AWS ECS cluster"
}

variable "mongo_version" {
  type        = string
  default     = "4.0.0"
  description = "The version of Mongo to run as a container"
}

variable "region" {
  type        = string
  default     = "us-east-1"
  description = "The default tags for clusters"
}

variable "tags" {
  type        = string
  default     = "{ env       = production\ncreatedBy = gjohnson}"
  
  description = "The default tags for clusters"

}
