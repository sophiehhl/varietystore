/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package variety.util;

import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;


public class MailUtil {
    
    public static void sendMail(String to, String from, String password,
            String subject, String body, boolean bodyIsHTML)
            throws MessagingException {
        // 1 - get a mail session
        Properties props = new Properties();
        props.put("mail.transport.protocol", "smtps");
        props.put("mail.smtps.host", "smtp.gmail.com");
        props.put("mail.smtps.port", 465);
        props.put("mail.smtps.auth", "true");
        props.put("mail.smtps.quitwait", "false");
        Session session = Session.getDefaultInstance(props);
        session.setDebug(false);	// show more information or not in the output

        // 2 - create a message
        Message message = new MimeMessage(session);
        message.setSubject(subject);
        if (bodyIsHTML)
            message.setContent(body, "text/html");
        else
            message.setText(body);

        // 3 - address the message
        Address fromAddress = new InternetAddress(from);
        Address toAddress = new InternetAddress(to);
        message.setFrom(fromAddress);
        message.setRecipient(Message.RecipientType.TO, toAddress);

        // 4 - send the message
        Transport transport = session.getTransport();
        transport.connect(from, password);
        transport.sendMessage(message, message.getAllRecipients());
        transport.close();
    }
    
/*
    public static void sendMail(String to, String from,
            String subject, String body, boolean bodyIsHTML)
            throws MessagingException {
        
        // 1 - get a mail session
        Properties props = new Properties();
        props.put("mail.transport.protocol","smtps");
        props.put("mail.smtps.host","smtp.gmail.com");
        props.put("mail.smtps.port",465);
        props.put("mail.smtps.auth","true");
        props.put("mail.smtps.quitwait", "false");
        Session session = Session.getDefaultInstance(props);
        session.setDebug(true);

        // 2 - create a message       
        Message message = new MimeMessage(session);
        message.setSubject("Variety Store - Order Confirmation");
        //message.setText("Thank you for your order!");
        message.setContent(
                "<h1> Thank you for your order! </h1>", "text/html");
        

        // 3 - address the message
        Address fromAddress = new InternetAddress("varietystore4260@gmail.com");
        message.setFrom(fromAddress);
        Address toAddress = new InternetAddress("varietystore4260@gmail.com");
        message.setRecipient(Message.RecipientType.TO, toAddress);

        // 4 - send the message
        Transport.send(message);
        Transport transport = session.getTransport();
        transport.connect("varietystore4260@gmail.com", "sophiemarcoaaron");
        transport.sendMessage(message, message.getAllRecipients());
        transport.close();
    }
*/
}
