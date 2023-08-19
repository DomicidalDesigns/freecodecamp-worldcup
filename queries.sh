#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=worldcup --no-align --tuples-only -c"

# Do not change code above this line. Use the PSQL variable above to query your database.

echo -e "\nTotal number of goals in all games from winning teams:"
echo "$($PSQL "SELECT SUM(winner_goals) FROM games")"

echo -e "\nTotal number of goals in all games from both teams combined:"
echo "$($PSQL "SELECT SUM(winner_goals)+SUM(opponent_goals) FROM games")"

echo -e "\nAverage number of goals in all games from the winning teams:"
echo "$($PSQL "SELECT SUM(winner_goals)/CAST(count(*) AS DECIMAL) FROM games")"

echo -e "\nAverage number of goals in all games from the winning teams rounded to two decimal places:"
echo "$($PSQL "SELECT round(SUM(winner_goals)/CAST(count(*) AS DECIMAL),2) FROM games")"

echo -e "\nAverage number of goals in all games from both teams:"
echo "$($PSQL "SELECT (SUM(winner_goals)+SUM(opponent_goals))/CAST(count(*) AS DECIMAL) FROM games")"

echo -e "\nMost goals scored in a single game by one team:"
echo "$($PSQL "SELECT MAX(winner_goals) FROM games")"

echo -e "\nNumber of games where the winning team scored more than two goals:"
echo "$($PSQL "SELECT count(*) FROM games where winner_goals > 2")"

echo -e "\nWinner of the 2018 tournament team name:"
echo "$($PSQL "SELECT name from teams where team_id=(select winner_id FROM games where year=2018 and round='Final')")"

echo -e "\nList of teams who played in the 2014 'Eighth-Final' round:"
echo "$($PSQL "SELECT name from teams where team_id in (select winner_id FROM games where year=2014 and round='Eighth-Final' union select opponent_id FROM games where year=2014 and round='Eighth-Final' ) order by name;")"

echo -e "\nList of unique winning team names in the whole data set:"
echo "$($PSQL "SELECT name from teams where team_id in (select winner_id FROM games) order by name;")"

echo -e "\nYear and team name of all the champions:"
echo "$($PSQL "SELECT g.YEAR, t.NAME FROM teams t inner join games g on g.winner_id=t.team_id where round='Final' order by g.year")"

echo -e "\nList of teams that start with 'Co':"
echo "$($PSQL "SELECT t.name from teams t where SUBSTRING(t.name from 1 for 2)='Co'")"
