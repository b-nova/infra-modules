resource "aws_sns_topic" "sns_topic" {
  application_success_feedback_sample_rate = 0
  display_name                             = "Reserved for notifications from AWS Chatbot to Slack"
  http_success_feedback_sample_rate        = 0
  lambda_success_feedback_sample_rate      = 0
  name                                     = var.name
  policy                                   = var.policy
  sqs_success_feedback_sample_rate         = 0
  tags                                     = {}
}

resource "aws_sns_topic_subscription" "sns_topic_subscription" {
  endpoint                        = "https://global.sns-api.chatbot.amazonaws.com"
  protocol                        = "https"
  raw_message_delivery            = false
  endpoint_auto_confirms          = true
  confirmation_timeout_in_minutes = 1
  topic_arn                       = aws_sns_topic.sns_topic.arn
}
