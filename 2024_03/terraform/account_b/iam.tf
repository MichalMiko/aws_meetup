# Create an IAM policy V1
# resource "aws_iam_policy" "demo_iam_policy" {
#   name = var.iam_policy_name

#   policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [
#       {
#         Effect = "Allow"
#         Action = "*"
#         Resource = "*"
#       }
#     ]
#   })
# }

# Create an IAM policy V2
# resource "aws_iam_policy" "demo_iam_policy" {
#   name = var.iam_policy_name

#   policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [
#       {
#         Effect = "Allow"
#         Action = [
#           "secretsmanager:GetSecretValue",
#           "ssm:GetParameter",
#           "ssm:GetParameters",
#           "ssm:GetParametersByPath"
#         ]
#         Resource = "*"
#       }
#     ]
#   })
# }

# Create an IAM policy V3
resource "aws_iam_policy" "demo_iam_policy" {
  name = var.iam_policy_name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "iam:*",
          "secretsmanager:GetSecretValue",
          "ssm:GetParameter",
          "ssm:GetParameters",
          "ssm:GetParametersByPath",
          "sts:AssumeRole"
        ]
        Resource = "*"
      }
    ]
  })
}

# Create an IAM role
resource "aws_iam_role" "demo_role" {
  name = var.role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          AWS = "arn:aws:iam::<ACCOUNT_NUMBER>:root"
        }
        Action = "sts:AssumeRole"
      },
      {
        Effect = "Allow"
        Principal = {
          AWS = data.terraform_remote_state.account_a.outputs.demo_role_arn
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

# Attach the IAM policy to the IAM role
resource "aws_iam_policy_attachment" "demo_role_policy_attachment" {
  name       = "Policy Attachement"
  policy_arn = aws_iam_policy.demo_iam_policy.arn
  roles      = [aws_iam_role.demo_role.name]
}


#Forgotten PoC Role
resource "aws_iam_policy" "poc_iam_policy" {
  name = var.poc_iam_policy_name
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "iam:*"
        ]
        Resource = "*"
      }
    ]
  })
}

# Create an IAM role
resource "aws_iam_role" "poc_role" {
  name = var.poc_role_name
  tags = {
    owner = "email@example.com"
  }
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          AWS = "arn:aws:iam::<ACCOUNT_NUMBER>:root"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}


# Attach the IAM policy to the IAM role
resource "aws_iam_policy_attachment" "poc_role_policy_attachment" {
  name       = "Policy Attachement"
  policy_arn = aws_iam_policy.poc_iam_policy.arn
  roles      = [aws_iam_role.poc_role.name]
}