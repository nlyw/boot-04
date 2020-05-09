package com.jy.task;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

//@Component
public class SpringTask {

    //@Scheduled(cron = "*/3 * * * * ?")
    public void task1(){
        System.out.println("哈哈哈哈你");
    }

}
