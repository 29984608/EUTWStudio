package com.thoughtWorks.util.reportUtil;

import com.thoughtWorks.util.excelUtil.ExcelReportUtil;
import org.apache.poi.hssf.usermodel.*;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.util.CellRangeAddress;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.*;

public class NewStudentRegisterReportUtil extends ExcelReportUtil {
    @Override
    protected void writeHeaders(HSSFSheet sheet, Map<String, String> headers) {
        HSSFRow row = sheet.createRow(1);
        Map<String, String> params = new LinkedHashMap<>();
        params.put("fenyuan", "分院：");
        params.put("professionName", "专业：");
        params.put("classesName", "班级：");
        params.put("no", "学号：");
        params.put("in_time", "入学时间：");
        Set<String> keys = params.keySet();
        int columnIndex = 0;
        for (String key : keys) {
            HSSFCell cell = row.createCell(columnIndex++);
            cell.setCellValue(new HSSFRichTextString(params.get(key)));
            cell = row.createCell(columnIndex++);
            cell.setCellValue(new HSSFRichTextString(headers.get(key)));
        }


    }

    @Override
    protected void writeCellData(HSSFSheet sheet, List<Map<String, Object>> dataset, HSSFWorkbook workbook) {
        try {
            sheet.setColumnWidth((short) 3, (short) 4000);
            sheet.setColumnWidth((short) 5, (short) 4500);
            sheet.setColumnWidth((short) 7, (short) 4500);
            sheet.setColumnWidth((short) 10, (short) 2500);
            setBasicInformation(sheet, dataset, workbook);

            setOwnExperience(sheet, dataset);

            setFamilyInformation(sheet, dataset);

            setDefaultRowHeight(sheet);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void setFamilyInformation(HSSFSheet sheet, List<Map<String, Object>> dataset) {
        HSSFCell cell;
        int rowIndex = 13;
        HSSFRow row = sheet.createRow(rowIndex);

        cell = row.createCell(0);
        CellStyle cellStyle = createCellStyle();
        setFontSize(cellStyle,(short)14);
        setAlignMentCenter(cellStyle);
        cell.setCellStyle(cellStyle);
        cell.setCellValue(new HSSFRichTextString("直系亲属或主要社会关系情况:"));
        sheet.addMergedRegion(new CellRangeAddress(rowIndex, rowIndex, 0, 10));

        String[] params = {"称呼:", "姓名:", "政治面貌:", "职务:", "工作单位:", "联系电话:"};
        row = sheet.createRow(++rowIndex);
        int columnIndex = 0;
        for (int i = 0; i < params.length; ++i) {
            if (i == 4) {
                cell = row.createCell(columnIndex);
                cell.setCellValue(new HSSFRichTextString(params[i]));
                sheet.addMergedRegion(new CellRangeAddress(rowIndex, rowIndex, columnIndex, columnIndex + 5));
                columnIndex += 6;
            } else {
                cell = row.createCell(columnIndex);
                cell.setCellValue(new HSSFRichTextString(params[i]));
                ++columnIndex;
            }
        }
        for (int j = 0; j < 4; ++j) {
            row = sheet.createRow(++rowIndex);
            columnIndex = 0;
            for (int i = 0; i < params.length; ++i) {
                if (i == 4) {
                    cell = row.createCell(columnIndex);
                    cell.setCellValue(new HSSFRichTextString());
                    sheet.addMergedRegion(new CellRangeAddress(rowIndex, rowIndex, columnIndex, columnIndex + 5));
                    columnIndex += 6;
                } else {
                    cell = row.createCell(columnIndex);
                    cell.setCellValue(new HSSFRichTextString());
                    ++columnIndex;
                }
            }
        }
    }

    private void setOwnExperience(HSSFSheet sheet, List<Map<String, Object>> dataset) {
        HSSFCell cell;
        int rowIndex = 7;
        HSSFRow row = sheet.createRow(rowIndex);

        cell = row.createCell(0);
        CellStyle cellStyle = createCellStyle();
        setFontSize(cellStyle,(short)14);
        setAlignMentCenter(cellStyle);
        cell.setCellStyle(cellStyle);
        cell.setCellValue(new HSSFRichTextString("本人学历及社会经历(从小学起)"));
        sheet.addMergedRegion(new CellRangeAddress(rowIndex, rowIndex, 0, 10));

        String[] params = {"自何年何月", "自何年何月", "在何地何校或和单位学习或工作，任何职", "证明人"};
        row = sheet.createRow(++rowIndex);
        int columnIndex = 0;
        for (int i = 0; i < params.length; ++i) {
            if (i == 2) {
                cell = row.createCell(columnIndex);
                cell.setCellValue(new HSSFRichTextString(params[i]));
                sheet.addMergedRegion(new CellRangeAddress(rowIndex, rowIndex, columnIndex, columnIndex + 5));
                columnIndex += 6;
            } else if (i == 3) {
                cell = row.createCell(columnIndex);
                cell.setCellValue(new HSSFRichTextString(params[i]));
                ++columnIndex;
            } else {
                cell = row.createCell(columnIndex);
                cell.setCellValue(new HSSFRichTextString(params[i]));
                sheet.addMergedRegion(new CellRangeAddress(rowIndex, rowIndex, columnIndex, columnIndex + 1));
                columnIndex += 2;
            }
        }
        for (int j = 0; j < 4; ++j) {
            row = sheet.createRow(++rowIndex);
            columnIndex = 0;
            for (int i = 0; i < params.length; ++i) {
                if (i == 2) {
                    cell = row.createCell(columnIndex);
                    cell.setCellValue(new HSSFRichTextString());
                    sheet.addMergedRegion(new CellRangeAddress(rowIndex, rowIndex, columnIndex, columnIndex + 5));
                    columnIndex += 6;
                } else if (i == 3) {
                    cell = row.createCell(columnIndex);
                    cell.setCellValue(new HSSFRichTextString());
                    ++columnIndex;
                } else {
                    cell = row.createCell(columnIndex);
                    cell.setCellValue(new HSSFRichTextString());
                    sheet.addMergedRegion(new CellRangeAddress(rowIndex, rowIndex, columnIndex, columnIndex + 1));
                    columnIndex += 2;
                }
            }
        }
    }

    private void setBasicInformation(HSSFSheet sheet, List<Map<String, Object>> dataset, HSSFWorkbook workbook) {
        Map<String, Object> data = dataset.get(0);
        int rowIndex = 2;

        setHeadImage(sheet, data, workbook);

        // the second row data
        Map<String, String> params = new LinkedHashMap<>();
        params.put("studentName", "姓名:");
        params.put("gender", "性别:");
        params.put("born", "出生年月:");
        params.put("famous_family", "民族:");
        params.put("is_marry", "婚否:");
        setBasicInformationRows(sheet, rowIndex, params, data);

        // the third row data
        ++rowIndex;
        params.clear();
        params.put("origin_address", "籍贯:");
        params.put("political_status", "政治面貌:");
        params.put("culture_high", "文化程度:");
        params.put("student_classify", "学生类别:");
        setBasicInformationThirdRow(sheet, rowIndex, params, data);

        // the forth row data
        ++rowIndex;
        params.clear();
        params.put("actual_address", "家庭住址:");
        params.put("family_zip_code", "邮政编码:");
        params.put("family_phone", "电话:");
        setBasicInformationForthRow(sheet, rowIndex, params, data);

        // the fifth row data
        ++rowIndex;
        params.clear();
        params.put("own_experience", "何时何地经何人介绍加入何党派或团体组织:");
        setBasicInformationFifthOrSixthRow(sheet, rowIndex, params, data);

        // the sixth row data
        ++rowIndex;
        params.clear();
        params.put("own_punishment", "何时何地因何原因受过何奖励或处分:");
        setBasicInformationFifthOrSixthRow(sheet, rowIndex, params, data);
    }

    private void setHeadImage(HSSFSheet sheet, Map<String, Object> data, HSSFWorkbook workbook) {
        BufferedImage bufferImg;
        try {
            ByteArrayOutputStream byteArrayOut = new ByteArrayOutputStream();
            bufferImg = ImageIO.read(new File(data.get("headImage").toString()));
            ImageIO.write(bufferImg, "jpg", byteArrayOut);

            HSSFPatriarch patriarch = sheet.createDrawingPatriarch();
            HSSFClientAnchor anchor = new HSSFClientAnchor(0, 0, 0, 0, (short) 10, 1, (short) 11, 5);
            patriarch.createPicture(anchor, workbook.addPicture(byteArrayOut.toByteArray(), HSSFWorkbook.PICTURE_TYPE_JPEG));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    private void setBasicInformationFifthOrSixthRow(HSSFSheet sheet, int rowIndex, Map<String, String> params, Map<String, Object> dataset) {
        HSSFCell cell;
        String key = params.keySet().iterator().next();
        HSSFRow row = sheet.createRow(rowIndex);

        cell = row.createCell(0);
        cell.setCellValue(new HSSFRichTextString(params.get(key)));
        sheet.addMergedRegion(new CellRangeAddress(rowIndex, rowIndex, 0, 4));
        cell = row.createCell(5);
        cell.setCellValue(new HSSFRichTextString(dataset.get(key) == null ? "" : dataset.get(key) + ""));
        sheet.addMergedRegion(new CellRangeAddress(rowIndex, rowIndex, 5, 10));
    }

    private void setBasicInformationForthRow(HSSFSheet sheet, int rowIndex, Map<String, String> params, Map<String, Object> dataset) {
        HSSFCell cell;
        int columnIndex = 0;
        Set<String> keys = params.keySet();
        HSSFRow row = sheet.createRow(rowIndex);

        for (String key : keys) {
            cell = row.createCell(columnIndex++);
            cell.setCellValue(new HSSFRichTextString(params.get(key)));
            if ("actual_address".equals(key)) {
                cell = row.createCell(columnIndex);
                cell.setCellValue(new HSSFRichTextString(dataset.get(key) == null ? "" : dataset.get(key) + ""));
                sheet.addMergedRegion(new CellRangeAddress(rowIndex, rowIndex, columnIndex, columnIndex + 5));
                columnIndex += 5;
            } else {
                cell = row.createCell(columnIndex++);
                cell.setCellValue(new HSSFRichTextString(dataset.get(key) == null ? "" : dataset.get(key) + ""));
            }

        }
    }

    private void setBasicInformationThirdRow(HSSFSheet sheet, int rowIndex, Map<String, String> params, Map<String, Object> dataset) {
        HSSFCell cell;
        int columnIndex = 0;
        Set<String> keys = params.keySet();
        HSSFRow row = sheet.createRow(rowIndex);

        for (String key : keys) {
            cell = row.createCell(columnIndex++);
            cell.setCellValue(new HSSFRichTextString(params.get(key)));
            cell = row.createCell(columnIndex++);
            cell.setCellValue(new HSSFRichTextString(dataset.get(key) == null ? "" : dataset.get(key) + ""));
            if ("origin_address".equals(key) || "student_classify".equals(key)) {
                sheet.addMergedRegion(new CellRangeAddress(rowIndex, rowIndex, columnIndex - 1, columnIndex));
                ++columnIndex;
            }
        }
    }

    private void setBasicInformationRows(HSSFSheet sheet, int rowIndex, Map<String, String> params, Map<String, Object> dataset) {
        HSSFCell cell;
        int columnIndex = 0;
        HSSFRow row = sheet.createRow(rowIndex);

        Set<String> keys = params.keySet();
        for (String key : keys) {
            cell = row.createCell(columnIndex++);
            cell.setCellValue(new HSSFRichTextString(params.get(key)));
            cell = row.createCell(columnIndex++);
            cell.setCellValue(new HSSFRichTextString(dataset.get(key) == null ? "" : dataset.get(key) + ""));
        }
    }

    private void setDefaultRowHeight(HSSFSheet sheet) {
        Iterator<Row> rowIterator = sheet.rowIterator();
        rowIterator.next();
        while (rowIterator.hasNext()) {
            rowIterator.next().setHeightInPoints(20);
        }
    }
}
