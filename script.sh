#!/bin/bash

count=0
while [ $count -ne 1 ]
do

read -p "Menu for the Logic App:
 1. List all logic apps
 2. Create a logic app
 3. Delete a logic app
 4. Exit -->" choice


         case $choice in
             1)
                    az logic workflow list -o table 

             ;;
             2)
                echo "Enter the Name of resoruce group:"
                read rgname
                echo "Enter the Name of location:"
                read location
                echo "Enter the Name of Logic app:"
                read logicname    

                az logic workflow create --resource-group $rgname --location $location --name $logicname --definition "testDefinition.json"

             ;;
             3)
                echo "Enter the Name of resoruce group:"
                read rgname
                echo "Enter the Name of Logic app:"
                read logicname  
             
               az logic workflow delete --resource-group $rgname --name $logicname

             ;;
             4)
              echo "Exiting..."
             ;;
             *)
             echo "Unknown value"
             ;;
            esac
      count=1
      echo "Do you want to continue yes or no"
      read input 
      if [ $input = 'yes' ];then
      count=0
      fi     
done