

# resource "aws_key_pair" "bastion" {
#   key_name   = "bastion-key"
#   public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQD3F6tyPEFEzV0LX3X8BsXdMsQz1x2cEikKDEY0aIj41qgxMCP/iteneqXSIFZBp5vizPvaoIR3Um9xK7PGoW8giupGn+EPuxIA4cDM4vzOqOkiMPhz5XK0whEjkVzTo4+S0puvDZuwIsdiW9mxhJc7tgBNL0cYlWSYVkz4G/fslNfRPW5mYAM49f4fhtxPb5ok4Q2Lg9dPKVHO/Bgeu5woMc7RY0p1ej6D4CKFE6lymSDJpW0YHX/wqE9+cfEauh7xZcG0q9t2ta6F6fmX0agvpFyZo8aFbXeUBr7osSCJNgvavWbM/06niWrOvYX2xwWdhXmXSrbX8ZbabVohBK41 email@example.com"
# }

# resource "aws_s3_bucket" "test" {
#   bucket = "kaizen-asel"

# }

# resource "aws_s3_bucket" "test1" {
#   bucket_prefix = "kaizen-"
# }

# resource "aws_s3_bucket" "man1" {
#   bucket = "sum-08"
# }

# resource "aws_s3_bucket" "man2" {
#   bucket = "win-08"
# }




resource "aws_iam_user" "lb" {
  for_each = toset (["jenny", "rose", "lisa", "jisoo"]) 
  name = each.key 
}

resource "aws_iam_group" "hey" {
  name = "blackpink"
}

resource "aws_iam_group_membership" "hey" {
  name = "blackpink"

  users = [
 for i in aws_iam_user.lb : i.name
  ]
  group = aws_iam_group.hey.name
}
