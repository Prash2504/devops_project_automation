resource "aws_vpc" "web_vpc" {
  cidr_block       = var.web_subnet_cidr
  instance_tenancy = "default"

  tags = {
    Name = "main"
  }
}


data "aws_vpc" "selected"{
 /*    filter{
	  name = "tag:Name"
       	  values = ["main"]
    }
*/

  tags = {
	Name = "main"

    }


}

resource "aws_subnet" "web_subnet_1" {
   vpc_id     = "${data.aws_vpc.selected.id}"
   cidr_block = "100.0.1.0/24"
   tags = {
	   Name="web_subnet_1"
	} 
}


output "vpc_id" {
  value = data.aws_vpc.selected.id
}

output "subnet_id" {
  value = aws_subnet.web_subnet_1.id

}
