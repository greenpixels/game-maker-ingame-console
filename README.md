# How to use
- Import the latest package into your project
- Initialize your ingame as early as possible (e.g Game Start)

## Example of initialization
```gml
init_ingame_console()
	.add_command("joke", function() {
		log_info(
			choose(
				"I'm reading a book about anti-gravity. It's impossible to put down!",
				"Why don't scientists trust atoms? Because they make up everything!",
				"I used to be a baker, but I couldn't make enough dough."
			)
		);
	})
	.add_command("spawn", function(_params) {
		var _format_message = "Format: spawn item_id amount";
		if(array_length(_params) == 2) {
			var _item_id = _params[0];
			var _amount = _params[1];
			log_info($"Spawned {_item_id} {_amount} times");
		} else {
			log_warn(_format_message);	
		}
	});
```

# Global Functions
## init_ingame_console() : RETURNS obj_gm_ingame_console
Creates a singleton console.

## log_error(message : string)
Adds an error message to the console output.

## log_warn(message : string)
Adds an warning message to the console output.

## log_info(message : string)
Adds an info message to the console outout.

# Methods of obj_gm_ingame_console
## .add_command(command_initializer : string, callback : function)
Adds a command. Callback will be called with the parameters entered in the console.

## .set_font(font : Asset)
Sets the font to be displayed in the console

## .set_max_output_number(number : int)
Sets the maximum amount of messages to be displayed in the console (default: 40)
