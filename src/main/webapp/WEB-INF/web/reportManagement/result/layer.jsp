<%@ page contentType="text/html; charset=UTF-8" %>
<script id="list-tpl" type="text/html">
    {{# layui.each(d.students, function(index, item){ }}
    <tr>
        <td>{{ item.departmentName}}</td>
        <td>{{ item.level}}</td>
        <td>{{ item.directionName}}</td>
        <td>{{ item.classesName}}</td>
        <td>{{ item.no}}</td>
        <td>{{ item.studentName}}</td>
        <td>
            <%--<shiro:hasPermission name="communication:delete">--%>
            <button class="layui-btn layui-btn-mini  " onclick="resultReport.preview('{{ item.no}}')">
                <i class="layui-icon">&#xe60a;</i>查看成绩
            </button>
            <%--</shiro:hasPermission>--%>
        </td>
    </tr>
    {{# }); }}

</script>
<div id="preview" style="display: none;width: auto;margin-top: 20px">
    <button class="layui-btn layui-btn-mini  " onclick="exportPDF()">
        <i class="layui-icon">&#xe60a;</i>导出 PDF
    </button>
    <section class="larry-grid" >
        <div class="larry-personal" id="container" style="height: 1600px;width: 83%">
            <div style="margin:20px 5%;height: auto">
                <div>
                    <h2 style="color: #20a1a1;text-align: center;font-weight: bold;padding: 15px">
                    <span>
                        <img src="${baseurl}/images/public/logo.png" style="width: 16%;height: 5%">
                    </span>西安欧亚学院学生成绩单</h2>
                    <fieldset class="layui-elem-field layui-field-title" style="margin:5px 1px">
                    </fieldset>
                    <table style="width: 90%">
                        <tr>
                            <td>姓名: <span id="name"></span></td>
                            <td>性别: <span id="gender"></span></td>
                            <td>名族: <span id="famous_family"></span></td>
                            <td>籍贯: <span id="address"></span></td>
                            <td>学历: 专科</td>
                            <td rowspan="3">
                                <img id="headImg" src="${baseurl}/images/public/as.png" width="100px" height="150px">
                            </td>
                        </tr>
                        <tr>
                            <td>学号: <span id="no"></span></td>
                            <td>政治面貌: <span id="political"></span></td>
                            <td colspan="3">身份证号: <span id="idcard"></span></td>
                        </tr>
                        <tr>
                            <td>专业: <span id="profession"></span></td>
                            <td>方向: <span id="direction"></span></td>
                            <td colspan="3">入学时间: <span id="in_school"></span></td>
                        </tr>
                    </table>

                    <div style="float: left;width: 50%;">
                        <table class="layui-table" lay-even="" lay-skin="nob"
                              >
                            <colgroup>
                                <col width="20%">
                                <col width="15%">
                                <col width="35%">
                                <col width="15%">
                                <col width="15%">
                                <col>
                            </colgroup>
                            <thead>
                            <tr style="color: #20a1a1;border:2px solid #e0e0e0;border-left: none">
                                <th>时间</th>
                                <th>属性</th>
                                <th>课程</th>
                                <th>学分</th>
                                <th>成绩</th>
                            </tr>
                            </thead>
                            <tbody id="left_result">

                            </tbody>
                        </table>
                    </div>
                    <div style="float: left;width: 50%">
                        <table class="layui-table" lay-even="" lay-skin="nob"
                               >
                            <colgroup>
                                <col width="20%">
                                <col width="15%">
                                <col width="35%">
                                <col width="15%">
                                <col width="15%">
                                <col>
                            </colgroup>
                            <thead>
                            <tr style="color: #20a1a1;border:2px solid #e0e0e0;border-right: none">
                                <th>时间</th>
                                <th>属性</th>
                                <th>课程</th>
                                <th>学分</th>
                                <th>成绩</th>
                            </tr>
                            </thead>
                            <tbody id="right_result">

                            </tbody>

                        </table>
                    </div>
                    <div style="float: left;width: 100%">
                        <fieldset class="layui-elem-field layui-field-title" style="margin: 5px;">
                        </fieldset>
                        <p style="color: #20a1a1">必修/实修&nbsp;&nbsp;&nbsp;&nbsp
                            108 / <span id="compulsory_score">75</span>
                            &nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp
                            选修/实修&nbsp;&nbsp;&nbsp;&nbsp8/<span id="elective_score">3</span></p>
                        <fieldset class="layui-elem-field layui-field-title" style="margin-top: 5px;">
                        </fieldset>
                        <img src="${baseurl}/images/public/logo.png" style="width: 16%;height: 5%;float: right">
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>