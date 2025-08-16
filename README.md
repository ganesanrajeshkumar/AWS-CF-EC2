# AWS EC2 CF - Cloud formation for EC2

##1. To Deploy the CF :
aws cloudformation create-stack ^
    --stack-name %STACK_NAME% ^
    --template-body file://%TEMPLATE_PATH% ^
    --parameters ParameterKey=InstanceType,ParameterValue=%INSTANCE_TYPE% ^
                 ParameterKey=VPCId,ParameterValue=%VPC_ID% ^
                 ParameterKey=SubnetId,ParameterValue=%SUBNET_ID% ^
    --capabilities CAPABILITY_IAM

##2. To update the stack :
aws cloudformation update-stack ^
    --stack-name %STACK_NAME% ^
    --template-body file://%TEMPLATE_PATH% ^
    --capabilities CAPABILITY_NAMED_IAM

##3. To delete the stack :

##aws cloudformation delete-stack --stack-name MyStackName

Results screenshots :
1. Deploy the cloudformation template
<img width="801" height="303" alt="image" src="https://github.com/user-attachments/assets/92c652de-7223-4e73-85a0-3e798aacad07" />

2. Stack created
<img width="603" height="367" alt="image" src="https://github.com/user-attachments/assets/e2c607e8-c56b-460d-900b-2bb52a3f839b" />

3. EC2 provisioned
<img width="1179" height="223" alt="image" src="https://github.com/user-attachments/assets/e3371542-48f5-4cc8-9398-aaf92fbdf687" />
