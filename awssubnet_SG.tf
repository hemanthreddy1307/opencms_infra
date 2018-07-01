provider "aws" {
  access_key = "AKIAID2FKIHPBAH3RRBA"
  secret_key = "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"
  region     = "us-east-1"
}

/*
  Create Subnet
*/

resource "aws_subnet" "web" {
    vpc_id = "vpc-742e250c"
    cidr_block = "172.31.0.0/24"
    availability_zone = "us-east-1c"

    tags {
        Name = "Public Subnet WEB"
    }
}

resource "aws_subnet" "app" {
    vpc_id = "vpc-742e250c"
    cidr_block = "172.31.16.0/24"
    availability_zone = "us-east-1c"

    tags {
        Name = "Public Subnet APP"
    }
}

resource "aws_subnet" "db" {
    vpc_id = "vpc-742e250c"
    cidr_block = "172.31.50.0/24"
    availability_zone = "us-east-1c"

    tags {
        Name = "Public Subnet DB"
    }
}

resource "aws_security_group" "webSG" {
  vpc_id = "vpc-742e250c"
  description = "Allow SSH, port 80, port 443 inbound and all outgoing traffic"

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

    ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

    ingress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "webenv"
  }
}


resource "aws_security_group" "appSG" {
  vpc_id = "vpc-742e250c"
  description = "Allow SSH, port 8080 inbound and all outgoing traffic"

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

    ingress {
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    cidr_blocks = ["172.0.0.0/16"]
  }
  
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "appenv"
  }
}

resource "aws_security_group" "dbSG" {
  vpc_id = "vpc-742e250c"
  description = "Allow SSH, port 3306 inbound and all outgoing traffic"

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

    ingress {
    from_port = 3306
    to_port = 3306
    protocol = "tcp"
    cidr_blocks = ["172.0.0.0/16"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "dnenv"
  }
}


