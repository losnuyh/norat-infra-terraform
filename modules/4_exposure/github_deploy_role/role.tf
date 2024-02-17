resource "aws_iam_role" "github_role" {
  name = "${var.project}_${var.env}_github_role"
  assume_role_policy = jsonencode({
    Version: "2012-10-17",
    Statement = [{
      Effect: "Allow",
      Action = ["sts:AssumeRoleWithWebIdentity"],
      Principal: {
        Federated: "arn:aws:iam::${var.account_id}:oidc-provider/token.actions.githubusercontent.com",
      },
      Condition: {
        StringEquals: {
          "token.actions.githubusercontent.com:aud": "sts.amazonaws.com",
        },
        "StringLike": {
          "token.actions.githubusercontent.com:sub": "repo:norit-team/norat-api-server:*",
        }
      }
    }],
  })
}

resource "aws_iam_policy" "lambda_deploy_policy" {
  name = "${var.project}_${var.env}_lambda_deploy_policy"
  policy = jsonencode({
    Version: "2012-10-17",
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "lambda:UpdateFunctionCode",
        ],
        Resource = [
          var.api_lambda_function_arn,
        ]
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "lambda_deploy_policy_attach_to_github_role" {
  policy_arn = aws_iam_policy.lambda_deploy_policy.arn
  role       = aws_iam_role.github_role.name
}

resource "aws_iam_policy" "app_env_var_parameter_store_policy" {
  name = "${var.project}_${var.env}_app_env_var_parameter_store_policy"
  policy = jsonencode({
    Version: "2012-10-17",
    Statement = [
      {
        Action = [
          "ssm:GetParameter",
          "ssm:GetParameters",
        ],
        Effect = "Allow",
        Resource = [
          "arn:aws:ssm:${var.region}:${var.account_id}:parameter/${var.project}/MAIN/${var.env}/*",
          "arn:aws:ssm:${var.region}:${var.account_id}:parameter/${var.project}/COMMON/${var.env}/*",
          "arn:aws:ssm:${var.region}:${var.account_id}:parameter/${var.project}/ADMIN/${var.env}/*",
        ]
      },
    ]
  })
}

resource "aws_iam_role_policy_attachment" "app_env_var_parameter_store_policy_attach_to_github_role" {
  policy_arn = aws_iam_policy.app_env_var_parameter_store_policy.arn
  role       = aws_iam_role.github_role.name
}