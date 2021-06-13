resource "aws_dynamodb_table" "machine_properties" {
  hash_key = "MachineID"
  name = "${local.system_name}-MachineState"
  billing_mode = "PAY_PER_REQUEST"
  attribute {
     name = "MachineID"
     type = "S"
   }
}


resource "aws_dynamodb_table_item" "machine_properties" {
  table_name = aws_dynamodb_table.machine_properties.name
  hash_key   = aws_dynamodb_table.machine_properties.hash_key

  item = <<ITEM
{
  "MachineID": {"S": "i-0eeabf6aab5e3e4ed"},
  "AvailabilityZone": {"S": "us-east-1"},
  "InstanceType": {"S": "t3.micro" }
}
ITEM
}
