package com.thoughtWorks.service.impl;

import com.thoughtWorks.dao.DormDao;
import com.thoughtWorks.service.DormService;
import com.thoughtWorks.util.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service

public class DormServiceImpl implements DormService {

    @Autowired
    private DormDao dormDao;

    @Override
    public List<Map<String, Object>> queryAreas(PageUtil pageUtil)throws Exception {
        Map<String, Object> data = new HashMap<>();
        data.put("start", (pageUtil.getCurrentIndex() - 1) * pageUtil.getPageSize());
        data.put("pageSize", pageUtil.getCurrentIndex() * pageUtil.getPageSize());
        pageUtil.setTotalSize(dormDao.queryAreasTotalCount());

        return dormDao.queryAreas(data);
    }

    @Override
    public void addArea(String name)throws Exception {
        dormDao.addArea(name);
    }

    @Override
    public void updateArea(String name, String id)throws Exception {
        Map<String, Object> data = new HashMap<>();
        data.put("name", name);
        data.put("id", id);
        dormDao.updateArea(data);
    }

    @Override
    public void deleteArea(String id)throws Exception {
        dormDao.deleteArea(id);
    }

    @Override
    public List<Map<String, Object>> queryFloors(PageUtil pageUtil)throws Exception {
        Map<String, Object> data = new HashMap<>();
        data.put("start", (pageUtil.getCurrentIndex() - 1) * pageUtil.getPageSize());
        data.put("pageSize", pageUtil.getCurrentIndex() * pageUtil.getPageSize());
        pageUtil.setTotalSize(dormDao.queryFloorsTotalCount());

        return dormDao.queryFloors(data);
    }

    @Override
    public void addFloor(String name,String areaId)throws Exception {
        dormDao.addFloor(name,areaId);
    }

    @Override
    public void updateFloor(String name, String id)throws Exception {
        Map<String, Object> data = new HashMap<>();
        data.put("name", name);
        data.put("id", id);
        dormDao.updateFloor(data);

    }

    @Override
    public void deleteFloor(String id)throws Exception {
        dormDao.deleteFloor(id);

    }

    @Override
    public List<Map<String, Object>> queryRooms(PageUtil pageUtil) throws Exception {
        Map<String, Object> data = new HashMap<>();
        data.put("start", (pageUtil.getCurrentIndex() - 1) * pageUtil.getPageSize());
        data.put("pageSize", pageUtil.getCurrentIndex() * pageUtil.getPageSize());
        pageUtil.setTotalSize(dormDao.queryRoomsTotalCount());

        return dormDao.queryRooms(data);
    }

    @Override
    public void addRoom(String name) throws Exception {
        dormDao.addRoom(name);
    }

    @Override
    public void updateRoom(String name, String id) throws Exception {
        Map<String, Object> data = new HashMap<>();
        data.put("name", name);
        data.put("id", id);

        dormDao.updateRoom(data);
    }

    @Override
    public void deleteRoom(String id) throws Exception {
        dormDao.deleteRoom(id);
    }

    @Override
    public List<Map<String, Object>> selectAreaOfFloor()throws Exception {
        return dormDao.selectAreaOfFloor();
    }
}
