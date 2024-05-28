#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=salon --tuples-only -c"
MAIN_MENU () {
  # If MAIN_MENU is called with an argument, show that argument - if not, show the welcome message
  if [[ -z $1 ]]
  then
    echo -e "\n~~~Welcome to our salon!~~~\n"
  else
    echo -e "\n$1"
  fi
  SERVICES="$($PSQL "SELECT service_id,name FROM services ORDER BY service_id ASC")"
  echo -e "\nChoose from any of our services listed below"
  # Cycle through all of the rows, excluding those that do not have a number
  # For each service, spit out the service_id and name in the right format
  # Format is #) name
  echo "$SERVICES" | while read SERVICE_ID BAR SERVICE_NAME
  do
    if [[ $SERVICE_ID =~ ^[0-9]+$ ]]
    then
        echo "$SERVICE_ID) $SERVICE_NAME"
    fi
  done
}

MAIN_MENU
read SERVICE_ID_SELECTED
while [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
do
  MAIN_MENU "Please choose a valid option"
  read SERVICE_ID_SELECTED
done
echo -e "\nGreat choice! Please enter your phone number"
read CUSTOMER_PHONE
CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
if [[ -z $CUSTOMER_ID ]]
then
  echo -e "\nLooks like you don't have an account. What is your first name?"
  read CUSTOMER_NAME
  NEW_CUSTOMER=$($PSQL "INSERT INTO customers(name,phone) VALUES('$CUSTOMER_NAME','$CUSTOMER_PHONE')")
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE name='$CUSTOMER_NAME'")
  echo -e "\nGreat, we've set you up with an account. What time would you like to come in?"
else
  echo -e "\nGreat, we've found your account. What time would you like to come in?"
fi
read SERVICE_TIME
NEW_APPOINT=$($PSQL "INSERT INTO appointments(customer_id,service_id,time) VALUES($CUSTOMER_ID,$SERVICE_ID_SELECTED,'$SERVICE_TIME')")
SERVICE_NAME_SELECTED=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")
echo -e "\nI have put you down for a $SERVICE_NAME_SELECTED at $SERVICE_TIME, $CUSTOMER_NAME."
exit 0
