## Copyright © 2021, Oracle and/or its affiliates. 
## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl

# - Add a Build pipeline for the project 

resource "oci_devops_deploy_pipeline" "test_deploy_pipeline" {
  project_id   = oci_devops_project.test_project.id
  description  = "${var.app_name}_${random_string.deploy_id.result}_build_pipeline"
  display_name = "${var.app_name}_${random_string.deploy_id.result}_build_pipeline"

#   build_pipeline_parameters {
#     items {
#       name          = var.deploy_pipeline_deploy_pipeline_parameters_items_name
#       default_value = var.deploy_pipeline_deploy_pipeline_parameters_items_default_value
#       description   = var.deploy_pipeline_deploy_pipeline_parameters_items_description
#     }
#   }
#   defined_tags = { "${oci_identity_tag_namespace.ArchitectureCenterTagNamespace.name}.${oci_identity_tag.ArchitectureCenterTag.name}" = var.release }
}