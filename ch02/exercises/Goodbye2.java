package ch02.exercises;

import javax.swing.JComponent;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.WindowConstants;
import java.awt.event.MouseMotionListener;
import java.awt.Graphics;
import java.awt.event.MouseEvent;

public class Goodbye2 {
    public static void main(String[] args) {
        JFrame frame = new JFrame("GoodbyeJava2");
        frame.add(new GoodbyeComponent2("Goodbye, Java!"));
        frame.setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
        frame.setVisible(true);
        frame.setSize(300, 300);
    }
}

class GoodbyeComponent2 extends JComponent implements MouseMotionListener {
    String goodbyeMessage;
    int messageX = 100;
    int messageY = 200;

    public GoodbyeComponent2(String message) {
        goodbyeMessage = message;
        addMouseMotionListener(this);
    }

    @Override
    public void paintComponent(Graphics g) {
        g.drawString(goodbyeMessage, messageX, messageY);
    }

    public void mouseDragged(MouseEvent e) {
        messageX = e.getX();
        messageY = e.getY();
        repaint();
    }

    public void mouseMoved(MouseEvent e) {
        // ignore simple movements
    }
}