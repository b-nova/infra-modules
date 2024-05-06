resource "aws_iam_policy" "iam_policy" {
  name   = "policy-${var.name}"
  path   = "/"
  policy = var.policy
}

resource "aws_iam_user" "iam_user" {
  name = var.name
  path = "/"
  tags = {
    team : var.team
  }
}

resource "aws_iam_user_policy_attachment" "iam_user_policy_attachment" {
  policy_arn = aws_iam_policy.iam_policy.arn
  user       = aws_iam_user.iam_user.name
}

resource "aws_iam_access_key" "iam_user_key" {
  count = var.create_access_key ? 1 : 0
  user  = aws_iam_user.iam_user.name
}
