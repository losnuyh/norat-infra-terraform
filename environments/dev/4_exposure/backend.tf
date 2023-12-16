terraform {
  cloud {
    organization = "norit"

    workspaces {
      name = "exposure-dev-ap-northeast-2"
    }
  }
}