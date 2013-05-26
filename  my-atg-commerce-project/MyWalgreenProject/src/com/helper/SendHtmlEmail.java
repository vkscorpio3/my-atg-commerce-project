package com.helper;
import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;

public class SendHtmlEmail {
	public static void main(String [] args)
   {

      String host="smtp.gmail.com";//change accordingly
      String to="santuc1990@gmail.com";//change accordingly
      final String user="javamailtesting1@gmail.com";//change accordingly
      final String password="javamailtesting1";//change accordingly

      Properties properties = System.getProperties();
      properties.put("mail.smtp.host",host);
      properties.put("mail.smtp.auth", "true");
      properties.put("mail.smtp.port", 465);

      Session session = Session.getDefaultInstance(properties,
	new javax.mail.Authenticator() {
	 protected PasswordAuthentication getPasswordAuthentication() {
	  return new PasswordAuthentication(user,password);
	 }
      });
      
      try{
         MimeMessage message = new MimeMessage(session);
         message.setFrom(new InternetAddress(user));
         message.addRecipient(Message.RecipientType.TO,
                                  new InternetAddress(to));

        message.setSubject("HTML Message");
        message.setContent("<h1>sending html mail check</h1>","text/html" );
  
       Transport.send(message);
         System.out.println("message sent....");
      }catch (MessagingException ex) {ex.printStackTrace();}
   }
}