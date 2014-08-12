package com.rainbow.action;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.Action;
import com.rainbow.dao.UserDAO;
import com.rainbow.entity.User;

/**
 * ��֤�빦��
 * @author STerOtto
 * @version 2014-6-19
 *
 */
public class VerificationAction {
	private UserDAO userDAO;
	private User user;
	private int userId;
	
	// ����ͼ����֤�����ַ���������ʹ�С  
    private Font myFont = new Font("Arial Black", Font.PLAIN, 16);
    private String code;
    
    private HttpServletResponse response;
    private HttpServletRequest request;
    private HttpSession session;
    
    private String timestamp;
    private String tamp;
    /**
     * �����֤���Ƿ�������ȷ
     * @return
     */
    public String checkVerificationCode(){
    	// ȡ���û�Session  
    	request = ServletActionContext.getRequest();
        session = request.getSession(); 
        String verificationCode = (String) session.getAttribute("verificationCode");
        System.out.println("verificationCode:"+verificationCode+"\n"+"code:"+code);
        if(verificationCode.equalsIgnoreCase(code))
        	return Action.SUCCESS;
        else 
        	return Action.ERROR;
    }
    
    
    /**
     * ��ȡ��֤�룬���ҽ���֤�����session�й���½��֤
     */
    public void getVerificationCode(){
    	System.out.println("enter code");
    	response = ServletActionContext.getResponse();
    	response.reset();
    	// ��ֹ���ɵ�ҳ�����ݱ����棬��֤ÿ���������������֤��  
        response.setHeader("Pragma", "No-cache");  
        response.setHeader("Cache-Control", "no-cache");  
        response.setDateHeader("Expires", 0);  
        response.setContentType("image/jpeg");
        // ָ��ͼ����֤��ͼƬ�Ĵ�С  
        int width = 100, height = 20; 
        BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);  
        // ��ͼƬ�л�������  
        Graphics g = image.getGraphics();  
        Random random = new Random();  
        g.setColor(getRandColor(200, 250));  
        g.fillRect(1, 1, width - 1, height - 1);  
        g.setColor(new Color(102, 102, 102));  
        g.drawRect(0, 0, width - 1, height - 1);  
        g.setFont(myFont);  
        // ���������������ͼƬ��������������  
        g.setColor(getRandColor(160, 200));  
        for (int i = 0; i < 155; i++) {  
            int x = random.nextInt(width - 1);// ����x����  
            int y = random.nextInt(height - 1);// ����y����  
            int x1 = random.nextInt(6) + 1;// x��ƫ����  
            int y1 = random.nextInt(12) + 1;// y��ƫ����  
            g.drawLine(x, y, x + x1, y + y1);  
        }  
        // ���������������ͼƬ��������������  
        for (int i = 0; i < 70; i++) {  
            int x = random.nextInt(width - 1);  
            int y = random.nextInt(height - 1);  
            int x1 = random.nextInt(12) + 1;  
            int y1 = random.nextInt(6) + 1;  
            g.drawLine(x, y, x - x1, y - y1);  
        }  
  
        // �ñ�����������ϵͳ���ɵ�����ַ���  
        String verificationCode = "";  
        for (int i = 0; i < 6; i++) {  
            // ȡ��һ������ַ�  
            String tmp = getRandomChar();  
            verificationCode += tmp;  
            // ��ϵͳ���ɵ�����ַ���ӵ�ͼ����֤��ͼƬ��  
            g.setColor(new Color(20 + random.nextInt(110), 20 + random.nextInt(110), 20 + random.nextInt(110)));  
            g.drawString(tmp, 15 * i + 10, 15);  
        }  
  
        // ȡ���û�Session  
        request = ServletActionContext.getRequest();
        HttpSession session = request.getSession();  
        // ��ϵͳ���ɵ�ͼ����֤�����  
        System.out.println(verificationCode);
        session.setAttribute("verificationCode", verificationCode);  
        g.dispose();  
        // ���ͼ����֤��ͼƬ  
        try {
			ImageIO.write(image, "JPEG", response.getOutputStream());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
    }

    /**
     * �������ɫ
     * @param fc
     * @param bc
     * @return
     */
    private Color getRandColor(int fc, int bc) {  
        Random random = new Random();  
        if (fc > 255)  
            fc = 255;  
        if (bc > 255)  
            bc = 255;  
        int r = fc + random.nextInt(bc - fc);  
        int g = fc + random.nextInt(bc - fc);  
        int b = fc + random.nextInt(bc - fc);  
        return new Color(r, g, b);  
    }
    /**
     * �������һ���ַ�
     * @return
     */
    private String getRandomChar() {  
        int rand = (int) Math.round(Math.random() * 2);// ��0��2��С������������������  
        long itmp = 0;  
        char ctmp = '0';  
        // ����rand��ֵ������������һ����д��ĸ��Сд��ĸ������  
        switch (rand) {  
        // ���ɴ�д��ĸ������  
        case 1:  
            itmp = Math.round(Math.random() * 25 + 65);  
            ctmp = (char) itmp;  
            return String.valueOf(ctmp);  
            // ����Сд��ĸ  
        case 2:  
            itmp = Math.round(Math.random() * 25 + 97);  
            ctmp = (char) itmp;  
            return String.valueOf(ctmp);  
            // ��������  
        default:  
            itmp = Math.round(Math.random() * 9);  
            return String.valueOf(itmp);  
        }  
    } 
	
	public String getCode() {
		return code;
	}


	public void setCode(String code) {
		this.code = code;
	}


	public VerificationAction(UserDAO userDAO) {
		super();
		this.userDAO = userDAO;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}


	public String getTimestamp() {
		return timestamp;
	}


	public void setTimestamp(String timestamp) {
		this.timestamp = timestamp;
	}


	public String getTamp() {
		return tamp;
	}


	public void setTamp(String tamp) {
		this.tamp = tamp;
	}
	
}
