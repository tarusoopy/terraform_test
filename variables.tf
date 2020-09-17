# リージョン
variable "region" {
  default = "asia-northeast1"
}
# プロジェクト名
variable "project" {
  default = "sdns-prd-273508"
}
variable "credentials_file_path" {}

# VPC内部CIDR
variable "vpc_internal_ranges" {
  default = [
    "192.168.20.0/24",
    #    "10.192.0.0/21",
    #    "10.192.8.0/21",
  ]
}
# 神田オフィスGWアドレス
variable "kanda_gw_address" {
  default = "39.110.205.104"
}
# Vario オンプレIPアドレス群
variable "vario_onpremises_address" {
  default = [
    "39.110.205.104/32",
    "219.127.220.128/26",
    "210.175.226.112/28",
    "61.215.192.128/26",
    "210.250.61.0/24",
  ]
}

#
# GCE 関連
#
variable "gce_default_scopes" {
  default = [
    "https://www.googleapis.com/auth/compute",
    "https://www.googleapis.com/auth/logging.write",
    "https://www.googleapis.com/auth/monitoring",
    "https://www.googleapis.com/auth/devstorage.read_write",
    "https://www.googleapis.com/auth/userinfo.email",
    "https://www.googleapis.com/auth/servicecontrol",
    "https://www.googleapis.com/auth/service.management",
  ]
}
