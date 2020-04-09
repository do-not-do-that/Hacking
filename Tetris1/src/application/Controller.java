package application;

public class Controller {

	public static final int SIZE = Form.SIZE;
	public static int XMAX = Form.XMAX;
	public static int YMAX = Form.YMAX;
	public static int[][] MESH = Main.MESH;
	
	public static void MoveRight() {
		if (Form.a.getX() + SIZE <= XMAX - SIZE && Form.b.getX() + SIZE <= XMAX - SIZE
				&& Form.c.getX() + SIZE <= XMAX - SIZE && Form.d.getX() + SIZE <= XMAX - SIZE) {
			int movea = MESH[((int) Form.a.getX() / SIZE) + 1][((int) Form.a.getY() / SIZE)];
			int moveb = MESH[((int) Form.b.getX() / SIZE) + 1][((int) Form.b.getY() / SIZE)];
			int movec = MESH[((int) Form.c.getX() / SIZE) + 1][((int) Form.c.getY() / SIZE)];
			int moved = MESH[((int) Form.d.getX() / SIZE) + 1][((int) Form.d.getY() / SIZE)];
			if (movea == 0 && movea == moveb && moveb == movec && movec == moved) {
				Form.a.setX(Form.a.getX() + SIZE);
				Form.b.setX(Form.b.getX() + SIZE);
				Form.c.setX(Form.c.getX() + SIZE);
				Form.d.setX(Form.d.getX() + SIZE);
			}
		}
	}
	
	public static void MoveLeft() {
		if (Form.a.getX() - SIZE >=0 && Form.b.getX() - SIZE >= 0
				&& Form.c.getX() - SIZE >= 0 && Form.d.getX() - SIZE >=0) {
			int movea = MESH[((int) Form.a.getX() / SIZE) - 1][((int) Form.a.getY() / SIZE)];
			int moveb = MESH[((int) Form.b.getX() / SIZE) - 1][((int) Form.b.getY() / SIZE)];
			int movec = MESH[((int) Form.c.getX() / SIZE) - 1][((int) Form.c.getY() / SIZE)];
			int moved = MESH[((int) Form.d.getX() / SIZE) - 1][((int) Form.d.getY() / SIZE)];
			if (movea == 0 && movea == moveb && moveb == movec && movec == moved) {
				Form.a.setX(Form.a.getX() - SIZE);
				Form.b.setX(Form.b.getX() - SIZE);
				Form.c.setX(Form.c.getX() - SIZE);
				Form.d.setX(Form.d.getX() - SIZE);
			}
		}
	}
}
