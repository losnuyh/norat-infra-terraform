terraform {
  cloud {
    organization = "norit"

    workspaces {
      name = "storage-prod-ap-northeast-2"
    }
  }
}