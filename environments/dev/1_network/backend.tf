terraform {
  cloud {
    organization = "norit"

    workspaces {
      name = "network-dev-ap-northeast-2"
    }
  }
}