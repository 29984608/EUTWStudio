package com.thoughtWorks.web.task;

import com.thoughtWorks.util.insertDataUtil.TaskUtil;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;


@Component
public class Task {
    private TaskUtil taskUtil = new TaskUtil();

    @Scheduled(fixedRate = 1000 * 2)
    public void executeJob() {
//        taskUtil.say();
    }
}

