resource "aws_instance" "web_demo" {
    ami             = var.ami_id
    instance_type   = var.ins_type
    subnet_id       = var.web_subnet_id
    count           = var.web_count
    tags            = {
            Name = "Web Demo - ${count.index}"
    }


}

resource "aws_instance" "app_demo"{
    ami             = var.ami_id
    instance_type   = var.ins_type
    subnet_id       = var.app_subnet_id
    count           = var.app_count
    tags            = {

        Name = "App Demo- ${count.index}"

    }

}

resource "aws_instance"  "db_demo" {

    ami             = var.ami_id
    instance_type   = var.ins_type
    subnet_id       = var.db_subnet_id
    count           = var.db_count
    tags            = {
        Name = "DB Demo - ${count.index}"
    }

}  x