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
 * 验证码功能
 * @author STerOtto
 * @version 2014-6-19
 *
 */
public class VerificationAction {
	private UserDAO userDAO;
	private User user;
	private int userId;
	
	// 设置图形验证码中字符串的字体和大小  
    private Font myFont = new Font("Arial Black", Font.PLAIN, 16);
    private String code;
    
    private HttpServletResponse response;
    private HttpServletRequest request;
    private HttpSession session;
    
    private String timestamp;
    private String tamp;
    /**
     * 检查验证码是否输入正确
     * @return
     */
    public String checkVerificationCode(){
    	// 取得用户Session  
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
     * 获取验证码，并且将验证码放入session中供登陆验证
     */
    public void getVerificationCode(){
    	System.out.println("enter code");
    	response = ServletActionContext.getResponse();
    	response.reset();
    	// 阻止生成的页面内容被缓存，保证每次重新生成随机验证码  
        response.setHeader("Pragma", "No-cache");  
        response.setHeader("Cache-Control", "no-cache");  
        response.setDateHeader("Expires", 0);  
        response.setContentType("image/jpeg");
        // 指定图形验证码图片的大小  
        int width = 100, height = 20; 
        BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);  
        // 在图片中绘制内容  
        Graphics g = image.getGraphics();  
        Random random = new Random();  
        g.setColor(getRandColor(200, 250));  
        g.fillRect(1, 1, width - 1, height - 1);  
        g.setColor(new Color(102, 102, 102));  
        g.drawRect(0, 0, width - 1, height - 1);  
        g.setFont(myFont);  
        // 随机生成线条，让图片看起来更加杂乱  
        g.setColor(getRandColor(160, 200));  
        for (int i = 0; i < 155; i++) {  
            int x = random.nextInt(width - 1);// 起点的x坐标  
            int y = random.nextInt(height - 1);// 起点的y坐标  
            int x1 = random.nextInt(6) + 1;// x轴偏移量  
            int y1 = random.nextInt(12) + 1;// y轴偏移量  
            g.drawLine(x, y, x + x1, y + y1);  
        }  
        // 随机生成线条，让图片看起来更加杂乱  
        for (int i = 0; i < 70; i++) {  
            int x = random.nextInt(width - 1);  
            int y = random.nextInt(height - 1);  
            int x1 = random.nextInt(12) + 1;  
            int y1 = random.nextInt(6) + 1;  
            g.drawLine(x, y, x - x1, y - y1);  
        }  
  
        // 该变量用来保存系统生成的随机字符串  
        String verificationCode = "";  
        for (int i = 0; i < 6; i++) {  
            // 取得一个随机字符  
            String tmp = getRandomChar();  
            verificationCode += tmp;  
            // 将系统生成的随机字符添加到图形验证码图片上  
            g.setColor(new Color(20 + random.nextInt(110), 20 + random.nextInt(110), 20 + random.nextInt(110)));  
            g.drawString(tmp, 15 * i + 10, 15);  
        }  
  
        // 取得用户Session  
        request = ServletActionContext.getRequest();
        HttpSession session = request.getSession();  
        // 将系统生成的图形验证码添加  
        System.out.println(verificationCode);
        session.setAttribute("verificationCode", verificationCode);  
        g.dispose();  
        // 输出图形验证码图片  
        try {
			ImageIO.write(image, "JPEG", response.getOutputStream());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
    }

    /**
     * 生成随机色
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
     * 随机生成一个字符
     * @return
     */
    private String getRandomChar() {  
        int rand = (int) Math.round(Math.random() * 2);// 将0～2的小数四舍五入生成整数  
        long itmp = 0;  
        char ctmp = '0';  
        // 根据rand的值来决定是生成一个大写字母、小写字母和数字  
        switch (rand) {  
        // 生成大写字母的情形  
        case 1:  
            itmp = Math.round(Math.random() * 25 + 65);  
            ctmp = (char) itmp;  
            return String.valueOf(ctmp);  
            // 生成小写字母  
        case 2:  
            itmp = Math.round(Math.random() * 25 + 97);  
            ctmp = (char) itmp;  
            return String.valueOf(ctmp);  
            // 生成数字  
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
