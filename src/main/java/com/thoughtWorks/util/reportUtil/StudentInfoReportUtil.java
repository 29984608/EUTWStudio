package com.thoughtWorks.util.reportUtil;

import com.thoughtWorks.entity.StudentInfoReportStatistic;
import com.thoughtWorks.util.excelUtil.ExcelReportUtil;
import org.apache.poi.hssf.usermodel.*;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.util.CellRangeAddress;

import java.util.List;
import java.util.Map;

public class StudentInfoReportUtil extends ExcelReportUtil {
    private HSSFSheet sheet;
    private HSSFRow row;
    private HSSFCell cell;
    private int rowIndex;
    private String[] types = {"班级人数", "合作企业", "自主实习", "创新创业", "专升本", "其它", "在读", "休学", "入伍","留级", "退学", "流失", "复学", "欠费"};

    @Override
    protected void writeHeaders(HSSFSheet sheet, Map<String, String> headers) {
        this.sheet = sheet;
        row = sheet.createRow(1);

        int columnIndex = 0;
        for (String key : headers.keySet()) {
            HSSFCell cell = row.createCell(columnIndex++);
            cell.setCellValue(new HSSFRichTextString(headers.get(key)));
        }
        setDefaultRowHeight(sheet, 18);
    }

    @Override
    protected void writeCellData(HSSFSheet sheet, List<Map<String, Object>> dataset, HSSFWorkbook workbook) {
        try {
            rowIndex = 2;
            sheet.setColumnWidth((short) 0, (short) 3000);
            sheet.setColumnWidth((short) 2, (short) 3000);
            sheet.setColumnWidth((short) 3, (short) 4000);

            for (Map<String, Object> department : dataset) {
                row = sheet.createRow(rowIndex);
                cell = row.createCell(0);
                cell.setCellValue(new HSSFRichTextString(department.get("departmentName").toString()));
                setAlignmentCenter(createCellStyle(), cell);
                int rowspan = getDepartmentRowspan(department);
                mergeRows(rowspan, 0, 0);

                fillDepartmentLevels((List<Map<String, Object>>) department.get("levels"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void fillDepartmentLevels(List<Map<String, Object>> levels) {
        for (Map<String, Object> level : levels) {
            if(((List)(level.get("directions"))).size() == 0) continue;
            cell = row.createCell(1);
            cell.setCellValue(new HSSFRichTextString(level.get("level").toString()));
            setAlignmentCenter(createCellStyle(), cell);
            int rowspan = getLevelRowspan(level);
            mergeRows(rowspan, 1, 1);

            fillLevelDirection((List<Map<String, Object>>) level.get("directions"));
        }
    }

    private void fillLevelDirection(List<Map<String, Object>> directions) {

        for (Map<String, Object> direction : directions) {
            if(((List)(direction.get("classess"))).size() == 0) continue;
            cell = row.createCell(2);
            cell.setCellValue(new HSSFRichTextString(direction.get("directionName").toString()));
            setAlignmentCenter(createCellStyle(), cell);
            int rowspan = getDirectionRowspan(direction);
            mergeRows(rowspan, 2, 2);

            fillDirectionClassess((List<Map<String, Object>>) direction.get("classess"));
        }
    }

    private void fillDirectionClassess(List<Map<String, Object>> classess) {

        for (Map<String, Object> classes : classess) {
            int column = 3;
            cell = row.createCell(column++);
            cell.setCellValue(new HSSFRichTextString(classes.get("classesName").toString()));
            Map<String,Integer>  reportCount = ((StudentInfoReportStatistic) classes.get("reportCount")).getStatisticCount();
            for (String key : types) {
                cell = row.createCell(column++);
                cell.setCellValue(new HSSFRichTextString(reportCount.get(key).toString()));
            }

            row = sheet.createRow(++rowIndex);
        }
    }

    private void mergeRows(int rowspan, int firstCol, int lastCol) {
        if (rowspan >= 2)
            sheet.addMergedRegion(new CellRangeAddress(rowIndex, rowIndex + rowspan - 1, firstCol, lastCol));
    }

    private int getDepartmentRowspan(Map<String, Object> department) {
        int result = 0;

        for (Map<String, Object> level : (List<Map<String, Object>>) department.get("levels"))
            result += getLevelRowspan(level);

        return result;
    }

    private int getLevelRowspan(Map<String, Object> level) {
        int result = 0;

        for (Map<String, Object> direction : (List<Map<String, Object>>) level.get("directions"))
            result += getDirectionRowspan(direction);

        return result;
    }

    private int getDirectionRowspan(Map<String, Object> direction) {
        return ((List) (direction.get("classess"))).size();
    }


}
