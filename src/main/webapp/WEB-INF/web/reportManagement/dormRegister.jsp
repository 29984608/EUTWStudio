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
            <div class="larry-separate"></div>
            <div id="container" class="layui-tab-content larry-personal-body clearfix mylog-info-box"
                 style="background: #fff;width: 100%;height: 100%;margin: 5px 0px">
                <button class="layui-btn" onclick="profession.exportExcel()"><i class="layui-icon">&#xe61e;</i>导出
                    EXCEl
                </button>
                <div style="text-align: center;font-size: 20px;font-weight: bold">高职学院宿舍人数统计表<span
                        id="level">(2015-2017)</span>
                    <span style="font-size: 13px;margin-left: 40px">统计日期:<spqn id="time"></spqn></span>
                </div>
                <table class="layui-table">
                    <colgroup>
                        <col width="60">
                        <col width="160">
                        <col width="160">
                        <col width="160">
                        <col width="160">
                        <col width="160">
                        <col>
                    </colgroup>
                    <thead>
                    <tr>
                        <th>序号</th>
                        <th>系别</th>
                        <th>住宿类型</th>
                        <th>2015</th>
                        <th>2016</th>
                        <th>2017</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>1</td>
                        <td rowspan="2">金融服务系</td>
                        <td>校内</td>
                        <td>333</td>
                        <td>333</td>
                        <td>333</td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td>校外</td>
                        <td>444</td>
                        <td>444</td>
                        <td>444</td>
                    </tr>
                    <tr>
                    <tr>
                        <td>X</td>
                        <td>合计</td>
                        <td>5000</td>
                        <td>500</td>
                        <td>500</td>
                        <td>500</td>
                    </tr>
                    </tr>

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
                $.post(baseUrl + "/dormRegister/dormList", function (data) {
                    let date = new Date();
                    $("#time").text(date.getFullYear() + " 年 " + (date.getMonth() + 1) + " 月 " + date.getDate() + " 日");
                    console.log(data)

                })
            },
            exportExcel: function () {

            },
            showPage: function (data) {
                let index = 0;
                let _html = "";
                data.forEach(department => {
                    let children = department.children;
                    _html += `<tr></tr>`;

                    for (let j = 1; j < children.length; ++j) {
                        _html += `<tr></tr>`;
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
