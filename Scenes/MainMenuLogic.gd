extends Node2D

var MainColor:Color
var OptionMenu

var BallSpeed:float
var RocketSpeed:float

func _ready():
	Global.MenuScene = self
	OptionMenu = $MainMenu/OptionMenu
	OptionMenu.connect("OkButtonPress",self,'SetBgColor')
	$Background/ColorRect.color = Global.BGColor

func SetBgColor():
	$Background/ColorRect.color = Global.BGColor

func _on_StartButton_pressed():
	Global.SetScene('MainScene')

func _on_OptionButton_pressed():
	OptionMenu.visible = true

func _on_ExitButton_pressed():
	Global.Exit()
