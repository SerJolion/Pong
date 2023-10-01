extends Control

var VinerNameLabel:Label
signal RetrySignal

func _ready():
	VinerNameLabel = $Background/VBoxContainer/VictoryPlayerName

func SetName(Name:String):
	VinerNameLabel.text = Name

func _on_RetryButton_pressed():
	Global.Pause(false)
	emit_signal("RetrySignal")
	visible = false

func _on_MainMenuButton_pressed():
	Global.Pause(false)
	Global.SetScene('MenuScene')
