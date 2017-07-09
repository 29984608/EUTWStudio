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
            <blockquote class="layui-elem-quote mylog-info-tit" style="padding: 10px 20px;">
                <div class="layui-inline">
                    <div class="layui-input-inline">
                        <input type="number" name="level" id="level_search" lay-verify="title" autocomplete="off"
                               placeholder="请输入一个级别" class="layui-input">
                    </div>
                    <button class="layui-btn" onclick="profession.list()"><i class="layui-icon">&#xe615;</i>查询报表</button>
                </div>
                <button class="layui-btn" style="float: right" onclick="printPdf()"><i class="layui-icon">&#xe61e;</i>导出 EXCEl</button>
            </blockquote>
            <div class="larry-separate"></div>
            <div id="container" class="layui-tab-content larry-personal-body clearfix mylog-info-box"
                 style="background: #fff;width: 100%;height: 100%;margin: 5px 0px">
                <div style="text-align: center;font-size: 20px;font-weight: bold">高职学院专业人数统计表<span
                        id="level">(2017)</span>
                    <span style="font-size: 13px;margin-left: 40px">统计日期:<spqn id="time">2017-6-3 12:12:21</spqn></span></div>
                <table class="layui-table">
                    <colgroup>
                        <col width="60">
                        <col width="160">
                        <col width="160">
                        <col width="110">
                        <col width="110">
                        <col width="110">
                        <col width="160">
                        <col width="110">
                        <col>
                    </colgroup>
                    <thead>
                    <tr>
                        <th>序号</th>
                        <th>系别</th>
                        <th>原录取专业</th>
                        <th>人数</th>
                        <th>转入人数(+)</th>
                        <th>转出人数(-)</th>
                        <th>现专业</th>
                        <th>人数</th>
                        <th>备注</th>
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
<script type="text/javascript">
    let profession;
    layui.use(['jquery', 'layer'], function () {
        window.jQuery = window.$ = layui.jquery;
        window.layer = layui.layer;


        profession = {
            list: function () {
                let level = $("#level_search").val();
                $.post(baseUrl + "/report/professionList", {level: level}, function (data) {
                    if (data.result) {
                        let date = new Date();
                        $("#level").text(level)
                        $("#time").text(date.getFullYear() + " 年 "+(date.getMonth()+1)+" 月 "+date.getDate()+" 日");
                        profession.showPage(data.data);
                    } else {
                        layer.msg(data.msg);
                    }
                })
            },
            showPage: function (data) {
                let index = 0;
                let _html = "";
                data.forEach(department => {
                    let children = department.children;
                    _html += `
                     <tr>
                        <th>` + (++index) + `</th>
                        <th rowspan="` + children.length + `">` + department.name + `</th>
                        <td>` + children[0].name + `</td>
                        <td>` + (children[0].oldNumber == undefined ? 0 : children[0].oldNumber ) + `</td>
                        <td>` + (children[0].turnIn == undefined ? 0 : children[0].turnIn ) + `</td>
                        <td>` + (children[0].turnOut == undefined ? 0 : children[0].turnOut ) + `</td>
                        <td>` + (children[0].name ) + `</td>
                        <td>` + (children[0].nowNumber == undefined ? 0 : children[0].nowNumber ) + `</td>
                        <td></td>
                    </tr>
                    `;
                    for (let j = 1; j < children.length; ++j) {
                        _html += `
                     <tr>
                        <th>` + ((++index) ) + `</th>
                        <td>` + (children[j].name ) + `</td>
                        <td>` + (children[j].oldNumber == undefined ? 0 : children[j].oldNumber ) + `</td>
                        <td>` + (children[j].turnIn == undefined ? 0 : children[j].turnIn ) + `</td>
                        <td>` + (children[j].turnOut == undefined ? 0 : children[j].turnOut ) + `</td>
                        <td>` + (children[j].name ) + `</td>
                        <td>` + (children[j].nowNumber == undefined ? 0 : children[j].nowNumber ) + `</td>
                        <td></td>
                    </tr>
                    `;
                    }
                })
                $("#report").html(_html);
            }
        }
        $(function () {
            profession.list();
        })
    })

</script>
</html>
