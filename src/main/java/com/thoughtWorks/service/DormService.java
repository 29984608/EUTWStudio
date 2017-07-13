package com.thoughtWorks.service;

import com.thoughtWorks.util.PageUtil;

import java.util.List;
import java.util.Map;

public interface DormService {

    List<Map<String,Object>> queryAreas(PageUtil pageUtil)throws Exception;

    void addArea(String name)throws Exception;

    void updateArea(String name, String id)throws Exception;

    void deleteArea(String id)throws Exception;

    List<Map<String,Object>> queryFloors(PageUtil pageUtil)throws Exception;

    void addFloor(String name,String areaId)throws Exception;

    void updateFloor(String name, String id)throws Exception;

    void deleteFloor(String id)throws Exception;

    List<Map<String,Object>> queryRooms(PageUtil pageUtil)throws Exception;

    void addRoom(String name)throws Exception;

    void updateRoom(String name, String id)throws Exception;

    void deleteRoom(String id)throws Exception;

    List<Map<String,Object>> selectAreaOfFloor()throws Exception;
}
