variable "bucket" {
  description = "The name of the bucket. If omitted, Terraform will assign a random, unique name." # IE: terraform-2020052606510241590000000
  type        = string
  default     = null
}

variable "tags" {
  description = "(Optional) A mapping of tags to assign to the bucket."
  type        = map(string)
  default     = {}
}
