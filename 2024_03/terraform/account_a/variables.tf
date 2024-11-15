variable "iam_policy_name" {
  type    = string
  default = "assume-policy"
}

variable "role_name" {
  type    = string
  default = "assumer"
}

variable "unique_iam_policy_name" {
  type    = string
  default = "unique-demo-policy"
}

variable "unique_role_name" {
  type    = string
  default = "unique"
}