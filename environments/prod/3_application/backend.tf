terraform {
  cloud {
    organization = "norit"

    workspaces {
      name = "application-prod-ap-northeast-2"
    }
  }
}
