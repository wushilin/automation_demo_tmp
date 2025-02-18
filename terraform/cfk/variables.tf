# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

variable "aws_region" {
  type        = string
}

variable "owner_name" {
  type = string
}

variable "owner_email" {
  type = string
}

variable "aws_instance_type" {
  type = string
}

variable "k8s_version" {
  type = string
}

variable "lab_name" {
  type = string
}
