function DrawCircle(x, y, r, nseg, S)

theta = 0 : (2 * pi / nseg) : (2 * pi);
pline_x = r * cos(theta) + x;
pline_y = r * sin(theta) + y;

plot(pline_x, pline_y, S);
