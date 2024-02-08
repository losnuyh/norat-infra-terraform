terraform {
  cloud {
    organization = "norit"

    workspaces {
      name = "exposure-prod-ap-northeast-2"
    }
  }
}
