#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=game -t -c"
# Generate a random number from 1 to 1000 and store it as SEC_NUM
SEC_NUM=$(($RANDOM%1001));

# Prompt for username
echo -e "\nEnter your username:"
read USERNAME

# Query the database for user_id of $USERNAME
USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")
# Check if the user exists - if not, make a new user
if [[ -z $USER_ID ]]
then
  # Create a new user within table users
  ADD_USER=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")
  echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."
else
  # If the user does exist, then query for total number of games played and best score
  GET_DATA=$($PSQL "SELECT user_id, min(score), count(game_id) FROM scores WHERE user_id=$USER_ID GROUP BY user_id")
  echo $GET_DATA | while read TEMP BAR MIN_SCORE BAR GAME_COUNT
  do
    echo -e "\nWelcome back, $USERNAME! You have played $GAME_COUNT games, and your best game took $MIN_SCORE guesses."
  done
fi
# Start the number guessing game
echo -e "\nGuess the secret number between 1 and 1000:\n"
RESULT=false
SCORE=0
while [[ $RESULT == false ]]
do
  SCORE=$(($SCORE+1))
  read GUESS
  if [[ ! $GUESS =~ ^[0-9]+$ ]]
  then
    echo -e "\n That is not an integer, guess again:"
  elif [[ $GUESS -lt $SEC_NUM ]]
  then
    echo -e "\nIt's higher than that, guess again:"
  elif [[ $GUESS -gt $SEC_NUM ]]
  then
    echo -e "\nIt's lower than that, guess again:"
  elif [[ $GUESS -eq $SEC_NUM ]]
  then
    # Record the game in table scores
    REC_GAME=$($PSQL "INSERT INTO scores(user_id,score) VALUES($USER_ID,$SCORE)")
    echo -e "You guessed it in $SCORE tries. The secret number was $SEC_NUM. Nice job!"
    RESULT=true
  fi
done