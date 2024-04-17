terraform {
  backend "s3" {
    bucket = "asels-bucket"
    key    = "statelist/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "lock-state"
  }
}

