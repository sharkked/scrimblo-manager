class_name Spawner
extends Node2D

@export
var count = 50
@export
var cooldown = 0.5
@export
var autostart = true

@export
var spawn_instance : PackedScene

const critter_names = [
	"wallace",
	"hebry",
	"jerma985",
	"dounce",
	"streve",
	"jorban",
	"fnafguy",
	"leaf",
	"therno",
	"smilodon",
	"stogie",
	"brunck",
	"gummy",
	"wallace2",
	"theremy",
	"menubar",
	"quorace",
	"gemmica",
	"muffins",
	"ixl",
	"denser",
	"hambler",
	"sillyman",
	"string",
	"flumbo",
	"stheve",
	"emby",
	"foggy",
	"picto",
	"stump",
	"eraser",
	"ulius",
	"object",
	"memo",
	"pemdas",
	"aggro",
	"kyle2",
	"lentil",
	"zamboni",
	"xerxes",
	"chegley",
	"blorbo",
	"numpy",
	"plinko",
	"stu",
	"error",
	"shemp",
	"hahahaha",
	"stovel",
	"shroom",
	"yoop"
]

var name_queue;

func _ready():
	name_queue = critter_names.duplicate()
	spawn_all(cooldown)

func spawn_all(cd):
	var name_ct = name_queue.size()
	var n = count
	for i in n:
		var new_instance = spawn_instance.instantiate()
		new_instance.global_position = self.global_position
		new_instance.nickname = name_queue[i % name_ct]
		count -= 1
		get_tree().root.get_node("Game").add_child.call_deferred(new_instance)
		await get_tree().create_timer(cd).timeout
