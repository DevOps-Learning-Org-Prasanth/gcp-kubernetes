config {
  module = true
  force = false
  disabled_by_default = false
}

plugin "google" {
    enabled = true
    version = "0.11.0"
    source  = "https://github.com/terraform-linters/tflint-ruleset-google"
}

rule "terraform_deprecated_index" {
  enabled = true
}

rule "terraform_unused_declarations" {
  enabled = true
}

rule "terraform_comment_syntax" {
  enabled = true
}

rule "terraform_documented_outputs" {
  enabled = true
}

rule "terraform_documented_variables" {
  enabled = true
}

# this is false because not all variables can be typed right now
# due to our heavy usage of maps
rule "terraform_typed_variables" {
  enabled = false
}

rule "terraform_naming_convention" {
  enabled = true
}

rule "terraform_required_version" {
  enabled = false
}

# this is false because the azurerm provider has been updated
rule "terraform_required_providers" {
  enabled = false
}

rule "terraform_unused_required_providers" {
  enabled = true
}

rule "terraform_standard_module_structure" {
  enabled = true
}