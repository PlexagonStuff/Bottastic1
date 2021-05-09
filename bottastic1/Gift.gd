extends Gift
var skits = ["https://www.youtube.com/watch?v=6Mce7WTxbSo","https://www.youtube.com/watch?v=Zcf-XoDtgqk","https://www.youtube.com/watch?v=KJbHrZVTduQ","https://www.youtube.com/watch?v=jHfsWc1nUx8","https://www.youtube.com/watch?v=NUrghhh9mM8","https://www.youtube.com/watch?v=lIGueEYDU8M","https://www.youtube.com/watch?v=ZMJKeUT8_Wg","https://www.youtube.com/watch?v=1POEZ1x37WM","https://www.youtube.com/watch?v=d_D4n3CcHCQ","https://www.youtube.com/watch?v=9wItvEICj0c","https://www.youtube.com/watch?v=kJkaWV5MvPg","https://www.youtube.com/watch?v=Y3Q6Eaq5ZQk","https://www.youtube.com/watch?v=neILZOQNz6s","https://www.youtube.com/watch?v=yu4qvpvZay8","https://www.youtube.com/watch?v=B9Fe9tiyg5M","https://www.youtube.com/watch?v=GrmjSFWiVpg","https://www.youtube.com/watch?v=1YScVDMmpsM"]
var rng = RandomNumberGenerator.new()
onready var gameTitle = $LineEdit
var sabi = 0
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	rng.randomize()
	connect("cmd_no_permission", self, "no_permission")
	connect("chat_message", self, "parse_chat_data")
	connect("whisper_message", self, "parse_chat_data")
	connect_to_twitch()
	yield(self, "twitch_connected") 
	
	#authenticate_oauth(Global.botAccount, Global.authToken)
	authenticate_oauth("plexagonsbuff", "oauth:5o4rfqk2gli3g2a6l49hfb18ydfroq")
	if(yield(self, "login_attempt") == false):
	  print("Invalid username or token.")
	  return
	#join_channel(Global.hostChannel)
	join_channel("forktastic1")
	add_command("!helloworld", self, "hello_world")
	
	chat("Welcome to Bottastic! All the fun of fork, with none of the social grace! Use #help for a list of commands") # Replace with function body.
func parse_chat_data(sender_data: SenderData, message: String, override=false):
	parse_chat_input(sender_data.user, message, override)
	
	
func parse_chat_input(player_name: String, message: String, override=false):
	if message.begins_with("#youtube"):
		chat("Follow Fork at tinyurl.com/fork1234")
	if message.begins_with("#twitter"):
		chat("Follow fork at twitter.com/Forktastic1")
	if message.begins_with("#discord"):
		chat("Fork's discord is https://www.discord.gg/gZjHjM644u")
	if message.begins_with("#help"):
		chat("Commands are youtube, twitter, discord, game, skit, wr, whatthefork, src, instagram, dltodo, taikotodo. Add a # in front of each word.")
	if message.begins_with("#game"):
		chat("Fork is playing " + gameTitle.text)
	if message.begins_with("#skit"):
		chat("Here's a random Forktastic skit! " + skits[rng.randi_range(0, (skits.size() - 1))])
	if message.begins_with("#wr"):
		chat("Currently Fork has one WR on speedrun.com")
	if message.begins_with("#src"):
		chat("Fork's speedrun.com profile is https://www.speedrun.com/user/Forktastic")
	if message.begins_with("#dltodo"):
		chat("Fork's Speedrun To-Do list can be found here: https://docs.google.com/document/d/1sAttG8UqrH68TRb74fEBHIjvX32-9Sihj9xvToDCv_8/edit?usp=sharing")
	if message.begins_with("#taikotodo"):
		chat("Fork's Taiko To-Do list can be found here: https://docs.google.com/document/d/1tPk6QEJwn2FQdU_2-B_qlJ7wpqc0oo42O3YkvbgKxxA/edit")
	if message.begins_with("#instagram"):
		chat("Fork's insta is https://www.instagram.com/forktastic1/")
	if message.begins_with("#whatthefork"):
		chat("What the Fork! is Forktastic's podcast with friends about random subjects,from fruit to the fragility of life. You can view all episodes here: https://www.youtube.com/playlist?list=PLqrBrVyFI2CcMNy4PlFifV8ijjag7sfsD")
	if player_name == "Sabi2798":
		if sabi < 2:
			chat("saaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaabi")
			sabi = sabi + 1
	if "forktastic" in message:
		chat("Casual Youtuber that picked up streaming as well because life is short! I predominantly stream Duck Life speedruns, but I'm looking at expanding to Switch games in the future, starting with Taiko (with the drum controller!). So if you like what you're seeing, consider following!")
		
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
