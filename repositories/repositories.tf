resource "ibm_cd_toolchain_tool_hostedgit" "deployment_repo" {
  toolchain_id = var.toolchain_id
  name         = "deployment-repo"
  initialization {
    type            = "clone_if_not_exists"
    source_repo_url = var.deployment_repo
    private_repo    = true
    repo_name       = join("-", [ var.deployment_repo, "repo" ])
  }
  parameters {
    toolchain_issues_enabled = false
    enable_traceability      = false
  }
}

resource "ibm_cd_toolchain_tool_hostedgit" "change_management_repo" {
  toolchain_id = var.toolchain_id
  name         = "change-management-repo"
  initialization {
    type = "clone_if_not_exists"
    source_repo_url = var.change_management_repo
    private_repo = true
    repo_name    = join("-", [ var.change_management_repo, "repo" ])
  }  
  parameters {
    toolchain_issues_enabled          = true
    enable_traceability = false
  }
}

resource "ibm_cd_toolchain_tool_hostedgit" "pipeline_repo" {
  toolchain_id = var.toolchain_id
  name         = "pipeline-repo"  
  initialization {
    type         = "link"
    repo_url     = var.pipeline_repo
    private_repo = true
  }
  parameters {
    toolchain_issues_enabled = false
    enable_traceability      = false
  }
}

resource "ibm_cd_toolchain_tool_hostedgit" "inventory_repo" {
  toolchain_id = var.toolchain_id
  name         = "inventory-repo"
  initialization {
    type         = "link"
    repo_url     = var.inventory_repo
    private_repo = true
  }
  parameters {
    toolchain_issues_enabled = false
    enable_traceability      = false
  }
}

resource "ibm_cd_toolchain_tool_hostedgit" "evidence_repo" {
  toolchain_id = var.toolchain_id
  name         = "evidence-repo"
  initialization {
    type         = "link"
    repo_url     = var.evidence_repo
    private_repo = true
  }
  parameters {
    toolchain_issues_enabled = false
    enable_traceability      = false
  }
}

resource "ibm_cd_toolchain_tool_hostedgit" "issues_repo" {
  toolchain_id = var.toolchain_id
  name         = "issues-repo"
  initialization {
    type         = "link"
    repo_url     = var.issues_repo
    private_repo = true
  }
  parameters {
    toolchain_issues_enabled = true
    enable_traceability      = false
  }
}

output "deployment_repo_url" {
  value = ibm_cd_toolchain_tool_hostedgit.deployment_repo.parameters[0].repo_url
}

output "change_management_repo_url" {
  value = ibm_cd_toolchain_tool_hostedgit.change_management_repo.parameters[0].repo_url
}

output "pipeline_repo_url" {
  value = ibm_cd_toolchain_tool_hostedgit.pipeline_repo.parameters[0].repo_url
}

output "inventory_repo_url" {
  value = ibm_cd_toolchain_tool_hostedgit.inventory_repo.parameters[0].repo_url
}

output "evidence_repo_url" {
  value = ibm_cd_toolchain_tool_hostedgit.evidence_repo.parameters[0].repo_url
}

output "issues_repo_url" {
  value = ibm_cd_toolchain_tool_hostedgit.issues_repo.parameters[0].repo_url
}