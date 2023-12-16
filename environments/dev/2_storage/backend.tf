terraform {
  cloud {
    organization = "norit"

    workspaces {
      name = "storage-dev-ap-northeast-2"
    }
  }
}