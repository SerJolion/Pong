extends Control

signal OkButtonPress
signal CanselButtonPress

var SelfBg:ColorRect

var BGColorRedSlider:Slider
var BGColorRedLabel:Label

var BGColorGreenSlider:Slider
var BGColorGreenLabel:Label

var BGColorBlueSlider:Slider
var BGColorBlueLabel:Label

var PlayerOneNameField:LineEdit
var PlayerTwoNameField:LineEdit

var VinPointSpin:SpinBox
var BallSpeedSpinn:SpinBox

var RacketSpeedSlider:Slider

func _ready():
	SelfBg = $ColorRect
	BGColorRedSlider = $VBoxContainer/ScrollContainer/VBoxContainer/BGRedContainer/BGColorRedSlider
	BGColorRedLabel = $VBoxContainer/ScrollContainer/VBoxContainer/BGRedContainer/BGColorRedValue
	BGColorGreenSlider = $VBoxContainer/ScrollContainer/VBoxContainer/BGGrrenContainer/BGColorGreenSlider
	BGColorGreenLabel = $VBoxContainer/ScrollContainer/VBoxContainer/BGGrrenContainer/BGColorGreenValue
	BGColorBlueSlider = $VBoxContainer/ScrollContainer/VBoxContainer/BGBlueContainer/BGColorBlueSlider
	BGColorBlueLabel = $VBoxContainer/ScrollContainer/VBoxContainer/BGBlueContainer/BGColorBlueValue
	PlayerOneNameField = $VBoxContainer/ScrollContainer/VBoxContainer/PlayerOneNameField
	PlayerTwoNameField = $VBoxContainer/ScrollContainer/VBoxContainer/PlayerTwoNameField
	VinPointSpin = $VBoxContainer/ScrollContainer/VBoxContainer/WinPointsContainer/SpinBox
	BallSpeedSpinn = $VBoxContainer/ScrollContainer/VBoxContainer/BallSpeedContainer/SpinBox
	RacketSpeedSlider = $VBoxContainer/ScrollContainer/VBoxContainer/RacketSpeedContainer/RacketSpeedSlider
	SelfBg.color = Global.BGColor
	BGColorRedSlider.value = Global.BGColor.r8
	BGColorGreenSlider.value = Global.BGColor.g8
	BGColorBlueSlider.value = Global.BGColor.b8
	PlayerOneNameField.text = Global.PlayerOneName
	PlayerTwoNameField.text = Global.PlayerTwoName
	BallSpeedSpinn.value = Global.BallSpeed
	VinPointSpin.value = Global.VinScore

func SetBGColor():
	var r = BGColorRedSlider.value
	var g = BGColorGreenSlider.value
	var b = BGColorBlueSlider.value
	SelfBg.color = Color8(r,g,b)

func _on_OkButton_pressed():
	var SettingsDict = Dictionary()
	Global.PlayerOneName = PlayerOneNameField.text
	Global.PlayerTwoName = PlayerTwoNameField.text
	Global.VinScore = float(VinPointSpin.value)
	var r = BGColorRedSlider.value
	var g = BGColorGreenSlider.value
	var b = BGColorBlueSlider.value
	Global.BGColor = Color8(r,g,b)
	Global.BallSpeed = BallSpeedSpinn.value
	emit_signal("OkButtonPress")
	Global.SaveOption()
	self.visible = false

func _on_CanselButton_pressed():
	emit_signal("CanselButtonPress")
	self.visible = false

func _on_BGColorRedSlider_value_changed(value):
	BGColorRedLabel.text = str(value)
	SetBGColor()

func _on_BGColorGreenSlider_value_changed(value):
	BGColorGreenLabel.text = str(value)
	SetBGColor()

func _on_BGColorBlueSlider_value_changed(value):
	BGColorBlueLabel.text = str(value)
	SetBGColor()
