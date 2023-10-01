extends Node2D

signal GameStart

var Player1Score = 0
var Player2Score = 0

var RacketOne = null
var RacketTwo = null
var Ball = null
var GUI = null

var startTimer:Timer
var CurrentTime = 0

var rng = RandomNumberGenerator.new()
export(Vector2) var BallStartPosition
export(Vector2) var RacketOneStartPosition
export(Vector2) var RacketTwoStartPosition

func _ready():
	$GameObjects/WinArea.connect("Goal", self, 'AddScore')
	$GameObjects/WinArea2.connect("Goal", self, 'AddScore')
	GUI = $GUI
	Ball = $GameObjects/Ball
	RacketOne = $GameObjects/Racket
	RacketOne.Init(self)
	RacketTwo = $GameObjects/Racket2
	RacketTwo.Init(self)
	startTimer = $ScriptsObjects/StartTime
	$Background/ColorRect.color = Global.BGColor
	Global.MainScene = self
	Ball.Init(Global.BallSpeed)
	ResetLevel()

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		$GUI.ShowPauseMenu(true)
		Global.Pause(true)

func AddScore(Player):
	match Player:
		'Player1':
			Player1Score += 1
			GUI.SetScore(0, Player1Score)
		'Player2':
			Player2Score += 1
			GUI.SetScore(1, Player2Score)
	ResetBall()
	WinCheck()

func ResetLevel():
	RacketOne.position = RacketOneStartPosition
	RacketTwo.position = RacketTwoStartPosition
	Player1Score = 0
	Player2Score = 0
	ResetBall()

func ResetBall():
	Ball.position = BallStartPosition
	Ball.RandomDirection()
	Ball.BallMotion(false)
	StartStartTimer(3)

func WinCheck():
	if Player1Score >= Global.VinScore or Player2Score >= Global.VinScore:
		if Player1Score > Player2Score:
			GUI.SetVinersName(Global.PlayerOneName)
		else:
			GUI.SetVinersName(Global.PlayerTwoName)
		Global.Pause(true)
		GUI.ShowVictoryPanel(true)

func StartStartTimer(value:int):
	CurrentTime = value
	startTimer.start()
	GUI.SetTimerValue(CurrentTime)
	GUI.ShowTimer(true)

func _on_StartTime_timeout():
	CurrentTime -= 1
	GUI.SetTimerValue(CurrentTime)
	if CurrentTime < 0:
		emit_signal("GameStart")
		startTimer.stop()
		GUI.ShowTimer(false)
		CurrentTime = 0

