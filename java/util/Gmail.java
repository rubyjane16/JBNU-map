package util;



import javax.mail.Authenticator;

import javax.mail.PasswordAuthentication;



public class Gmail extends Authenticator {



    @Override

    protected PasswordAuthentication getPasswordAuthentication() {

        return new PasswordAuthentication("201946127@jbnu.ac.kr","****"); //****�� ��й�ȣ

    }

    

}