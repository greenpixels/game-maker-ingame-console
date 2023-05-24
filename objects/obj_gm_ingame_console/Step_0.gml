if((keyboard_check_pressed(vk_f1) or keyboard_check_pressed(vk_escape)) and self.is_open) {
	self.is_open = false;
	keyboard_string = "";
} else if(keyboard_check_pressed(vk_f1) and !self.is_open) {
	self.is_open = true;
	keyboard_string = "";
}

if(keyboard_check_pressed(vk_enter) and self.is_open and string_length(input)) {
	var _input_array = string_split(self.input, " ");
	if(array_length(_input_array) > 0) {
		var _command = _input_array[0];
		array_shift(_input_array);
		var _parameters = _input_array;
		try {
			echo(self.input);
			__trigger_command(_command, _parameters);	
		} catch(_error) {
			log_error(_error.message);
		}
	}
	keyboard_string = "";
	self.input = "";
}

if(self.is_open and keyboard_check(vk_anykey)) {
	self.input = keyboard_string;	 
}

