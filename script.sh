#!/bin/bash

#Setting environment variables
source .env

#Copying the environment variables to the server
scp .env $SCRIPT_ENV_SERVER_USER@$SCRIPT_ENV_SERVER_IP:/root/

#Copying the script to the server
scp server.sh $SCRIPT_ENV_SERVER_USER@$SCRIPT_ENV_SERVER_IP:/root/

#Running the script on the server
ssh $SCRIPT_ENV_SERVER_USER@$SCRIPT_ENV_SERVER_IP "bash server.sh"

#Deleting the script from the server
ssh $SCRIPT_ENV_SERVER_USER@$SCRIPT_ENV_SERVER_IP "rm server.sh"

#Deleting the environment variables from the server
ssh $SCRIPT_ENV_SERVER_USER@$SCRIPT_ENV_SERVER_IP "rm .env"