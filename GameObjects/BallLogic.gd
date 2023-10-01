extends KinematicBody2D

export var Speed:float = 100
export var Direction:Vector2 = Vector2(0,0)

var CurrentSpeed:float
var Velocity:Vector2 = Vector2(0,0)

func _ready():
	CurrentSpeed = Speed

func _physics_process(delta):
	if is_on_ceiling():
		Direction.y = 1
	if is_on_floor():
		Direction.y = -1
	if is_on_wall():
		if Direction.x > 0:
			Direction.x = -1
		else:
			Direction.x = 1
	Velocity = Direction * CurrentSpeed
	move_and_slide(Velocity, Vector2 (0, -1), false, 4, 0.785398, true)

func Init(StartSpeed:int = Speed):
	Speed = StartSpeed
	CurrentSpeed = Speed
	Global.MainScene.connect('GameStart', self,'StartMotion')

func SetCurrentSpeed(value:float):
	if value > 0:
		CurrentSpeed = value

func RandomDirection():
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var Dirs = [-1,1]
	var XDir = Dirs[rng.randi_range(0,1)]
	var YDir = Dirs[rng.randi_range(0,1)]
	Direction = Vector2(XDir, YDir)

func StartMotion():
	BallMotion(true)

func StopMotion():
	BallMotion(false)

func BallMotion(value:bool):
	if value:
		CurrentSpeed = Speed
	else:
		CurrentSpeed = 0
