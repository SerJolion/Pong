extends Control

func _on_ResumeButton_pressed():
	Global.Pause(false)
	self.visible = false

func _on_MenuButton_pressed():
	Global.Pause(false)
	Global.SetScene('MenuScene')

func _on_ExitButton_pressed():
	Global.Exit()
