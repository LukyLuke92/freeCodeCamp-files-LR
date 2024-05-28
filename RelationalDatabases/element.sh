#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t -c"
# Check if there's an argument
if [[ -z $1 ]]
then
  echo Please provide an element as an argument.
  exit 0
fi
# Check if the argument is a number
if [[ $1 =~ ^[0-9]+$ ]]
then
  # Get all of the data for the element
  ELEM_DATA=$($PSQL "SELECT atomic_number,name,symbol,type,atomic_mass,melting_point_celsius,boiling_point_celsius FROM elements INNER JOIN properties USING (atomic_number) INNER JOIN types USING (type_id) WHERE atomic_number=$1")
  echo $ELEM_DATA | while read AT_NU BAR NAME BAR SYMB BAR TYPE BAR AT_MA BAR MELT BAR BOIL
  do
    echo "The element with atomic number $AT_NU is $NAME ($SYMB). It's a $TYPE, with a mass of $AT_MA amu. $NAME has a melting point of $MELT celsius and a boiling point of $BOIL celsius."
  done
elif [[ $1 =~ ^[A-Z][a-z][a-z]+ ]]
then
  # Get all of the data for the element
  ELEM_DATA=$($PSQL "SELECT atomic_number,name,symbol,type,atomic_mass,melting_point_celsius,boiling_point_celsius FROM elements INNER JOIN properties USING (atomic_number) INNER JOIN types USING (type_id) WHERE name='$1'")
  echo $ELEM_DATA | while read AT_NU BAR NAME BAR SYMB BAR TYPE BAR AT_MA BAR MELT BAR BOIL
  do
    echo "The element with atomic number $AT_NU is $NAME ($SYMB). It's a $TYPE, with a mass of $AT_MA amu. $NAME has a melting point of $MELT celsius and a boiling point of $BOIL celsius."
  done
elif [[ $1 =~ ^[A-Z][a-z]? ]]
then
  # Get all of the data for the element
  ELEM_DATA=$($PSQL "SELECT atomic_number,name,symbol,type,atomic_mass,melting_point_celsius,boiling_point_celsius FROM elements INNER JOIN properties USING (atomic_number) INNER JOIN types USING (type_id) WHERE symbol='$1'")
  echo $ELEM_DATA | while read AT_NU BAR NAME BAR SYMB BAR TYPE BAR AT_MA BAR MELT BAR BOIL
  do
    echo "The element with atomic number $AT_NU is $NAME ($SYMB). It's a $TYPE, with a mass of $AT_MA amu. $NAME has a melting point of $MELT celsius and a boiling point of $BOIL celsius."
  done
else
  echo "I could not find that element in the database."
fi
# The element with atomic number 1 is Hydrogen (H). It's a nonmetal, with a mass of 1.008 amu. Hydrogen has a melting point of -259.1 celsius and a boiling point of -252.9 celsius.
