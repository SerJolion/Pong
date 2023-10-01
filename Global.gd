extends Node

const SETTINGS_PATH = 'user://Settings.json'

var MainPackedScene:PackedScene
var MenuPackedScene:PackedScene
var PausePackedScene:PackedScene
var BallPackedScene:PackedScene
var RacketPackedScene:PackedScene

var MainScene = null
var MenuScene = null

#Далее идут переменные настроек
var PlayerOneName:String
var PlayerTwoName:String
var BGColor:Color
var VinScore:int
var BallSpeed:int
var RacketSpeed:int

func _ready():
	MainPackedScene = load('res://Scenes/MainScene.tscn')
	MenuPackedScene = load('res://Scenes/MainMenu.tscn')
	PausePackedScene = load('res://GUIElements/PauseMenu.tscn')
	BallPackedScene = load('res://GameObjects/Ball.tscn')
	RacketPackedScene = load('res://GameObjects/Racked.tscn')
	LoadOption()

func SetScene(value:String):
	match value:
		'MainScene':
			get_tree().change_scene_to(MainPackedScene)
		'MenuScene':
			get_tree().change_scene_to(MenuPackedScene)

func LoadOption():
	var FileOptions = File.new()
	if FileOptions.file_exists(SETTINGS_PATH):
		FileOptions.open(SETTINGS_PATH,File.READ)
		var JsonOptions = parse_json(FileOptions.get_as_text())
		PlayerOneName = JsonOptions['PlayerOneName']
		PlayerTwoName = JsonOptions['PlayerTwoName']
		VinScore = int(JsonOptions['VinPoints'])
		var r = int(JsonOptions['BGColorRed'])
		var g = int(JsonOptions['BGColorGreen'])
		var b = int(JsonOptions['BGColorBlue'])
		BGColor = Color8(r,g,b)
		BallSpeed = int(JsonOptions['BallSpeed'])
		FileOptions.close()
	return

func SaveOption():
	var SettingsDict = Dictionary()
	SettingsDict['PlayerOneName'] = PlayerOneName
	SettingsDict['PlayerTwoName'] = PlayerTwoName
	SettingsDict['VinPoints'] = VinScore
	SettingsDict['BGColorRed'] = BGColor.r8
	SettingsDict['BGColorGreen'] = BGColor.g8
	SettingsDict['BGColorBlue'] = BGColor.b8
	SettingsDict['BallSpeed'] = BallSpeed
	var FileOptions = File.new()
	FileOptions.open(SETTINGS_PATH, File.WRITE)
	FileOptions.store_string(to_json(SettingsDict))
	FileOptions.close()

func SetDifficult(value:int):
	match value:
		0:
			pass
		1:
			pass
		2:
			pass

func Exit():
	get_tree().quit()

func Pause(value:bool):
	get_tree().paused = value
