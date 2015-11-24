function month (){
  if (( $2 == 2 )); then
    echo "$1/1"
    month $1 $(($2 + 7))
  elif (( $2 == 3 )); then
    echo "$1/1-$1/2"
    month $1 $(($2 + 7))
  elif (( $2 == 4 )); then
    echo "$1/1-$1/3"
    month $1 $(($2 + 7))
  elif (( $2 == 5 )); then
    echo "$1/1-$1/4"
    month $1 $(($2 + 7))
  #FullWeek
  elif (( $2 < 25 )); then
    echo "$1/$(($2-5))-$1/$(($2-1))"
    month $1 $(($2 + 7))
  else 
    return $2
  fi
}

function day29 (){
  month $1 $2
  temp=$?
  if (( $temp >=31 )); then 
    temp=$(($temp-7))
  fi
  if (( $temp == 23 )); then
    echo "$1/$(($temp-5))-$1/$(($temp-1))"
    echo "$1/27-$1/29"
    return 1
  elif (( $temp == 24 )); then
    echo "$1/$(($temp-5))-$1/$(($temp-1))"
    echo "$1/27-$1/29"
    return 2
  elif (( $temp == 25 )); then
    echo "$1/$(($temp-5))-$1/$(($temp-1))"
    echo "$1/27-$1/29"
    return 3
  elif (( $temp == 26 )); then
    echo "$1/$(($temp-5))-$1/$(($temp-1))"
    echo "$1/28-$1/29"
    return 4
  elif (( $temp == 27 )); then
    echo "$1/$(($temp-5))-$1/$(($temp-1))"
    echo "$1/29"
    return 5
  elif (( $2 == 28 )); then
    return 6 
  elif (( $temp == 29 )); then
    return 7
  fi
}

function day30 (){
  month $1 $2
  temp=$?
  if (( $temp >=31 )); then 
    temp=$(($temp-7))
  fi
  if (( $temp == 24 )); then
    echo "$1/$(($temp-5))-$1/$(($temp-1))"
    echo "$1/26-$1/30"
    return 1 
  elif (( $temp == 25 )); then
    echo "$1/$(($temp-5))-$1/$(($temp-1))"
    echo "$1/27-$1/30"
    return 2 
  elif (( $temp == 26 )); then
    echo "$1/$(($temp-5))-$1/$(($temp-1))"
    echo "$1/28-$1/30"
    return 3
  elif (( $temp == 27 )); then
    echo "$1/$(($temp-5))-$1/$(($temp-1))"
    echo "$1/29-$1/30"
    return 4
  elif (( $temp == 28 )); then
    echo "$1/$(($temp-5))-$1/$(($temp-1))"
    echo "$1/30"
    return 5
  elif (( $temp == 29 )); then
    return 6
  elif (( $temp == 30 )); then
    return 7
fi
}

function day31 (){
  month $1 $2
  temp=$?
  if (( $temp == 25 )); then
    echo "$1/$(($temp-5))-$1/$(($temp-1))"
    echo "$1/27-$1/31"
    #return the next Saturday for next month
    return 1 
  elif (( $temp == 26 )); then
    echo "$1/$(($temp-5))-$1/$(($temp-1))"
    echo "$1/28-$1/31"
    return 2
  elif (( $temp == 27 )); then
    echo "$1/$(($temp-5))-$1/$(($temp-1))"
    echo "$1/29-$1/31"
    return 3
  elif (( $temp == 28 )); then
    echo "$1/$(($temp-5))-$1/$(($temp-1))"
    echo "$1/30-$i/31"
    return 4
  elif (( $temp == 29 )); then
    echo "$1/$(($temp-5))-$1/$(($temp-1))"
    echo "$1/31"
    return 5
  elif (( $temp == 30 )); then
    echo "$1/$(($temp-5))-$1/$(($temp-1))"
    return 6
  elif (( $temp == 31 )); then
    echo "$1/$(($temp-5))-$1/$(($temp-1))"
    return 7
  fi
}

if [ $# -ne 1 ]
  then
    echo " "
    echo "No arguments supplied."
    echo "Please supply first saturday of the year:"
    echo "\$sh $0 2 >> reverseme"
    echo " "
    echo "Follow this command with"
    echo "\$tail -f reverseme" 
  else
    day31 1 2
    feb=$?
    echo "JANUARY"
    echo " "

    #FebLeap
    day29 2 $feb
    mar=$?
    echo "FEBRUARY"
    echo " "
    #Feb
    #day28

    day31 3 $mar
    apr=$?    
    echo "MARCH"
    echo " "

    day30 4 $apr
    may=$?
    echo "APRIL"
    echo " "

    day31 5 $may
    jun=$?
    echo "MAY"
    echo " "

    day30 6 $jun
    jul=$?
    echo "JUNE"
    echo " "

    day31 7 $jul
    aug=$?
    echo "JULY"
    echo " "

    day31 8 $aug
    sep=$?
    echo "AUGUST"
    echo " "

    day30 9 $sep
    oct=$?
    echo "SEPTEMBER"
    echo " "

    day31 10 $oct
    nov=$?
    echo "OCTOBER"
    echo " "

    day30 11 $nov
    dec=$?
    echo "NOVEMBER"
    echo " "

    day31 12 $dec
    echo "DECEMBER"
    echo " "
fi
