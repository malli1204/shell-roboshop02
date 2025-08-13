uid=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
LOGS_FOLDER="/var/log/roboshop.log"
SCRIPT_NAME="$(echo $0 | cut -d "." -f1)"
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"

mkdir -p $LOGS_FOLDER
echo "script started executing at : $(date)" | tee -a $LOG_FILE

if [ $uid -ne 0 ] 
then 
    echo -e "$R you are not running with root user $N" | tee -a $LOG_FILE
    exit 1
else 
    echo "you are running with root user" | tee -a $LOG_FILE
fi

VALIDATE(){
    if [ $1 -eq 0 ]
    then 
        echo -e "Installing $2 is $G success $N " | tee -a $LOG_FILE
    else 
        echo -e "Installing $2 is $R not succcess $N" | tee -a $LOG_FILE
    fi
}
