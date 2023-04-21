return {
  settings = {
    yaml = {
      trace = {
        server = "verbose"
      },
      schemaDownload = {  enable = true },
      validate = true,
      schemaStore = {
        url = "https://www.schemastore.org/api/json/catalog.json",
        enable = true,
      },
      schemas = {
        ["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.22.0/all.json"] = "k8s/**",
        ["https://gitlab.com/gitlab-org/gitlab/-/raw/master/app/assets/javascripts/editor/schema/ci.json"] = {"ci/*.yml", ".gitlab-ci.yml"},
        ["https://parkerm.gitlab.io/cf-manifest-schema/json/manifest.schema.json"] = "cloudfoundry/*.yml",
      },
      customTags = {
        "!reference sequence",
      }
    }
  }
}
