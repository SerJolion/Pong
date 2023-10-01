extends Control

var _StartTimerLable:Label

func _ready():
	$Player1Score.text = '0'
	$Player2Score.text = '0'
	$VictoryPanel.connect("RetrySignal",self,'Restart')
	_StartTimerLable = $StartTimerLabel
	ShowTimer(false)

func SetScore(player:int,score:int):
	var CurentLabel = null
	match player:
		0:
			CurentLabel = $Player1Score
		1:
			CurentLabel = $Player2Score
	CurentLabel.text = str(score)

func Restart():
	ResetGui()
	Global.MainScene.ResetLevel()

func ResetGui():
	$Player1Score.text = '0'
	$Player2Score.text = '0'
	SetTimerValue(0)
	ShowTimer(false)
	ShowPauseMenu(false)
	ShowVictoryPanel(false)

func SetPlayerOneScore(value:int):
	$Player1Score.text = str(value)

func SetPlayerTwoScore(value:int):
	$Player2Score.text = str(value)

func ShowPauseMenu(value:bool):
	$PauseMenu.visible = value

func SetVinersName(name:String):
	$VictoryPanel.SetName(name)

func ShowVictoryPanel(value:bool):
	$VictoryPanel.visible = value

func ShowTimer(value:bool):
	_StartTimerLable.visible = value

func SetTimerValue(value:int):
	_StartTimerLable.text = str(value)
