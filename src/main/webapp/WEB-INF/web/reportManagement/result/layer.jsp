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
    <section class="larry-grid">
        <div class="larry-personal" style="height: 1600px">
            <div style="margin:20px 5%;height: auto">
                <div>
                    <h2 style="color: #20a1a1;text-align: center;font-weight: bold;padding: 15px">
                    <span>
                        <img src="${baseurl}/images/public/logo.png" style="width: 16%;height: 5%">
                    </span>西安欧亚学院学生成绩单</h2>
                    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 5px;">
                    </fieldset>
                    <table style="width: 90%">
                        <tr>
                            <td>姓名: 张三</td>
                            <td>性别: 男</td>
                            <td>名族: 汉</td>
                            <td>籍贯: 陕西省西安市</td>
                            <td>学历: 专科</td>
                            <td rowspan="3" style="width: 100px">
                                <img style="width: 35mm;height: 53mm" src="${baseurl}/images/public/as.png">
                            </td>
                        </tr>
                        <tr>
                            <td>学号: 12345678932</td>
                            <td>政治面貌: 党员</td>
                            <td colspan="3">身份证号: 610323111122336789</td>
                        </tr>
                        <tr>
                            <td>专业: 房地产经营与管理</td>
                            <td>方向: 房地置业</td>
                            <td colspan="3">入学时间: 2014年9月1日</td>
                        </tr>
                    </table>
                    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 5px;">
                    </fieldset>
                    <div style="float: left;width: 50%;">
                        <table class="layui-table" lay-even="" lay-skin="nob" style="width: 99%">
                            <colgroup>
                                <col width="20%">
                                <col width="15%">
                                <col width="35%">
                                <col width="15%">
                                <col width="15%">
                                <col>
                            </colgroup>
                            <thead>
                            <tr style="color: #20a1a1">
                                <th>时间</th>
                                <th>属性</th>
                                <th>课程</th>
                                <th>学分</th>
                                <th>成绩</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>201412</td>
                                <td>必修</td>
                                <td>形势与政策教育</td>
                                <td>1</td>
                                <td>89</td>
                            </tr>
                            <tr>
                                <td>201412</td>
                                <td>必修</td>
                                <td>形势与政策教育</td>
                                <td>1</td>
                                <td>89</td>
                            </tr>
                            <tr>
                                <td>201412</td>
                                <td>必修</td>
                                <td>形势与政策教育</td>
                                <td>1</td>
                                <td>89</td>
                            </tr>
                            <tr>
                                <td>201412</td>
                                <td>必修</td>
                                <td>形势与政策教育</td>
                                <td>1</td>
                                <td>89</td>
                            </tr>
                            <tr>
                                <td>201412</td>
                                <td>必修</td>
                                <td>形势与政策教育</td>
                                <td>1</td>
                                <td>89</td>
                            </tr>
                            <tr>
                                <td>201412</td>
                                <td>必修</td>
                                <td>形势与政策教育</td>
                                <td>1</td>
                                <td>89</td>
                            </tr>
                            <tr>
                                <td>201412</td>
                                <td>必修</td>
                                <td>形势与政策教育</td>
                                <td>1</td>
                                <td>89</td>
                            </tr>
                            <tr>
                                <td>201412</td>
                                <td>必修</td>
                                <td>形势与政策教育</td>
                                <td>1</td>
                                <td>89</td>
                            <tr>
                                <td>201412</td>
                                <td>必修</td>
                                <td>形势与政策教育</td>
                                <td>1</td>
                                <td>89</td>
                            </tr>
                            <tr>
                                <td>201412</td>
                                <td>必修</td>
                                <td>形势与政策教育</td>
                                <td>1</td>
                                <td>89</td>
                            </tr>
                            <tr>
                                <td>201412</td>
                                <td>必修</td>
                                <td>形势与政策教育</td>
                                <td>1</td>
                                <td>89</td>
                            </tr>
                            <tr>
                                <td>201412</td>
                                <td>必修</td>
                                <td>形势与政策教育</td>
                                <td>1</td>
                                <td>89</td>
                            </tr>
                            <tr>
                                <td>201412</td>
                                <td>必修</td>
                                <td>形势与政策教育</td>
                                <td>1</td>
                                <td>89</td>
                            </tr>
                            <tr>
                                <td>201412</td>
                                <td>必修</td>
                                <td>形势与政策教育</td>
                                <td>1</td>
                                <td>89</td>
                            </tr>
                            <tr>
                                <td>201412</td>
                                <td>必修</td>
                                <td>形势与政策教育</td>
                                <td>1</td>
                                <td>89</td>
                            </tr>
                            <tr>
                                <td>201412</td>
                                <td>必修</td>
                                <td>形势与政策教育</td>
                                <td>1</td>
                                <td>89</td>
                            <tr>
                                <td>201412</td>
                                <td>必修</td>
                                <td>形势与政策教育</td>
                                <td>1</td>
                                <td>89</td>
                            </tr>
                            <tr>
                                <td>201412</td>
                                <td>必修</td>
                                <td>形势与政策教育</td>
                                <td>1</td>
                                <td>89</td>
                            </tr>
                            <tr>
                                <td>201412</td>
                                <td>必修</td>
                                <td>形势与政策教育</td>
                                <td>1</td>
                                <td>89</td>
                            </tr>
                            <tr>
                                <td>201412</td>
                                <td>必修</td>
                                <td>形势与政策教育</td>
                                <td>1</td>
                                <td>89</td>
                            </tr>
                            <tr>
                                <td>201412</td>
                                <td>必修</td>
                                <td>形势与政策教育</td>
                                <td>1</td>
                                <td>89</td>
                            </tr>
                            <tr>
                                <td>201412</td>
                                <td>必修</td>
                                <td>形势与政策教育</td>
                                <td>1</td>
                                <td>89</td>
                            </tr>
                            <tr>
                                <td>201412</td>
                                <td>必修</td>
                                <td>形势与政策教育</td>
                                <td>1</td>
                                <td>89</td>
                            </tr>
                            <tr>
                                <td>201412</td>
                                <td>必修</td>
                                <td>形势与政策教育</td>
                                <td>1</td>
                                <td>89</td>
                            </tr>
                            <tr>
                                <td>201412</td>
                                <td>必修</td>
                                <td>形势与政策教育</td>
                                <td>1</td>
                                <td>89</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div style="height: 1020px;background-color: #0C0C0C;float: left;width: 1px;margin-top: 10px"></div>
                    <div style="float: right;width: 49%">
                        <table class="layui-table" lay-even="" lay-skin="nob" style="width: 99%">
                            <colgroup>
                                <col width="20%">
                                <col width="15%">
                                <col width="35%">
                                <col width="15%">
                                <col width="15%">
                                <col>
                            </colgroup>
                            <thead>
                            <tr style="color: #20a1a1">
                                <th>时间</th>
                                <th>属性</th>
                                <th>课程</th>
                                <th>学分</th>
                                <th>成绩</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>201412</td>
                                <td>必修</td>
                                <td>形势与政策教育</td>
                                <td>1</td>
                                <td>89</td>
                            </tr>
                            <tr>
                                <td>201412</td>
                                <td>必修</td>
                                <td>形势与政策教育</td>
                                <td>1</td>
                                <td>89</td>
                            </tr>
                            <tr>
                                <td>201412</td>
                                <td>必修</td>
                                <td>形势与政策教育</td>
                                <td>1</td>
                                <td>89</td>
                            </tr>
                            <tr>
                                <td>201412</td>
                                <td>必修</td>
                                <td>形势与政策教育</td>
                                <td>1</td>
                                <td>89</td>
                            </tr>

                            </tbody>

                        </table>
                    </div>
                    <div style="float: left;width: 100%">
                        <fieldset class="layui-elem-field layui-field-title" style="margin: 5px;">
                        </fieldset>
                        <p style="color: #20a1a1">必修/实修&nbsp;&nbsp;&nbsp;&nbsp90/75&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp选修/实修&nbsp;&nbsp;&nbsp;&nbsp8/3</p>
                        <fieldset class="layui-elem-field layui-field-title" style="margin-top: 5px;">
                        </fieldset>
                        <img src="${baseurl}/images/public/logo.png" style="width: 16%;height: 5%;float: right">
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>