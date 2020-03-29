var matrix = matrix_build_lookat(
    camera_x(), camera_y(), camera_z(),
	camera_x() + dcos(camera_direction()), camera_y() - dsin(camera_direction()), camera_z() - dsin(camera_pitch()),
	0, 0, 1
);

camera_set_view_mat(view_camera[0], matrix);