resource "aws_ecr_repository" "my_app" {
  name                 = "my-app-${var.env}"
  image_tag_mutability = "MUTABLE"

  tags = {
    Name = "my-app-${var.env}"
    Env  = var.env
  }
}
