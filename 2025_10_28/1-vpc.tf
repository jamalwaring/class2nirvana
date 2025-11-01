resource "aws_vpc" "czj-vpc" {
    cidr_block = "10.25.0.0/16"

    tags = {
        Name="czj-vpc"
        Service="vpc"
        Owner="Chewbacca"
        Planet="Mustafar"
    }
}