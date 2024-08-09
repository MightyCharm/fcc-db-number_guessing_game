#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

INSERT_DATA() {
  # if user is new and the name isn't in the database
  if [[ -z $CHECK_USER_NAME ]];
  then
    # insert data for new user
    INSERT_DATA=$($PSQL "INSERT INTO user_data VALUES('$USER_NAME', 1, $COUNT)")
  else
    # insert data for user that is alreaday in the database
    # increment games played by 1, then insert new value into database
    GAMES_PLAYED=$((GAMES_PLAYED+1))
    INSERT_GAMES_PLAYED=$($PSQL "UPDATE user_data SET games_played=$GAMES_PLAYED WHERE username='$USER_NAME'")

    # check if BEST_GAME is greater than COUNT, if so insert COUNT as new best_game into database
    if [[ $BEST_GAME -gt $COUNT ]];
    then
      INSERT_BEST_GAME=$($PSQL "UPDATE user_data SET best_game=$COUNT WHERE username='$USER_NAME'")
    fi
  fi
}

GET_GUESS() {
  # read user input
  read USER_GUESS
  #increment COUNT by 1
  COUNT=$((COUNT+1))
  # check if user guess is not a number
  if [[ ! $USER_GUESS =~ ^[0-9]+$ ]];
  then
    echo "That is not an integer, guess again:"
    GET_GUESS
  fi

  # check if guess is 1)to low 2)to high 3)correct
  if [[ $USER_GUESS -gt $RANDOM_NUMBER ]];
  then
    echo "It's lower than that, guess again:"
    GET_GUESS
  elif [[ $USER_GUESS -lt $RANDOM_NUMBER ]];
  then
    echo "It's higher than that, guess again:"
    GET_GUESS
  else
    echo "You guessed it in $COUNT tries. The secret number was $RANDOM_NUMBER. Nice job!"
    INSERT_DATA
    exit # end script after data was inserted
  fi
}

CHECK_USER() {
  # get username
  echo "Enter your username:"
  read USER_NAME

  # check if username is already in the database
  CHECK_USER_NAME=$($PSQL "SELECT username FROM user_data WHERE username='$USER_NAME'")
  if [[ -z $CHECK_USER_NAME ]];
  then
    # name is not in the database
    echo "Welcome, $USER_NAME! It looks like this is your first time here."
  else
    # name is in the database
    # get games_played
    GAMES_PLAYED=$($PSQL "SELECT games_played FROM user_data WHERE username='$USER_NAME'")
    # get best_game
    BEST_GAME=$($PSQL "SELECT best_game FROM user_data WHERE username='$USER_NAME'")
    echo "Welcome back, $USER_NAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  fi

  # create random number between 1 and 1000
  RANDOM_NUMBER=$(( $RANDOM % 1001  ))
  
  echo "Guess the secret number between 1 and 1000:"
  GET_GUESS
}

CHECK_USER
