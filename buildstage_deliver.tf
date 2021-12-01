## Copyright © 2021, Oracle and/or its affiliates. 
## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl

resource "oci_devops_build_pipeline_stage" "test_deliver_artifact_stage" {

  depends_on = [oci_devops_build_pipeline_stage.test_build_pipeline_stage]

  #Required
  build_pipeline_id = oci_devops_build_pipeline.test_build_pipeline.id
  build_pipeline_stage_predecessor_collection {
    #Required
    items {
      #Required
      id = oci_devops_build_pipeline_stage.test_build_pipeline_stage.id
    }
  }

  build_pipeline_stage_type = var.build_pipeline_stage_deliver_artifact_stage_type

  deliver_artifact_collection {

    #Optional
    items {
      #Optional
      # for_each = toset(local.artifact_references)
      # artifact_id   = "oci_devops_deploy_artifact.test_deploy_artifact_${each.key}.id"
      artifact_name = var.build_pipeline_stage_deliver_artifact_collection_items_artifact_name_default
      artifact_id   = oci_devops_deploy_artifact.test_deploy_artifact_default.id
      #artifact_name = var.build_pipeline_stage_deliver_artifact_collection_items_artifact_name_default
      #artifact_id   = oci_devops_deploy_artifact.test_deploy_artifact_custom.id
      #artifact_name = var.build_pipeline_stage_deliver_artifact_collection_items_artifact_name_custom
    }
  }
  display_name = var.deliver_artifact_stage_display_name
  defined_tags = { "${oci_identity_tag_namespace.ArchitectureCenterTagNamespace.name}.${oci_identity_tag.ArchitectureCenterTag.name}" = var.release }

}

locals {
  artifact_references = ["default","custom"]
}