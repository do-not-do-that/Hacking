package application;

import javafx.scene.Group;
import javafx.scene.paint.Color;
import javafx.scene.shape.Line;
import javafx.scene.shape.Rectangle;

// 블록과 배경 그물 생성 메소드가 있는 클래스

public class Form {
	
	final static int SIZE = 25;
	final static int XMAX = SIZE*12;
	final static int YMAX = SIZE*24;
	final static int SMAX = SIZE*6;
	static Group g = new Group();
	static Group gr = new Group();
	static Color color;
	
	
	//사각형
	static Rectangle a = new Rectangle(SIZE-1,SIZE-1);
	static Rectangle b = new Rectangle(SIZE-1,SIZE-1);
	static Rectangle c = new Rectangle(SIZE-1,SIZE-1);
	static Rectangle d = new Rectangle(SIZE-1,SIZE-1);
	
	
	public static Group makeBlock() {
		
		int block = (int)(Math.random()*100);
		
		
		
		if(block<15) {
			a.setX(XMAX/2 -SIZE);
			b.setX(XMAX/2 -SIZE);
			b.setY(SIZE);
			c.setX(XMAX/2 -SIZE*2);
			c.setY(SIZE*2);
			d.setX(XMAX/2 -SIZE);
			d.setY(SIZE*2);
			color=Color.DODGERBLUE;
		}
	    else if(block<30) {
	        a.setX(XMAX/2-SIZE);
	        b.setX(XMAX/2 -SIZE);
	        b.setY(SIZE);
	        c.setX(XMAX/2);
	        c.setY(2*SIZE);
	        d.setX(XMAX/2-SIZE);
	        d.setY(2*SIZE);
	        color=Color.AQUAMARINE;
	    }
	       
	    else if(block<45) {
	        a.setX(XMAX/2-SIZE);
	        b.setX(XMAX/2-2*SIZE);
	        b.setY(SIZE);         
	        c.setX(XMAX/2);
	        c.setY(SIZE);
	        d.setX(XMAX/2 -SIZE);
	        d.setY(SIZE);
	        color=Color.AQUA;
	    }
	    else if(block<60) {
	        a.setX(XMAX/2-SIZE);
	        b.setX(XMAX/2);         
	        c.setX(XMAX/2-SIZE);
	        c.setY(SIZE);
	        d.setX(XMAX/2);
	        d.setY(SIZE);
	        color=Color.CORNFLOWERBLUE;
	    }   
		else if(block<75) {
			a.setX(XMAX/2-SIZE);
			b.setX(XMAX/2);
			c.setX(XMAX/2-SIZE*2);
			c.setY(SIZE);
			d.setX(XMAX/2-SIZE);
			d.setY(SIZE);
			color=Color.BLUE;
		
		}
		else if(block<90) {
			a.setX(XMAX/2-SIZE*2);
			b.setX(XMAX/2-SIZE);
			c.setX(XMAX/2);
			c.setY(SIZE);
			d.setX(XMAX/2-SIZE);
			d.setY(SIZE);
			color=Color.LIGHTBLUE;
		}
		else {
			a.setX(XMAX/2-SIZE);
			b.setX(XMAX/2-SIZE);
			b.setY(SIZE);
			c.setX(XMAX/2-SIZE);
			c.setY(SIZE*2);
			d.setX(XMAX/2-SIZE);
			d.setY(SIZE*3);
			color=Color.PALETURQUOISE;
		}
		
		a.setFill(color);
		b.setFill(color);
		c.setFill(color);
		d.setFill(color);
		g.getChildren().addAll(a,b,c,d);
		return g;
		
	}
	
	public static Group makeMesh() {
		
		for(int i=0;i<YMAX;i+=SIZE) {
			Line garo = new Line(0,i,XMAX,i);
			garo.setStroke(Color.DARKGRAY);
			garo.setStrokeWidth(1);
			gr.getChildren().add(garo);
		}
		for(int i=0; i<XMAX;i+=SIZE) {
			Line sero = new Line(i,0,i,YMAX);
			sero.setStroke(Color.DARKGRAY);
			sero.setStrokeWidth(1);
			gr.getChildren().add(sero);
		}
		Line line = new Line(XMAX,0,XMAX,YMAX);
		line.setStroke(Color.DARKGRAY);
		line.setStrokeWidth(4);
		gr.getChildren().add(line);
		
		return gr;
	}
	
}
