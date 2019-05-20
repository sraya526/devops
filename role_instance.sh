mkdir check
aws s3 cp s3://flipgo-jenkins/ipam-ec2.yml check/
aws s3 cp s3://flipgo-jenkins/IPAMrole.yml check/
sleep 20s
aws cloudformation create-stack --stack-name IPAMRole --template-body file://check/IPAMrole.yml --capabilities CAPABILITY_NAMED_IAM --region=ap-south-1
sleep 100s
aws iam add-role-to-instance-profile --instance-profile-name IPAMROLE --role-name IPAMROLE
aws iam list-roles | grep IPAM | awk '{print $7}' > check/status
aws cloudformation create-stack --stack-name "$stackname" --parameters ParameterKey=EnvironmentName,ParameterValue="$hostname" --capabilities CAPABILITY_IAM --template-body file://check/ipam-ec2.yml --region=ap-south-1
sleep 180s
x=`aws ec2 describe-instances --filter Name=tag:Name,Values=$hostname | grep ASSOCIATION | head -n 1 | awk '{print $3}'`
echo "Your PHPIPAM IPaddress is $x. Please access the application after 2minutes."
