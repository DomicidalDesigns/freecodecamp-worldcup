#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.


#"$($PSQL "SELECT SUM(winner_goals) FROM games")"
echo $($PSQL "DROP TABLE IF EXISTS temp_games")
echo $($PSQL "CREATE TABLE temp_games(year int NOT NULL, round varchar(50) NOT NULL, winner varchar(50) NOT NULL, opponent varchar(50) NOT NULL, winner_goals int NOT NULL, opponent_goals int NOT NULL);")

echo $($PSQL "\copy temp_games FROM 'games.csv' DELIMITER ',' CSV HEADER;")

# year,round,winner,opponent,winner_goals,opponent_goals
echo $($PSQL "SELECT * FROM temp_games")
echo $($PSQL "TRUNCATE TABLE games, teams;")

echo $($PSQL "insert into teams(name) select distinct winner from temp_games union select distinct opponent from temp_games;")

echo $($PSQL "insert into games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) select year, round, (select team_id from teams where name=winner) as winner_id, (select team_id from teams where name=opponent) as opponent_id, winner_goals, opponent_goals from temp_games;")

#echo $($PSQL "\d temp_games")
