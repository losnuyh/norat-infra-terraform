terraform {
  cloud {
    organization = "norit"

    workspaces {
      name = "network-prod-ap-northeast-2"
    }
  }
}
