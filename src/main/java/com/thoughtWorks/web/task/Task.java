package com.thoughtWorks.web.task;

import com.thoughtWorks.util.insertDataUtil.TaskUtil;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;


@Component
public class Task {
    private TaskUtil taskUtil = new TaskUtil();

    @Scheduled(cron = "5 0 0 * * *")
    public void executeJob() {
        System.out.println(222);
//        taskUtil.insertUser();
    }
}

