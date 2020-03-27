extends Node2D

# Set new coin position; update score/label
func _on_Coin_coin_collected():
	$Coin.set_new_coin_position()
	$Player.score += 1
	$HUD.update_score_label($Player.score)

# Show message when play button is pressed
func _on_HUD_start_game():
	$Player.show()
	$HUD.show_message("Get Ready!")

func _on_HUD_start():
	$HUD.show_score(0)
	$Enemy.set_enemy_position()
	$Enemy.show()
	$Coin.show()
	$Coin.enable_collision()
	$Enemy.enable_collision()
	$Enemy.set_random_direction()

func _on_Player_player_hit():
	$HUD.show_end_score("Final Score: " + str($Player.score))
	$HUD.show_play_button("Play Again")
	$Enemy.restart()
	$Coin.restart()
	$Coin.disable_collision()
	$Player.restart()
	$Player.score = 0
