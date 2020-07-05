echo "Welcome to the employee wage program."

declare -A dailywage
declare -A totalwage
WAGE_PER_HOUR=20
WORKING_DAYS_PER_MONTH=20
TOTAL_WORKING_HOURS=100
PRESENT_HOURS=0
DAY=1
FULL_DAY_HOUR=8
PART_TIME_HOUR=4
PART_TIME=2
FULL_TIME=1

function getHours(){

        local randomCheck=$1
        case $randomCheck in
                $FULL_TIME)
                        echo $FULL_DAY_HOUR;;

                $PART_TIME)
                        echo $PART_TIME_HOUR;;

                *)echo 0;;

        esac
}

while [ $DAY -le $WORKING_DAYS_PER_MONTH ] && [ $PRESENT_HOURS -lt $TOTAL_WORKING_HOURS ]
do

        randomCheck=$((RANDOM%3))
        DAILY_HOURS="$( getHours $randomCheck )"
        dailywage["Day $DAY"]=$(($WAGE_PER_HOUR * $DAILY_HOURS))
        PRESENT_HOURS=$(( $PRESENT_HOURS + $DAILY_HOURS ))
        totalwage["Day $DAY"]=$(($PRESENT_HOURS * $WAGE_PER_HOUR))

        ((DAY++))
done

echo "Daily wage	Total wage "

for (( i=1;i<$DAY;i++ ))
do

        echo "${dailywage[Day $i]}		${totalwage[Day $i]}"

done
