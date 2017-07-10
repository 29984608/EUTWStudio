package com.thoughtWorks.service;

import java.io.File;
import java.util.List;
import java.util.Map;

public interface ReportService {

    List<Map<String,Object>> professionList(String level)throws Exception;

    File exportProfessionReport(String level)throws Exception;
}
