package com.thoughtWorks.dao;

import java.util.List;
import java.util.Map;

public interface PersonDao {

    List<Map<String,String>> queryPersonList(Map<String, Object> data);

    Long queryPersonTotalCount();
}
