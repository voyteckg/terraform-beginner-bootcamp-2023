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
  description = "The content version. Should be positive integer, starting at 1."
  type        = number
}