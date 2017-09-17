package com.thoughtWorks.service;

import com.thoughtWorks.dto.SearchDto;

import java.util.List;
import java.util.Map;

public interface StudentDataOutputService {
    List<Map<String, Object>> queryStudentList(SearchDto searchDto)throws Exception;
}
