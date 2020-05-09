package com.jy.service.task;

import com.jy.model.task.Task;

import java.util.List;
import java.util.Map;

public interface TaskService {
    List<Task> selectTaskList(Task task);

    Map<String,Object> selectAllTaskList(Task task);

    void insertTask(Task task);

    void updateTask(Task task);

    void deleteTask(Task task);
}
