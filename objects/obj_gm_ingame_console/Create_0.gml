/*
	SINGLETON RULES
*/

if(instance_number(obj_gm_ingame_console) > 1) {
	throw({message: $"Singleton Violation: There can only be one {object_get_name(object_index)}"});
}

if(!initialized) {
	throw({message: $"Create {object_get_name(object_index)} only by calling 'init_ingame_console()'"});	
}

/*
	VARIABLES
*/

is_open = false;
input = "";
output = [];
max_outputs = 40;
command_map = {};
font = -1;
depth = -15000;

/*
	METHODS
*/

function __trigger_command(_command_initializer, _params_array) {
	if(variable_struct_exists(self.command_map, _command_initializer)) {
		var _command = struct_get(self.command_map, _command_initializer);
		try {
			_command.callback(_params_array);
		} catch(_error) {
			if(!is_undefined(_error.message)) {
				log_error(_error)
			} else {
				log_error("There was an issue executing the command.");
			}
		}
	} else {
		log_warn($"A command by the name of '{_command_initializer}' does not exist.");	
	}
}

function set_font(_font) {
	obj_gm_ingame_console.font = _font;
}

function set_max_output_number(_number) {
	obj_gm_ingame_console.max_outputs = _number;	
}

function add_command(_initializer, _callback) {
	if(struct_exists(obj_gm_ingame_console.command_map, _initializer)) {
		throw({message: "Trying to add a command that already exists."});
	}
	struct_set(obj_gm_ingame_console.command_map, _initializer, {
		initializer: _initializer,
		callback : _callback
	});
	return obj_gm_ingame_console;
}

