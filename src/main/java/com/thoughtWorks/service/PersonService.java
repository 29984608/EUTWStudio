package com.thoughtWorks.service;

import com.thoughtWorks.util.PageUtil;

import java.util.List;
import java.util.Map;

public interface PersonService {


    List<Map<String,String>> queryTeachersList(PageUtil page)throws Exception;
}
