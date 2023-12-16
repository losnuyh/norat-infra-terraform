terraform {
  cloud {
    organization = "norit"

    workspaces {
      name = "application-dev-ap-northeast-2"
    }
  }
}