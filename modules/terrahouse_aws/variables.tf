variable "user_uuid" {
  description = "The UUID of the user"
  type        = string
  validation {
    condition     = can(regex("^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$", var.user_uuid))
    error_message = "The user_uuid value is not a valid UUID."
  }
}
# variable "bucket_name" {
#   description = "Name of the AWS S3 bucket"
#   type        = string

#   validation {
#     condition     = can(regex("^[a-zA-Z0-9.-]{3,63}$", var.bucket_name))
#     error_message = "Invalid bucket name. It must be between 3 and 63 characters long and can only contain letters, numbers, hyphens, and periods."
#   }
# }

variable "index_html_filepath" {
  description = "Path to the index.html"
  type        = string

  validation {
    condition     = fileexists(var.index_html_filepath)
    error_message = "The specified index.html does not exist."
  }
}

variable "error_html_filepath" {
  description = "Path to the error.html"
  type        = string

  validation {
    condition     = fileexists(var.error_html_filepath)
    error_message = "The specified error.html does not exist."
  }
}

variable "content_version" {
  description = "The contenct version. Should be positive integer, starting at 1."
  type        = number

  validation {
    condition     = var.content_version > 0 && ceil(var.content_version) == var.content_version
    error_message = "Content version must be a positive integer starting at 1."
  }
}

variable "assets_path" {
  description = "Path to assets folder"
  type = string
}