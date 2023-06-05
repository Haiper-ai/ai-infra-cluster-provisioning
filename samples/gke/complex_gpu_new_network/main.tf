variable "project_id" {}
variable "resource_prefix" {}
variable "region" {}
variable "network_config" {}
variable "gke_version" {}
variable "disk_type" {}
variable "disk_size_gb" {}
variable "node_pools" {}
variable "kubernetes_setup_config" {}
module "complex-gke2" {
  source                  = "github.com/GoogleCloudPlatform/ai-infra-cluster-provisioning//terraform/modules/cluster/gke"
  project_id              = var.project_id
  resource_prefix         = var.resource_prefix
  region                  = var.region
  network_config          = var.network_config
  gke_version             = var.gke_version
  disk_type               = var.disk_type
  disk_size_gb            = var.disk_size_gb
  node_pools              = var.node_pools
  kubernetes_setup_config = var.kubernetes_setup_config
}