package com.thoughtWorks.util.excelUtil;

import com.thoughtWorks.util.DateUtil;
import org.apache.poi.hssf.usermodel.*;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.XSSFFont;

import java.io.*;
import java.util.*;

public class ExcelReportUtil {

    /**
     * @param headers 表格属性列名数组
     * @param dataset 需要显示的数据集合,集合中一定要放置符合javabean风格的类的对象。此方法支持的
     *                javabean属性的数据类型有基本数据类型及String,Date,String[],Double[]
     * @param title   大标题
     */
    public static void exportExcel(Map<String, String> headers, List<Map<String, Object>> dataset,
                                   File file, String title) throws FileNotFoundException {
        OutputStream out = new FileOutputStream(file);

        // 声明一个工作薄
        HSSFWorkbook workbook = new HSSFWorkbook();
        // 生成一个表格
        HSSFSheet sheet = workbook.createSheet();

        write2Sheet(sheet, headers, dataset, title, workbook);

        try {
            workbook.write(out);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    /**
     * 每个sheet的写入
     *
     * @param sheet   页签
     * @param headers 表头
     * @param dataset 数据集合
     * @param title   大标题
     */
    private static void write2Sheet(HSSFSheet sheet, Map<String, String> headers, List<Map<String, Object>> dataset,
                                    String title, HSSFWorkbook workbook) {
        HSSFCellStyle titleStyle = createTitleStyle(workbook);
        writeTitle(sheet, title, titleStyle);

        writeHeaders(sheet, headers);

        writeCellData(sheet, dataset,  workbook);

    }

    private static void writeTitle(HSSFSheet sheet, String title, HSSFCellStyle titleStyle) {
        HSSFRow rowTitle = sheet.createRow(0);

        HSSFCell cell = rowTitle.createCell(0);
        cell.setCellStyle(titleStyle);
        cell.setCellValue(new HSSFRichTextString(title));

        sheet.addMergedRegion(new CellRangeAddress(0, 0, 0, 7));
        cell = rowTitle.createCell(8);
        cell.setCellValue(DateUtil.nowDateToYMDSMS());

    }

    private static void writeHeaders(HSSFSheet sheet, Map<String, String> headers) {
        HSSFRow row = sheet.createRow(1);

        String[] keys = {"index", "departmentName", "name", "oldNumber", "turnIn", "turnOut", "name1", "nowNumber", "remark"};
        int columnIndex = 0;
        for (String key : keys) {
            HSSFCell cell = row.createCell(columnIndex++);
            cell.setCellValue(new HSSFRichTextString(headers.get(key)));
        }

    }

    private static void writeCellData(HSSFSheet sheet, List<Map<String, Object>> dataset, HSSFWorkbook workbook) {
        try {
            String[] keys = { "name", "oldNumber", "turnIn", "turnOut", "name1", "nowNumber", "remark"};
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
                        else cell.setCellValue(new HSSFRichTextString(String.valueOf(data.get(key) == null ? "" : data.get(key))));
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private static HSSFCellStyle createTitleStyle(HSSFWorkbook workbook) {
        HSSFCellStyle cellStyle = workbook.createCellStyle();

        HSSFFont hssfFont = workbook.createFont();
        hssfFont.setFontHeightInPoints((short) 20);
        hssfFont.setFontName("楷体");
        hssfFont.setBoldweight(Font.BOLDWEIGHT_BOLD);

        cellStyle.setFont(hssfFont);
        cellStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);

        return cellStyle;
    }
}
