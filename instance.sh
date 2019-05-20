aws cloudformation create-stack --stack-name "$stackname" --parameters ParameterKey=EnvironmentName,ParameterValue="$hostname" --capabilities CAPABILITY_IAM --template-body file://check/ipam-ec2.yml --region=ap-south-1
sleep 180s
x=`aws ec2 describe-instances --filter Name=tag:Name,Values=$hostname | grep ASSOCIATION | head -n 1 | awk '{print $3}'`
echo "Your PHPIPAM IPaddress is $x. Please access the application after 2minutes."
