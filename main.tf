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
  version = "~> 9.1"

  resource_group_name             = var.resource_group_name
  location                        = var.location
  prefix                          = var.prefix
  network_plugin                  = var.network_plugin
  network_plugin_mode             = var.network_plugin_mode
  network_policy                  = var.network_policy
  open_service_mesh_enabled       = var.open_service_mesh_enabled
  identity_type                   = var.identity_type
  identity_ids                    = var.identity_ids
  kubernetes_version              = var.kubernetes_version
  cluster_name                    = var.cluster_name
  api_server_subnet_id            = var.api_server_subnet_id
  api_server_authorized_ip_ranges = var.api_server_authorized_ip_ranges

  # Auto scaling
  enable_auto_scaling                                  = var.enable_auto_scaling
  auto_scaler_profile_enabled                          = var.auto_scaler_profile_enabled
  auto_scaler_profile_balance_similar_node_groups      = var.auto_scaler_profile_balance_similar_node_groups
  auto_scaler_profile_empty_bulk_delete_max            = var.auto_scaler_profile_empty_bulk_delete_max
  auto_scaler_profile_expander                         = var.auto_scaler_profile_expander
  auto_scaler_profile_max_graceful_termination_sec     = var.auto_scaler_profile_max_graceful_termination_sec
  auto_scaler_profile_max_node_provisioning_time       = var.auto_scaler_profile_max_node_provisioning_time
  auto_scaler_profile_max_unready_nodes                = var.auto_scaler_profile_max_unready_nodes
  auto_scaler_profile_max_unready_percentage           = var.auto_scaler_profile_max_unready_percentage
  auto_scaler_profile_new_pod_scale_up_delay           = var.auto_scaler_profile_new_pod_scale_up_delay
  auto_scaler_profile_scale_down_delay_after_add       = var.auto_scaler_profile_scale_down_delay_after_add
  auto_scaler_profile_scale_down_delay_after_delete    = var.auto_scaler_profile_scale_down_delay_after_delete
  auto_scaler_profile_scale_down_delay_after_failure   = var.auto_scaler_profile_scale_down_delay_after_failure
  auto_scaler_profile_scale_down_unneeded              = var.auto_scaler_profile_scale_down_unneeded
  auto_scaler_profile_scale_down_unready               = var.auto_scaler_profile_scale_down_unready
  auto_scaler_profile_scale_down_utilization_threshold = var.auto_scaler_profile_scale_down_utilization_threshold
  auto_scaler_profile_scan_interval                    = var.auto_scaler_profile_scan_interval
  auto_scaler_profile_skip_nodes_with_local_storage    = var.auto_scaler_profile_skip_nodes_with_local_storage
  auto_scaler_profile_skip_nodes_with_system_pods      = var.auto_scaler_profile_skip_nodes_with_system_pods

  # Private cluster configuration
  private_cluster_enabled             = var.private_cluster_enabled
  private_cluster_public_fqdn_enabled = var.private_cluster_public_fqdn_enabled
  private_dns_zone_id                 = var.private_dns_zone_id
  vnet_subnet_id                      = var.vnet_subnet_id
  pod_subnet_id                       = var.pod_subnet_id
  net_profile_outbound_type           = var.net_profile_outbound_type
  net_profile_dns_service_ip          = var.net_profile_dns_service_ip
  net_profile_service_cidr            = var.net_profile_service_cidr
  net_profile_pod_cidr                = var.net_profile_pod_cidr

  agents_pool_name             = var.agents_pool_name
  agents_count                 = var.agents_count
  agents_availability_zones    = var.agents_availability_zones
  agents_size                  = var.agents_size
  agents_labels                = var.agents_labels
  agents_tags                  = var.agents_tags
  agents_type                  = var.agents_type
  agents_taints                = var.agents_taints
  agents_pool_max_surge        = var.agents_pool_max_surge
  agents_max_count             = var.agents_max_count
  agents_min_count             = var.agents_min_count
  agents_max_pods              = var.agents_max_pods
  agents_pool_linux_os_configs = var.agents_pool_linux_os_configs

  os_disk_size_gb = var.os_disk_size_gb
  os_disk_type    = var.os_disk_type
  os_sku          = var.os_sku
  sku_tier        = var.sku_tier

  node_pools          = var.node_pools
  node_resource_group = var.node_resource_group

  create_role_assignments_for_application_gateway = var.create_role_assignments_for_application_gateway
  green_field_application_gateway_for_ingress     = var.green_field_application_gateway_for_ingress
  brown_field_application_gateway_for_ingress     = var.brown_field_application_gateway_for_ingress

  web_app_routing     = var.web_app_routing
  attached_acr_id_map = var.attached_acr_id_map

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
  local_account_disabled            = var.local_account_disabled

  # Service Principal
  client_id     = var.client_id
  client_secret = var.client_secret

  oidc_issuer_enabled       = var.oidc_issuer_enabled
  workload_identity_enabled = var.workload_identity_enabled

  aci_connector_linux_enabled                                     = var.aci_connector_linux_enabled
  aci_connector_linux_subnet_name                                 = var.aci_connector_linux_subnet_name
  admin_username                                                  = var.admin_username
  agents_pool_kubelet_configs                                     = var.agents_pool_kubelet_configs
  agents_proximity_placement_group_id                             = var.agents_proximity_placement_group_id
  azure_policy_enabled                                            = var.azure_policy_enabled
  cluster_log_analytics_workspace_name                            = var.cluster_log_analytics_workspace_name
  confidential_computing                                          = var.confidential_computing
  create_role_assignment_network_contributor                      = var.create_role_assignment_network_contributor
  disk_encryption_set_id                                          = var.disk_encryption_set_id
  ebpf_data_plane                                                 = var.ebpf_data_plane
  enable_host_encryption                                          = var.enable_host_encryption
  enable_node_public_ip                                           = var.enable_node_public_ip
  kms_enabled                                                     = var.kms_enabled
  kms_key_vault_key_id                                            = var.kms_key_vault_key_id
  load_balancer_profile_enabled                                   = var.load_balancer_profile_enabled
  load_balancer_profile_idle_timeout_in_minutes                   = var.load_balancer_profile_idle_timeout_in_minutes
  load_balancer_profile_managed_outbound_ip_count                 = var.load_balancer_profile_managed_outbound_ip_count
  load_balancer_profile_managed_outbound_ipv6_count               = var.load_balancer_profile_managed_outbound_ipv6_count
  load_balancer_profile_outbound_ip_address_ids                   = var.load_balancer_profile_outbound_ip_address_ids
  load_balancer_profile_outbound_ip_prefix_ids                    = var.load_balancer_profile_outbound_ip_prefix_ids
  load_balancer_profile_outbound_ports_allocated                  = var.load_balancer_profile_outbound_ports_allocated
  log_analytics_workspace                                         = var.log_analytics_workspace
  log_analytics_workspace_allow_resource_only_permissions         = var.log_analytics_workspace_allow_resource_only_permissions
  log_analytics_workspace_cmk_for_query_forced                    = var.log_analytics_workspace_cmk_for_query_forced
  log_analytics_workspace_daily_quota_gb                          = var.log_analytics_workspace_daily_quota_gb
  log_analytics_workspace_data_collection_rule_id                 = var.log_analytics_workspace_data_collection_rule_id
  log_analytics_workspace_enabled                                 = var.log_analytics_workspace_enabled
  log_analytics_workspace_resource_group_name                     = var.log_analytics_workspace_resource_group_name
  log_analytics_workspace_sku                                     = var.log_analytics_workspace_sku
  log_analytics_workspace_identity                                = var.log_analytics_workspace_identity
  log_analytics_workspace_immediate_data_purge_on_30_days_enabled = var.log_analytics_workspace_immediate_data_purge_on_30_days_enabled
  log_analytics_workspace_internet_ingestion_enabled              = var.log_analytics_workspace_internet_ingestion_enabled
  log_analytics_workspace_internet_query_enabled                  = var.log_analytics_workspace_internet_query_enabled
  log_analytics_workspace_local_authentication_disabled           = var.log_analytics_workspace_local_authentication_disabled
  log_analytics_workspace_reservation_capacity_in_gb_per_day      = var.log_analytics_workspace_reservation_capacity_in_gb_per_day
  log_retention_in_days                                           = var.log_retention_in_days
  maintenance_window                                              = var.maintenance_window
  maintenance_window_node_os                                      = var.maintenance_window_node_os
  microsoft_defender_enabled                                      = var.microsoft_defender_enabled
  monitor_metrics                                                 = var.monitor_metrics
  network_contributor_role_assigned_subnet_ids                    = var.network_contributor_role_assigned_subnet_ids
  only_critical_addons_enabled                                    = var.only_critical_addons_enabled
  orchestrator_version                                            = var.orchestrator_version
  public_ssh_key                                                  = var.public_ssh_key
  rbac_aad_client_app_id                                          = var.rbac_aad_client_app_id
  rbac_aad_server_app_id                                          = var.rbac_aad_server_app_id
  rbac_aad_server_app_secret                                      = var.rbac_aad_server_app_secret
  scale_down_mode                                                 = var.scale_down_mode
  snapshot_id                                                     = var.snapshot_id
  storage_profile_blob_driver_enabled                             = var.storage_profile_blob_driver_enabled
  storage_profile_disk_driver_enabled                             = var.storage_profile_disk_driver_enabled
  storage_profile_disk_driver_version                             = var.storage_profile_disk_driver_version
  storage_profile_enabled                                         = var.storage_profile_enabled
  storage_profile_file_driver_enabled                             = var.storage_profile_file_driver_enabled
  storage_profile_snapshot_controller_enabled                     = var.storage_profile_snapshot_controller_enabled
  temporary_name_for_rotation                                     = var.temporary_name_for_rotation
  ultra_ssd_enabled                                               = var.ultra_ssd_enabled

  tags = var.tags

}
