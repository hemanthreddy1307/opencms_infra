

resource "aws_instance" "WEB01" {
    ami = "ami-9f086de0"
    availability_zone = "us-east-1c"
    instance_type = "t2.micro"
    key_name = "web"
    vpc_security_group_ids = ["sg-19c28f52"]
    subnet_id = "subnet-6b802345"
    source_dest_check = false

    tags {
        Name = "web Server"
    }
}


resource "aws_instance" "APP01" {
    ami = "ami-9f086de0"
    availability_zone = "us-east-1c"
    instance_type = "t2.micro"
    key_name = "web"
    vpc_security_group_ids = ["sg-46d19c0d"]
    subnet_id = "subnet-bf812291"
    source_dest_check = false

    tags {
        Name = "app Server"
    }
}

resource "aws_instance" "DB01" {
    ami = "ami-9f086de0"
    availability_zone = "us-east-1c"
    instance_type = "t2.micro"
    key_name = "web"
    vpc_security_group_ids = ["sg-30c38e7b"]
    subnet_id = "subnet-de8d2ef0"
    source_dest_check = false

    tags {
        Name = "DB Server"
    }
}