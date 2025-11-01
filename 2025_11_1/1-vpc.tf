resource "aws_vpc" "antoinette-vpc" {
    cidr_block = "10.25.0.0/16"
    enable_dns_support   = true
    enable_dns_hostnames = true

    tags = {
        Name="antoinette-vpc"
        Service="vpc"
        Owner="Chewbacca"
        Planet="Mustafar"
    }
}