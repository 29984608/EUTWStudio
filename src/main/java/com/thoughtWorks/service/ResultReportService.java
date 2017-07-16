package com.thoughtWorks.service;

import com.thoughtWorks.dto.SearchDto;

import java.util.List;
import java.util.Map;

public interface ResultReportService {

    List<Map<String,String>> showResultReportList(SearchDto searchDto)throws Exception;
}
