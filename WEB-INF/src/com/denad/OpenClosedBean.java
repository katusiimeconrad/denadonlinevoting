package com.denad;

import java.io.*;
import java.util.Calendar;
import java.util.Date;

public class OpenClosedBean implements Serializable {
    /**
     *
     */
    private static final long serialVersionUID = 1L;
    private Calendar currentTime = Calendar.getInstance();
    private Calendar closingDate;
    //private boolean votingOpen;


    public void setClosingDate(){
        //int day = date[1];
        //int month = date[2];
        //int year = date[3];
        //int hourOfDay = date[4];
        //int minute = date[5];
        //closingDate.set(year, month, date, hourOfDay, minute);
        closingDate.set(2020, 11 , 27);
    }

    public Calendar getClosingDate() {
        return this.closingDate;
    }

    public boolean isVotingOpen() {

        if( currentTime.after(closingDate)){
            return true;
        }
        else {
            return false;
        }
    }
}
