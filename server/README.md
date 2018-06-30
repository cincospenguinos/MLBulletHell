# Server

Constantly learns by playing the game. Eventually we should have a machine learner that
can conquer every player ever.

## Endpoints & Function

Here's the endpoints we have and their functions:

### /opponentData

* GET w/ various parameters returns the opponent's data for the game

### /games

* POST w/ various data to include a new example to be used in the next iteration of the learner

## Tables

Here's the tables we have and what they need to include:

### Game

In general:

* CPU won

For both player and CPU:

* gun refresh (integer)
* gun range (low and high)
* friction
* acceleration
* bullet speed