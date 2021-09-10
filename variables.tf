# Define your variables in here.
variable "organization" {
  type        = string
  default     = "yulei"
  description = "Name of TFC/E organization"
}

variable "url" {
  type        = string
  default     = ""
  description = "The URL to notification"
}

