
resource "aws_eip" "lb_web" {
  instance = "i-00a57406d5b063c40"
  vpc      = true
}