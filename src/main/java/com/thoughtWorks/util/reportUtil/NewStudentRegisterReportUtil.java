package com.thoughtWorks.util.reportUtil;

import com.thoughtWorks.util.excelUtil.ExcelReportUtil;
import org.apache.poi.hssf.usermodel.*;
import org.apache.poi.ss.util.CellRangeAddress;

import java.util.List;
import java.util.Map;

public class NewStudentRegisterReportUtil extends ExcelReportUtil {
    @Override
    protected void writeHeaders(HSSFSheet sheet, Map<String, String> headers) {
        HSSFRow row = sheet.createRow(1);

        String[] keys = {"fenyuan", "professionName", "classesName", "no", "in_time"};
        int columnIndex = 0;
        for (String key : keys) {
            HSSFCell cell = row.createCell(columnIndex++);
            cell.setCellValue(new HSSFRichTextString("分院："));
            cell = row.createCell(columnIndex++);
            cell.setCellValue(new HSSFRichTextString(key));
        }
    }

    @Override
    protected void writeCellData(HSSFSheet sheet, List<Map<String, Object>> dataset, HSSFWorkbook workbook) {
        try {
            HSSFRow row = null;
            HSSFCell cell = null;

            sheet.setColumnWidth((short) 1, (short) 5000);
            sheet.setColumnWidth((short) 2, (short) 4500);
            sheet.setColumnWidth((short) 6, (short) 4500);
            int rowIndex = 2;

            sheet.addMergedRegion(new CellRangeAddress(1, 1, 1, 1));

            row = sheet.createRow(rowIndex++);
            cell = row.createCell(0);
            cell.setCellValue(new HSSFRichTextString(String.valueOf(rowIndex - 2)));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
