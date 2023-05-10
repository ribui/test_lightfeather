# variable "aws_access_key" {
#   description = "AWS access key"
# }

# variable "aws_secret_key" {
#   description = "AWS secret key"
# }

variable "aws_region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "backend_image" {
   description = "The URI for the Backend Image in the ECR"
   #default     = ""
 }
variable "frontend_image" {
   description = "The URI for the Backend Image in the ECR"
   #default     = ""
 }


