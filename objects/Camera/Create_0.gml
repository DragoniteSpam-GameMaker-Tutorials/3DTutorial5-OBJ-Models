gpu_set_ztestenable(true);
gpu_set_zwriteenable(true);

vertex_format_begin();
vertex_format_add_position_3d();
vertex_format_add_normal();
vertex_format_add_color();
vertex_format_add_texcoord();
format = vertex_format_end();

pitch = 0;
direction = 0;
z = 32;

//var barrel = instance_create_depth(500, 500, depth, GameObject);
//barrel.model = load_model("barrel.d3d");

//var rock = instance_create_depth(200, 200, depth, GameObject);
//rock.model = load_model("rock_c.d3d");

var merry = instance_create_depth(500, 500, depth, GameObject);
merry.model = load_obj("merry.obj");
merry.z = -32;