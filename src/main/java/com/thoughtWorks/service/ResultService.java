package com.thoughtWorks.service;

import com.thoughtWorks.dto.SearchDto;
import com.thoughtWorks.util.PageUtil;

import java.util.List;
import java.util.Map;

public interface ResultService {


    List<Map<String,String>> querySearchList(SearchDto searchDto, PageUtil pageUtil) throws Exception;

    List<Map<String,String>> queryRankList(SearchDto searchDto, PageUtil pageUtil)throws Exception;
}
