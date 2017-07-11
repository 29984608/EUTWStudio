package com.thoughtWorks.util.reportUtil;

import com.thoughtWorks.util.excelUtil.ExcelReportUtil;
import org.apache.poi.hssf.usermodel.*;
import org.apache.poi.ss.util.CellRangeAddress;

import java.util.List;
import java.util.Map;

public class ProfessionReportUtil extends ExcelReportUtil {
    @Override
    protected void writeHeaders(HSSFSheet sheet, Map<String, String> headers) {
        HSSFRow row = sheet.createRow(1);

        String[] keys = {"index", "departmentName", "name", "oldNumber", "turnIn", "turnOut", "name1", "nowNumber", "remark"};
        int columnIndex = 0;
        for (String key : keys) {
            HSSFCell cell = row.createCell(columnIndex++);
            cell.setCellValue(new HSSFRichTextString(headers.get(key)));
        }
    }

    @Override
    protected void writeCellData(HSSFSheet sheet, List<Map<String, Object>> dataset, HSSFWorkbook workbook) {
        try {
            String[] keys = {"name", "oldNumber", "turnIn", "turnOut", "name1", "nowNumber", "remark"};
            sheet.setColumnWidth((short) 1, (short) 5000);
            sheet.setColumnWidth((short) 2, (short) 4500);
            sheet.setColumnWidth((short) 6, (short) 4500);
            int rowIndex = 2;
            for (int i = 0; i < dataset.size(); ++i) {
                Map<String, Object> department = dataset.get(i);
                List<Map<String, String>> children = (List<Map<String, String>>) department.get("children");
                sheet.addMergedRegion(new CellRangeAddress(rowIndex, rowIndex + children.size() - 1, 1, 1));
                for (Map<String, String> data : children) {
                    HSSFRow row = sheet.createRow(rowIndex++);

                    //设置序号
                    HSSFCell cell = row.createCell(0);
                    cell.setCellValue(new HSSFRichTextString(String.valueOf(rowIndex - 2)));

                    //设置系名称
                    cell = row.createCell(1);
                    cell.setCellValue(new HSSFRichTextString(department.get("name").toString()));

                    int columnIndex = 2;
                    for (String key : keys) {
                        cell = row.createCell(columnIndex++);
                        if ("departmentName".equals(key))
                            cell.setCellValue(new HSSFRichTextString(String.valueOf(department.get(key))));
                        else if ("name1".equals(key))
                            cell.setCellValue(new HSSFRichTextString(String.valueOf(data.get("name"))));
                        else
                            cell.setCellValue(new HSSFRichTextString(String.valueOf(data.get(key) == null ? "" : data.get(key))));
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
