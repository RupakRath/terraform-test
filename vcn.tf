// Copyright (c) 2017, 2021, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Mozilla Public License v2.0

variable "tenancy_ocid" {
  default = "ocid1.tenancy.oc1..aaaaaaaaby7wxyuu3xhuzsfpcjxq3ws4n332xomd52mnw3cid5swvrm4lkga"
}

variable "user_ocid" {
  default = "ocid1.user.oc1..aaaaaaaa7awhbapnc3yuvmvyodgoa3jn5tlzd5nxaaswhwfxdnyylkydrata"
}

variable "fingerprint" {
  default = "d5:a5:d5:24:a8:05:4b:68:fb:e1:0b:d6:e7:aa:d1:ab"

}

variable "private_key_path" {
  default = "/Users/Rupak.Rath/Downloads/-04-22-14-49.pem"
}

variable "compartment_ocid" {
  default = "ocid1.compartment.oc1..aaaaaaaa33tq572mtpoejzbszybkqjwmvj22l2dlqecdge54j2d4utqdebva"
}

variable "region" {
  default = "ap-mumbai-1"
}

provider "oci" {
  tenancy_ocid     = var.tenancy_ocid
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key_path = var.private_key_path
  region           = var.region
}

resource "oci_core_vcn" "vcn-2-using-terraform" {
  cidr_blocks    = ["10.0.0.0/28","11.0.0.0/28"]
  dns_label      = "vcn"
  compartment_id = var.compartment_ocid
  display_name   = "vcn-2-using-terraform"
}

output "vcn_id" {
  value = oci_core_vcn.vcn-2-using-terraform.id
}
