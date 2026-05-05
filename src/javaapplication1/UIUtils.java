package javaapplication1;

import java.awt.Image;
import java.awt.event.ComponentAdapter;
import java.awt.event.ComponentEvent;
import javax.swing.ImageIcon;
import javax.swing.JFrame;
import javax.swing.JLabel;

public class UIUtils {
    
    /**
     * Makes a background label responsive to window resizing.
     */
    public static void makeBackgroundResponsive(final JFrame frame, final JLabel backgroundLabel, final String resourcePath) {
        frame.addComponentListener(new ComponentAdapter() {
            @Override
            public void componentResized(ComponentEvent e) {
                scaleBackground(frame, backgroundLabel, resourcePath);
            }
        });
        // Initial scale
        scaleBackground(frame, backgroundLabel, resourcePath);
    }

    private static void scaleBackground(JFrame frame, JLabel backgroundLabel, String resourcePath) {
        int width = frame.getWidth();
        int height = frame.getHeight();
        
        // Prevent scaling if window is too small or not yet initialized
        if (width <= 0 || height <= 0) return;

        try {
            java.net.URL imgUrl = UIUtils.class.getResource(resourcePath);
            if (imgUrl == null) {
                System.err.println("Resource not found: " + resourcePath);
                return;
            }
            ImageIcon icon = new ImageIcon(imgUrl);
            Image img = icon.getImage();
            Image scaledImg = img.getScaledInstance(width, height, Image.SCALE_SMOOTH);
            backgroundLabel.setIcon(new ImageIcon(scaledImg));
            backgroundLabel.setBounds(0, 0, width, height);
            
            // Ensure background is at the very back
            frame.getLayeredPane().setLayer(backgroundLabel, javax.swing.JLayeredPane.DEFAULT_LAYER);
            frame.getContentPane().setComponentZOrder(backgroundLabel, frame.getContentPane().getComponentCount() - 1);
        } catch (Exception ex) {
            System.err.println("Could not scale background: " + ex.getMessage());
        }
    }
}
