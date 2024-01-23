// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

module "aks" {
  source  = "Azure/aks/azurerm"
  version = "~> 7.4"

  resource_group_name       = var.resource_group_name
  location                  = var.location
  prefix                    = var.prefix
  network_plugin            = var.network_plugin
  open_service_mesh_enabled = var.open_service_mesh_enabled
  identity_type             = var.identity_type
  identity_ids              = var.identity_ids
  kubernetes_version        = var.kubernetes_version
  cluster_name              = var.cluster_name

  # Private cluster configuration
  private_cluster_enabled             = var.private_cluster_enabled
  private_cluster_public_fqdn_enabled = var.private_cluster_public_fqdn_enabled
  private_dns_zone_id                 = var.private_dns_zone_id
  vnet_subnet_id                      = var.vnet_subnet_id
  net_profile_outbound_type           = var.net_profile_outbound_type
  net_profile_dns_service_ip          = var.net_profile_dns_service_ip
  net_profile_service_cidr            = var.net_profile_service_cidr
  net_profile_pod_cidr                = var.net_profile_pod_cidr

  agents_pool_name          = var.agents_pool_name
  agents_count              = var.agents_count
  agents_availability_zones = var.agents_availability_zones
  agents_size               = var.agents_size
  os_disk_size_gb           = var.os_disk_size_gb

  ingress_application_gateway_enabled     = var.ingress_application_gateway_enabled
  ingress_application_gateway_name        = var.ingress_application_gateway_name
  ingress_application_gateway_subnet_cidr = var.ingress_application_gateway_subnet_cidr
  ingress_application_gateway_id          = var.ingress_application_gateway_id
  ingress_application_gateway_subnet_id   = var.ingress_application_gateway_subnet_id

  web_app_routing = var.web_app_routing

  key_vault_secrets_provider_enabled = var.key_vault_secrets_provider_enabled
  secret_rotation_enabled            = var.secret_rotation_enabled
  secret_rotation_interval           = var.secret_rotation_interval

  # Azure AD integration
  role_based_access_control_enabled = var.role_based_access_control_enabled
  rbac_aad                          = var.rbac_aad
  rbac_aad_managed                  = var.rbac_aad_managed
  rbac_aad_azure_rbac_enabled       = var.rbac_aad_azure_rbac_enabled
  rbac_aad_tenant_id                = var.rbac_aad_tenant_id
  rbac_aad_admin_group_object_ids   = var.rbac_aad_admin_group_object_ids

  # Service Principal
  client_id     = var.client_id
  client_secret = var.client_secret

  tags = var.tags

}
