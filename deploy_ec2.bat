@echo off
REM -----------------------------
REM Windows Batch to deploy EC2 CloudFormation stack
REM -----------------------------

REM --- Set variables ---
set STACK_NAME=MyEC2Stack
set TEMPLATE_PATH=ec2-instance.yml
set INSTANCE_TYPE=t2.micro
set VPC_ID=vpc-053xxxxxxxxxxxxxx
set SUBNET_ID=subnet-029xxxxxxxxxxxxxx

REM --- Create CloudFormation stack ---
aws cloudformation create-stack ^
    --stack-name %STACK_NAME% ^
    --template-body file://%TEMPLATE_PATH% ^
    --parameters ParameterKey=InstanceType,ParameterValue=%INSTANCE_TYPE% ^
                 ParameterKey=VPCId,ParameterValue=%VPC_ID% ^
                 ParameterKey=SubnetId,ParameterValue=%SUBNET_ID% ^
    --capabilities CAPABILITY_IAM

IF %ERRORLEVEL% NEQ 0 (
    echo Failed to create stack
    pause
    exit /b %ERRORLEVEL%
)

REM --- Wait for stack creation to complete ---
echo Waiting for stack to complete...
aws cloudformation wait stack-create-complete --stack-name %STACK_NAME%

IF %ERRORLEVEL% NEQ 0 (
    echo Stack creation failed
    pause
    exit /b %ERRORLEVEL%
)

REM --- Get stack outputs ---
echo Stack created successfully. Fetching outputs...
aws cloudformation describe-stacks ^
    --stack-name %STACK_NAME% ^
    --query "Stacks[0].Outputs" ^
    --output table

echo.
echo Done.
pause
