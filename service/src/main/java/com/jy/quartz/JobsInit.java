package com.jy.quartz;

import com.jy.model.task.Task;
import com.jy.service.task.TaskService;
import org.quartz.*;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class JobsInit implements InitializingBean {

    @Autowired
    private TaskService taskService;

    @Autowired
    private QuartzManager quartzManager;

    @Override
    public void afterPropertiesSet() throws Exception {
        Thread.sleep(30000);
        //从数据库查询出所有的待执行定时任务
        System.out.println("的方式告诉的故事的方式告诉的故事的方式告诉的故事的方式告诉的故事的方式告诉的故事的方式告诉的故事的方式告诉的故事的方式告诉的故事");
        Task pt = new Task();
        pt.setTaskFlag(1);
        List<Task> list = taskService.selectTaskList(pt);
        //遍历集合，把任务挨个添加到调度器
        if(null != list){
            list.forEach(t -> {
                quartzManager.addJob(t);
            });
        }
    }
}
