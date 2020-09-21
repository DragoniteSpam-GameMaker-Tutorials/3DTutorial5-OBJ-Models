// Game Objects are invisible by default
matrix_set(matrix_world, matrix_build(x, y, 64, 0, 0, 0, 1, 1, 1));
vertex_submit(model, pr_trianglelist, -1);
matrix_set(matrix_world, matrix_build_identity());