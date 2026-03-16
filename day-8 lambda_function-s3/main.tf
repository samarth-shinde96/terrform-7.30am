resource "aws_s3_bucket" "name" {
    bucket = "my-lambda-function-code-bucket-12345"
  
}
resource "aws_s3_object" "name" {
    bucket = aws_s3_bucket.name.bucket
    key    = "function.zip"
    source = "function.zip"
    etag = filemd5("function.zip")
  
}
resource "aws_iam_role" "slf" {
    name = "lambda_exec_role"

    assume_role_policy = jsonencode({
        Version = "2012-10-17"
        Statement = [{
            Effect = "Allow"
            Principal = {
                Service = "lambda.amazonaws.com"
            }
            Action = "sts:AssumeRole"
        }]
    })
  
}
resource "aws_iam_role_policy_attachment" "slf_policy" {
    role       = aws_iam_role.slf.name
    policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
  
}
resource "aws_iam_role_policy_attachment" "s3_lambda_read" {
    role       = aws_iam_role.slf.name
    policy_arn = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
  
}
resource "aws_lambda_function" "name" {
    function_name = "my-lambda-function1"
    role          = aws_iam_role.slf.arn
    handler       = "lambda_function.lambda_handler"
    runtime       = "python3.11"
    timeout = 900
    memory_size = 128
  
   s3_bucket = aws_s3_bucket.name.bucket
   s3_key    = aws_s3_object.name.key
}
# 🔑 Code pulled from S3 (NOT local)
 