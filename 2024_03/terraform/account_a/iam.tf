# Assume Role
resource "aws_iam_policy" "demo_iam_policy" {
  name = var.iam_policy_name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = "sts:AssumeRole"
        Resource = "arn:aws:iam::<ACCOUNT_NUMBER>:role/demo-role"
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
          AWS = "arn:aws:iam::468141809114:root"
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




# Unique Identifiers
resource "aws_iam_policy" "unique_iam_policy" {
  name = var.unique_iam_policy_name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = "sts:AssumeRole"
        Resource = "arn:aws:iam::<ACCOUNT_NUMBER>:role/demo-role"
      }
    ]
  })
}


# Create an IAM role
resource "aws_iam_role" "unique_demo_role" {
  name = var.unique_role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          AWS = "arn:aws:iam::468141809114:root"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

# Attach the IAM policy to the IAM role
resource "aws_iam_policy_attachment" "unique_demo_role_policy_attachment" {
  name       = "Policy Attachement"
  policy_arn = aws_iam_policy.unique_iam_policy.arn
  roles      = [aws_iam_role.unique_demo_role.name]
}