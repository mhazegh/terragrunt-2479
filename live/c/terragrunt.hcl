include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "../..//modules/c/"
}

locals {
  common_vars = read_terragrunt_config(find_in_parent_folders("common.hcl"))
}

dependency "a" {
  config_path = "../a"
}

dependency "b" {
  config_path = "../b"
}

inputs = merge(
  local.common_vars.inputs,
  {
    test_a_arn = dependency.a.outputs.bucket_arn
    test_b_arn = dependency.b.outputs.bucket_arn
  }
)
