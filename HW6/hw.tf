provider aws {
    region = var.region 
}


resource "aws_s3_bucket" "terraform_tfstate"  {
    bucket = "terraform.tfstate ${var.region}"
}

terraform {
  backend "s3" {
    bucket = "asels-bucket"
    key    = "statelist/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "lock-state "
  }
}
