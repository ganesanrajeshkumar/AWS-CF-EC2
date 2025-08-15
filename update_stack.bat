@echo off
REM ==========================================
REM Update CloudFormation Stack to remove missing Key Pair
REM ==========================================

REM Set stack name and template path
set STACK_NAME=MyEC2Stack
set TEMPLATE_PATH=ec2-instance.yml

REM Update the stack
aws cloudformation update-stack ^
    --stack-name %STACK_NAME% ^
    --template-body file://%TEMPLATE_PATH% ^
    --capabilities CAPABILITY_NAMED_IAM

REM Check stack update status
aws cloudformation describe-stacks --stack-name %STACK_NAME%
