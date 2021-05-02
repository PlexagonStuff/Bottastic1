extends Gift


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
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
		chat("Commands are youtube, twitter, discord, game. Add a # in front of each word.")
	if message.begins_with("#game"):
		chat("Fork is playing Super Mario 64, 3D All Stars")
	if "forktastic" in message:
		chat("Casual Youtuber that picked up streaming as well because life is short! I predominantly stream Duck Life speedruns, but I'm looking at expanding to Switch games in the future, starting with Taiko (with the drum controller!). So if you like what you're seeing, consider following!")
		
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
