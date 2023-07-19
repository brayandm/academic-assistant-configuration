#!/bin/bash

#Setting environment variables
source .env

if [ "$variable" = "root" ]; then
    # Código a ejecutar si la variable es igual a "root"
else
    #Copying the environment variables to the server
    scp .env $SCRIPT_ENV_SERVER_USER@$SCRIPT_ENV_SERVER_IP:~

    #Copying the script to the server
    scp server.sh $SCRIPT_ENV_SERVER_USER@$SCRIPT_ENV_SERVER_IP:~

    #Moving the script on the server to root
    ssh $SCRIPT_ENV_SERVER_USER@$SCRIPT_ENV_SERVER_IP "echo 'mv /home/$SCRIPT_ENV_SERVER_USER/server.sh /root/' | sudo -i"

    #Moving the environment variables on the server to root
    ssh $SCRIPT_ENV_SERVER_USER@$SCRIPT_ENV_SERVER_IP "echo 'mv /home/$SCRIPT_ENV_SERVER_USER/.env /root/' | sudo -i"

    #Running the script on the server
    ssh $SCRIPT_ENV_SERVER_USER@$SCRIPT_ENV_SERVER_IP "echo 'bash server.sh' | sudo -i"

    #Deleting the script from the server
    ssh $SCRIPT_ENV_SERVER_USER@$SCRIPT_ENV_SERVER_IP "echo 'rm server.sh' | sudo -i"

    #Deleting the environment variables from the server
    ssh $SCRIPT_ENV_SERVER_USER@$SCRIPT_ENV_SERVER_IP "echo 'rm .env' | sudo -i"
fi