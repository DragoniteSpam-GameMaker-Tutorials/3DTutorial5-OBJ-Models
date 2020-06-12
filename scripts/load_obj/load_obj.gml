/// @param filename

// Open the file
var filename = argument0;
var obj_file = file_text_open_read(filename);

// Create the vertex buffer
var model = vertex_create_buffer();
vertex_begin(model, GameWorld.format);

// Create the lists of position/normal/texture data
var vertex_x = ds_list_create();
var vertex_y = ds_list_create();
var vertex_z = ds_list_create();

var vertex_nx = ds_list_create();
var vertex_ny = ds_list_create();
var vertex_nz = ds_list_create();

var vertex_xtex = ds_list_create();
var vertex_ytex = ds_list_create();

// Read each line in the file
while(not file_text_eof(obj_file)){
	var line = file_text_read_string(obj_file);
	file_text_readln(obj_file);
	// Split each line around the space character
	var terms, index;
	index = 0;
	terms = array_create(string_count(line, " ") + 1, "");
	for (var i = 1; i <= string_length(line); i++){
		if (string_char_at(line, i) == " "){
			index++;
			terms[index] = "";
		} else {
			terms[index] += string_char_at(line, i);
		}
	}
	switch(terms[0]){
		// Add the vertex x, y an z position to their respective lists
		case "v":
			ds_list_add(vertex_x, real(terms[1]));
			ds_list_add(vertex_y, real(terms[2]));
			ds_list_add(vertex_z, real(terms[3]));
			break;
		// Add the vertex x and y texture position (or "u" and "v") to their respective lists
		case "vt":
			ds_list_add(vertex_xtex, real(terms[1]));
			ds_list_add(vertex_ytex, real(terms[2]));
			break;
		// Add the vertex normal's x, y and z components to their respective lists
		case "vn":
			ds_list_add(vertex_nx, real(terms[1]));
			ds_list_add(vertex_ny, real(terms[2]));
			ds_list_add(vertex_nz, real(terms[3]));
			break;
		case "f":
			// Split each term around the slash character
			for (var n = 1; n<= 3; n++){
				var data, index;
				index = 0;
				data = array_create(string_count(terms[n], "/") + 1, "");
				for (var i = 1; i <= string_length(terms[n]); i++){
					if (string_char_at(terms[n], i) == "/"){
						index++;
						data[index] = "";
					} else {
						data[index] += string_char_at(terms[n], i);
					}
				}
				// Look up the x, y, z, normal x, y, z and texture x, y in the already-created lists
				var xx = ds_list_find_value(vertex_x, real(data[0]) - 1);
				var yy = ds_list_find_value(vertex_y, real(data[0]) - 1);
				var zz = ds_list_find_value(vertex_z, real(data[0]) - 1);
				var xtex = ds_list_find_value(vertex_xtex, real(data[1]) - 1);
				var ytex = ds_list_find_value(vertex_ytex, real(data[1]) - 1);
				var nx = ds_list_find_value(vertex_nx, real(data[2]) - 1);
				var ny = ds_list_find_value(vertex_ny, real(data[2]) - 1);
				var nz = ds_list_find_value(vertex_nz, real(data[2]) - 1);
				
				// Optional: swap the y and z positions (useful if you used the default Blender export settings)
				var t = yy;
				yy = zz;
				zz = t;
				// If you do that you'll also need to swap the normals
				var t = ny;
				ny = nz;
				nz = t;
				
				// Add the data to the vertex buffers
				vertex_position_3d(model, xx, yy, zz);
				vertex_normal(model, nx, ny, nz);
				vertex_color(model, c_white, 1);
				vertex_texcoord(model, xtex, ytex);
			}
			break;
		default:
			// There are a few other things you can find in an obj file that I haven't covered here (but may in the future)
			break;
	}
}

// End the vertex buffer, destroy the lists, close the text file and return the vertex buffer

vertex_end(model);

ds_list_destroy(vertex_x);
ds_list_destroy(vertex_y);
ds_list_destroy(vertex_z);
ds_list_destroy(vertex_nx);
ds_list_destroy(vertex_ny);
ds_list_destroy(vertex_nz);
ds_list_destroy(vertex_xtex);
ds_list_destroy(vertex_ytex);

file_text_close(obj_file);

return model;
