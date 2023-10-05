variable "user_uuid" {
 type = string
 }

 variable "bucket_name" {
 type = string
 }

 variable "index_html_filepath" {
  description = "Path to the index.html"
  type        = string
}

 variable "error_html_filepath" {
  description = "Path to the error.html"
  type        = string
}

variable "content_version" {
  type        = number
}

variable "assets_path" {
  description = "Path to assets folder"
  type = string
}