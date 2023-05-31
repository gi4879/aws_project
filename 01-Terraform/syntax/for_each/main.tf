provider "aws" {
	region = "ap-northeast-2"
}

resource "aws_iam_user" "example" {
	for_each = toset(var.user_names)
	name		 = each.value
}

variable "user_names" {
	description = "Creat IAM with these names"
	type				= list(string)
	default			= ["aws06-neo", "aws-06-trinity", "aws06-morpheus"]
}

output "all_user" {
	value			  = values(aws_iam_user.example)[*].arn
	description = "The Name for user neo" 
}








