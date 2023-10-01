tool
extends KinematicBody2D


var _GameScene = null

export(String, "player1_up", "player2_up") var UpAction
export(String, "player1_down", "player2_down") var DownAction
export var Speed:float = 10
export var Length:int setget SetLength

var Up = 0
var Down = 0
var CurrentSpeed:int

#Далее идут переменные для "искуственного интелекта"
export var Brain:bool = false
var BrainDifficult:int = 0
var MinDistToBall:int = 400
var MotionDist:int = 600


func _ready():
	CurrentSpeed = Speed

func _physics_process(delta):
	if not Engine.editor_hint:
		if Brain:
			BrainRun()
		else:
			if Input.is_action_pressed(UpAction):
				Up = 1
			if Input.is_action_just_released(UpAction):
				Up = 0
			if Input.is_action_pressed(DownAction):
				Down = 1
			if Input.is_action_just_released(DownAction):
				Down = 0
		var Velocity = Vector2(0, Down - Up) * CurrentSpeed
		move_and_slide(Velocity)

func Init(GameScene):
	_GameScene = GameScene

func BrainRun():
	var BallPosition:Vector2 = _GameScene.Ball.position
	if (position - BallPosition).length() < MinDistToBall:
		if BallPosition.y > position.y:
			Down = 1
			Up = 0
		elif BallPosition.y < position.y:
			Up = 1 
			Down = 0
		else:
			Up = 0
			Down = 0
	else:
		if position.y > MotionDist/2:
			Down = 0
			Up = 1
		elif position.y < MotionDist/2:
			Up = 0
			Down = 1
		else:
			Up = 0
			Down = 0

func SetLength(value:int):
	if value > 0:
		$ColorRect.rect_size.y = value
		$ColorRect.rect_position.y = -value/2
		var ColisionShape:RectangleShape2D = RectangleShape2D.new()
		ColisionShape.extents = Vector2(10,value/2)
		$CollisionShape2D.shape = ColisionShape
		Length = value

func SetCurrentSpeed():
	return

func SetSpeed(value:int):
	if value > 0:
		Speed = value
