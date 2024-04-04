resource "aws_iam_user" "user_lb" {
  name = "Jenny"
}

resource "aws_iam_user" "user_lb1" {
  name = "rose"
}

resource "aws_iam_user" "user_lb2" {
  name = "lisa"
}

resource "aws_iam_user" "user_lb3" {
  name = "jisoo"
}

resource "aws_iam_user" "user_lb4" {
  name = "jihyo"
}

resource "aws_iam_user" "user_lb5" {
  name = "sana"
}

resource "aws_iam_user" "user_lb6" {
  name = "momo"
}

resource "aws_iam_user" "user_lb7" {
  name = "dahyun"
}



resource "aws_iam_group" "hey" {
  name = "blackpink"
}

resource "aws_iam_group" "hey1" {
  name = "twice"
}

resource "aws_iam_group_membership" "hey" {
  name = "blackpink"

  users = [
    aws_iam_user.user_lb.name,
    aws_iam_user.user_lb1.name,
    aws_iam_user.user_lb2.name,
    aws_iam_user.user_lb3.name,
    aws_iam_user.user_lb8.name,
  ]

  group = aws_iam_group.hey.name
}

resource "aws_iam_group_membership" "hey1" {
  name = "twice"

  users = [
    aws_iam_user.user_lb4.name,
    aws_iam_user.user_lb5.name,
    aws_iam_user.user_lb6.name,
    aws_iam_user.user_lb7.name,
    aws_iam_user.user_lb9.name,
  ]

  group = aws_iam_group.hey1.name
}

resource "aws_iam_user" "user_lb8" {
  name = "miyeon"
}

resource "aws_iam_user" "user_lb9" {
  name = "mina"
}



