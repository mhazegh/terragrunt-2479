data "aws_iam_policy_document" "s3_test_a_access_policy" {
  statement {
    sid    = ""
    effect = "Allow"
    resources = [
      var.test_a_arn,
      "${var.test_a_arn}/*"
    ]
    actions = [
      "s3:ListBucket",
      "s3:PutObject",
      "s3:GetObject"
    ]
  }
}

data "aws_iam_policy_document" "s3_test_b_access_policy" {
  statement {
    sid    = ""
    effect = "Allow"
    resources = [
      var.test_b_arn,
      "${var.test_b_arn}/*"
    ]
    actions = [
      "s3:ListBucket",
      "s3:PutObject",
      "s3:GetObject"
    ]
  }
}

resource "aws_iam_policy" "test_a_policy" {
  name        = "test-a-s3-policy"
  policy      = data.aws_iam_policy_document.s3_test_a_access_policy.json
}

resource "aws_iam_policy" "test_b_policy" {
  name        = "test-b-s3-policy"
  policy      = data.aws_iam_policy_document.s3_test_b_access_policy.json
}