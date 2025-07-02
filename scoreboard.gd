extends Node

var home_score = 0
var away_score = 0

func scored(home_team:bool):
	if home_team:
		home_score += 1
	else:
		away_score += 1
		
	$"ScoreText".text = str(home_score) + " - " + str(away_score)
