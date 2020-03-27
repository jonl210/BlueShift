extends CanvasLayer

signal start_game
signal start

# Update score label with current score
func update_score_label(score):
	$ScoreLabel.text = str(score)

# Called when play button is pressed
func _on_PlayButton_pressed():
	$PlayButton.hide()
	$InstructionsLabel.hide()
	emit_signal("start_game")

func show_message(message):
	$MessageTimer.start()
	$MessageLabel.text = message

func show_end_score(message):
	$ScoreLabel.hide()
	$MessageLabel.show()
	$MessageLabel.text = message

func show_play_button(message):
	$PlayButton.text = message
	$PlayButton.show()

func show_score(score):
	$ScoreLabel.show()
	$ScoreLabel.text = str(score)

func _on_MessageTimer_timeout():
	$MessageLabel.hide()
	emit_signal("start")
