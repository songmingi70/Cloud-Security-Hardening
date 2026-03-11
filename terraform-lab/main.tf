# AWS 프로바이더 설정
provider "aws" {
  region = "ap-northeast-2" # 서울 리전
}

# 보안 그룹 정의 (이름: web_security_fortress)
resource "aws_security_group" "web_security_fortress" {
  name        = "web-security-fortress"
  description = "Security group for hardened web server"

  # SSH 포트 변경 (2222)
  ingress {
    from_port   = 2222
    to_port     = 2222
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # HTTP (80)
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # HTTPS (443)
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # 나가는 트래픽은 모두 허용 (Stateful 특징)
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}