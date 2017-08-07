<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../../public/tag.jsp" %>
<html>
<head>
    <title></title>
    <script type="text/javascript" src="${baseurl}/public/common/js/jquery-3.2.0.min.js"></script>
    <script src="${baseurl}/public/common/layui/layui.js" charset="utf-8"></script>
    <link rel="stylesheet" href="${baseurl}/public/common/layui/css/layui.css" media="all">
    <link rel="stylesheet" type="text/css" href="${baseurl}/public/common/layui/css/layui.css" media="all">
    <link rel="stylesheet" type="text/css" href="${baseurl}/public/common/bootstrap/css/bootstrap.min.css" media="all">
    <link rel="stylesheet" type="text/css" href="${baseurl}/public/common/css/global.css" media="all">
    <link rel="stylesheet" type="text/css" href="${baseurl}/public/css/common.css" media="all">
    <link rel="stylesheet" type="text/css" href="${baseurl}/public/css/personal.css" media="all">
    <%--时间轴--%>
    <link rel="stylesheet" href="${baseurl}/public/css/timeAsix/css/screen.css" type="text/css" media="screen">
    <link rel="stylesheet" href="${baseurl}/public/css/timeAsix/css/responsive.css" type="text/css" media="screen">
    <link rel="stylesheet" href="${baseurl}/public/css/timeAsix/inc/colorbox.css" type="text/css" media="screen">

</head>
<body>

<blockquote class="layui-elem-quote mylog-info-tit">
    <form class="layui-form layui-form-pane">
        <label class="layui-form-label ">学级</label>
        <div class="layui-input-inline">
            <select name ="_level" lay-filter="_level" id="_level">
                <option value="2016">2016</option>
                <option value="2015">2015</option>
                <option value="2014">2014</option>
            </select>
        </div>
    </form>

</blockquote>

<section class=" layui-form">
    <div class="larry-personal">
        <div class="layui-tab">
<shiro:hasPermission name="turnProfessional:exportExcel">
            <button class="layui-btn layui-btn-mini" style="float: left" onclick="profession.exportExcel()"><i
                    class="layui-icon">&#xe61e;</i>导出
                EXCEl
            </button>
</shiro:hasPermission>
            <div id="container" class="layui-tab-content larry-personal-body clearfix mylog-info-box"
                 style="background: #fff;width: 100%;height: 100%;margin: 5px 0px">
                <div style="text-align: center;font-size: 20px;font-weight: bold">
                    <span id="level_time"></span>级学生转专业信息汇总表
                    <span style="font-size: 13px;margin-left: 40px">统计日期:<spqn
                            id="time">0000-00-00 00:00:00</spqn></span><br>
                </div>
                <span style="font-size: 18px;font-weight: bold ;margin-left: 10px">分院：高职学院</span>

                <table class="layui-table">
                    <thead>
                    <tr id="head">

                    </tr>
                    </thead>
                    <tbody id="report">

                    </tbody>
                </table>
            </div>
        </div>
    </div>
</section>
</body>
<script type="text/javascript" src="${baseurl}/public/common/layui/layui.js"></script>
<script type="text/javascript" src="${baseurl}/js/searchJs.js"></script>

<script type="text/javascript">
    let profession;
    layui.use(['jquery', 'layer', 'element', 'laypage', 'form', 'laytpl', 'tree', 'layedit'], function () {
        window.jQuery = window.$ = layui.jquery;
        window.layer = layui.layer;

        var form = layui.form()

        profession = {
            list: function (level) {
                $.post(baseUrl + "/turnProfessional/list",{level:level}, function (data) {
                    if (data.result) {

                        let date = new Date();
                        $("#time").text(date.getFullYear() + " 年 " + (date.getMonth() + 1) + " 月 " + date.getDate() + " 日");
                        profession.loadTableHead();
                        profession.showPage(data.data);
                    } else {
                        layer.msg(data.msg);
                    }
                })
            },
            exportExcel: function (level) {
                let _level = $("#_level").val();
                location.href = baseUrl + "/turnProfessional/exportExcel?level="+_level+"";
            },
            showPage: function (data) {
                let _html = "";
                data.forEach((item, index) => {
                    _html += `<tr>
                         <th>` + (index+1) + `</th>
                          <th>` + item.no + `</th>
                          <th>` + item.name + `</th>
                          <th>专科</th>
                          <th>` + item.originProfession + `</th>
                          <th>` + item.originProfessionId + `</th>
                          <th>` + item.profession + `</th>
                          <th>` + item.professionId + `</th>
                    </tr>`;
                })
                $("#report").html(_html);
            },
            loadTableHead: function () {
                $("#head").html("");
                $("#head").append(`
                        <td>序号</td>
                        <td>考生号</td>
                        <td>姓名</td>
                        <td>层次</td>
                        <td>录取专业</td>
                        <td>专业代码</td>
                        <td>现专业</td>
                        <td>专业代码</td>
                `);
            }
        }
        $(function () {

            $("#_level").html("")
            getSearchLevels().forEach(level => $("#_level").append( `<option value="`+level+`">`+level+`</option>`))
            profession.list(getSearchLevels()[0]);
            $("#level_time").text("").append(getSearchLevels()[0])

            form.on('select(_level)', function (data) {
                profession.list(data.value);
                $("#level_time").text("").append(data.value)
            });
        })
    })

</script>
</html>
