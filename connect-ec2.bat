@echo off
REM -----------------------------
REM Batch file to SSH into EC2
REM -----------------------------

REM Path to your private key (.pem)
set KEY_PATH=MyKeyPair.pem

REM EC2 username (depends on AMI)
set EC2_USER=ec2-user

REM EC2 public IP
set EC2_HOST=18.205.18.37

REM SSH command
ssh -i "%KEY_PATH%" %EC2_USER%@%EC2_HOST%

pause
