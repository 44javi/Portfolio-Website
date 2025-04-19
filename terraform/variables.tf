# root variables.tf

variable "client" {
  description = "Client name for resource naming."
  type        = string
}

variable "environment" {
  description = "Environment for the resources (e.g., dev, prod)."
  type        = string
}

variable "region" {
  description = "Region where resources will be created"
  type        = string
}

variable "secondary_region" {
  description = "2nd region for resource creation"
  type        = string

}

variable "trusted_ip_ranges" {
  description = "List of trusted IP ranges for access to public VMs"
  type        = list(string)
}

variable "alert_email" {
  description = "Email used for monitoring alerts"
  type        = string
}

variable "suffix" {
  description = "Numerical identifier for resources"
  type        = string
}

variable "owner" {
  description = "Person responsible for the resource"
  type        = string
}

variable "project" {
  description = "Main project associated with this deployment"
  type        = string
}

variable "created_by" {
  description = "Tag showing Terraform created this resource"
  type        = string
}

variable "subscription_id" {
  description = "Subscription_ID to deploy resources to"
  type        = string
}

variable "docker_usr" {
  description = "Dockerhub username for container images"
  type        = string
}

variable "custom_domain" {
  description = "Domain name of the application"
  type = string
}