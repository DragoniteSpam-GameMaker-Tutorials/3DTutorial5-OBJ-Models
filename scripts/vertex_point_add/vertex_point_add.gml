/// @description Add a point to a vertex buffer.
/// @param buffer
/// @param x
/// @param y
/// @param z
/// @param nx
///	@param ny
///	@param nz
///	@param color
///	@param alpha
///	@param xtex
///	@param ytex
function vertex_point_add(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9, argument10) {

	vertex_position_3d(argument0, argument1, argument2, argument3);
	vertex_normal(argument0, argument4, argument5, argument6);
	vertex_color(argument0, argument7, argument8);
	vertex_texcoord(argument0, argument9, argument10);


}
