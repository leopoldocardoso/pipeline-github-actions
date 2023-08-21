terraform {
  backend "s3" {
    bucket = "iacterraformtfstate"
    key    = "estudos-udemy/pipeline-github-actions/terraform.tfstate" #caminho no bucket onde o tfstate será salvo
    region = "us-east-1"
  }
}