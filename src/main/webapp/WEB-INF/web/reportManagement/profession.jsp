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
<section class=" layui-form">
    <div class="larry-personal">
        <div class="layui-tab">
            <button class="layui-btn layui-btn-mini" style="float: left" onclick="profession.exportExcel()"><i class="layui-icon">&#xe61e;</i>导出
                EXCEl
            </button>
            <div id="container" class="layui-tab-content larry-personal-body clearfix mylog-info-box"
                 style="background: #fff;width: 100%;height: 100%;margin: 5px 0px">

                <div style="text-align: center;font-size: 20px;font-weight: bold">高职学院专业人数统计表
                    <span style="font-size: 13px;margin-left: 40px">统计日期:<spqn id="time">2017-6-3 12:12:21</spqn></span>
                </div>
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
    layui.use(['jquery', 'layer'], function () {
        window.jQuery = window.$ = layui.jquery;
        window.layer = layui.layer;


        profession = {
            list: function () {
                $.post(baseUrl + "/professionReport/list", function (data) {
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
            exportExcel: function () {
                location.href = baseUrl + "/professionReport/exportExcel";
            },
            showPage: function (data) {
                let index = 0;
                let _html = "";
                let totalCount = 0;
                data.forEach(department => {
                    let littleCount = 0;
                    let professions = department.professions;
                    let levels = professions[0].levels;

                    _html += `
                     <tr>
                        <th>` + (++index) + `</th>
                        <th rowspan="` + professions.length + `">` + department.departmentName + `</th>
                        <th>` + professions[0].professionName + `</th>
                        `;
                    for (let j = 0; j < levels.length; ++j) {
                        _html += `<th>` + levels[j].count + `</th>`;
                        littleCount += levels[j].count;
                    }
                    _html += ` </tr>`;

                    for (let i = 1; i < professions.length; ++i) {
                        let profession = professions[i];
                        levels = profession.levels;
                        _html += `
                             <tr>
                                <th>` + (++index) + `</th>
                                <th>` + profession.professionName + `</th>
                          `;
                        for (let j = 0; j < levels.length; ++j) {
                            _html += `<th>` + levels[j].count + `</th>`;
                            littleCount += levels[j].count;
                        }
                        _html += ` </tr>`;
                    }
                    _html += `<tr>
                         <th>` + (++index) + `</th>
                          <th style='font-weight: bold'>小计</th>
                          <th>` + littleCount + `</th>
                          <th></th>
                          <th></th>
                          <th></th>
                    </tr>`;
                    totalCount += littleCount;
                });
                _html += `<tr>
                         <th>` + (++index) + `</th>
                          <th style='font-weight: bold'>总计</th>
                          <th>` + totalCount + `</th>
                          <th></th>
                          <th></th>
                          <th></th>
                    </tr>`;
                $("#report").html(_html);
            },
            loadTableHead: function () {
                $("#head").html("");
                $("#head").append(`
                        <td>序号</td>
                        <td>系</td>
                        <td>专业</td>
                `);
                getSearchLevels().forEach(level => $("#head").append(`<td>` + level + `</td>`));
            }
        }
        $(function () {
            profession.list();
        })
    })

</script>
</html>
