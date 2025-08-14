#!/bin/bash

source ./common.sh

check_root


# dnf module disable nginx -y
# VALIDATE $? "disabling current module.."

# dnf module enable nginx:1.24 -y
# VALIDATE $? "enabling 1.24 version module.."

# dnf install nginx -y
# VALIDATE $? "installing nginx.."

# systemctl enable nginx 
# systemctl start nginx 
# VALIDATE $? "starting the system services.."

# rm -rf /usr/share/nginx/html/* 
# VALIDATE $? "removing all the data in html file.."

# curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend-v3.zip
# VALIDATE $? "downloading the zip file.."

# cd /usr/share/nginx/html
# unzip /tmp/frontend.zip
# VALIDATE $? "unzipping the file.."

# rm -rf /etc/nginx/nginx.conf
# VALIDATE $? "removing data in conf file"

# cp $SCRIPT_DIR/nginx.conf /etc/nginx/nginx.conf
# VALIDATE $? "changing the configuration"

# systemctl restart nginx 
# VALIDATE $? "restarting the nginx service"





















dnf module disable nginx -y &>>$LOG_FILE
VALIDATE $? "module disable"

dnf module enable nginx:1.24 -y &>>$LOG_FILE
VALIDATE $? "module enable"

dnf install nginx -y &>>$LOG_FILE
VALIDATE $? "installing nginx"

rm -rf /etc/nginx/nginx.conf/* &>>$LOG_FILE
VALIDATE $? "removing data in conf file"

cp $SCRIPT_DIR/nginx.conf /etc/nginx/nginx.conf &>>$LOG_FILE
VALIDATE $? "changing the configuration"

systemctl enable nginx &>>$LOG_FILE
systemctl start nginx &>>$LOG_FILE
VALIDATE $? "starting system services"

rm -rf /usr/share/nginx/html/* &>>$LOG_FILE
VALIDATE $? "removing the content in html file"

curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend-v3.zip &>>$LOG_FILE
VALIDATE $? "downloading the zip file"

cd /usr/share/nginx/html 
unzip /tmp/frontend.zip &>>$LOG_FILE
VALIDATE $? "unzipping the file"



cp $SCRIPT_DIR/nginx.conf /etc/nginx/nginx.conf &>>$LOG_FILE
VALIDATE $? "changing the configuration"

systemctl restart nginx &>>$LOG_FILE
VALIDATE $? "restarting system services"

print_time