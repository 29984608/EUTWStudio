package com.thoughtWorks.service.impl;

import com.thoughtWorks.dao.StudentDataOutputDao;
import com.thoughtWorks.dto.SearchDto;
import com.thoughtWorks.service.StudentDataOutputService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class StudentDataOutputServiceImpl implements StudentDataOutputService {
    @Resource
    private StudentDataOutputDao studentDataOutputDao;
    @Override
    public List<Map<String, Object>> queryStudentList(SearchDto searchDto) throws Exception {
        Map<String, Object> data = new HashMap<>();
        searchDto.setStudentNo("%" + searchDto.getStudentNo() + "%");
        searchDto.setName("%" + searchDto.getName() + "%");
        searchDto.setRoomId("%" + searchDto.getRoomId() + "%");
        if (searchDto.getSex() == null) {
            searchDto.setSex("%" + "%");
        } else {
            searchDto.setSex("%" + searchDto.getSex() + "%");
        }

        if (searchDto.getTypeOfAccommodation() == null) {
            searchDto.setTypeOfAccommodation("");
        } else {
            searchDto.setTypeOfAccommodation(searchDto.getTypeOfAccommodation());
        }
        data.put("searchDto", searchDto);

        return studentDataOutputDao.queryStudentList(data);
    }

}
