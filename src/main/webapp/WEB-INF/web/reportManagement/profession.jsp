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
<section class="larry-grid layui-form">
    <div class="larry-personal">
        <div class="layui-tab">
            <blockquote class="layui-elem-quote mylog-info-tit" style="padding: 10px 20px;">
                <div class="layui-inline">
                    <div class="layui-input-inline">
                        <input type="number" name="level" id="level_search" lay-verify="title" autocomplete="off"
                               placeholder="请输入一个级别" class="layui-input">
                    </div>
                      <button class="layui-btn" onclick="communication.list()"><i class="layui-icon">&#xe615;</i>查询报表</button>
                </div>
                <button style="float: right;margin: 0 20px" class="layui-btn" onclick="printPdf()"><i class="layui-icon">&#xe621;</i>导出 PDF</button>
                <button class="layui-btn" style="float: right" onclick="printPdf()"><i class="layui-icon">&#xe61e;</i>导出 EXCEl</button>
            </blockquote>
            <div class="larry-separate"></div>
            <div class="layui-tab-content larry-personal-body clearfix mylog-info-box" style="margin: 5px 0px">
                <div style="text-align: center;font-size: 20px;font-weight: bold">高职学院专业人数统计表(<span id="level">2017</span>)
                    <span style="font-size: 13px;margin-left: 40px">统计日期:2017-6-3 12:12:21</span></div>
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
                    <tbody>
                    <tr>
                        <th >1</th>
                        <th rowspan="3">金融服务系金融服务系</th>
                        <td>财务管理</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td>财务管理</td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <th >2</th>
                        <td>金融管理</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td>金融管理</td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <th >3</th>
                        <td>投资与理财</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td>投资与理财</td>
                        <td></td>
                        <td></td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</section>
</body>


<script type="text/javascript" src="${baseurl}/public/js/pdf/html2canvas.js"></script>
<script type="text/javascript" src="${baseurl}/public/js/pdf/jspdf.debug.js"></script>
<script type="text/javascript" src="${baseurl}/public/js/pdf/renderPDF.js"></script>
<script type="text/javascript">

    layui.use(['jquery', 'layer', 'element', 'form', 'laytpl'], function () {
        window.jQuery = window.$ = layui.jquery;
        window.layer = layui.layer;
        var element = layui.element(),
            form = layui.form(),
            laytpl = layui.laytpl;
    })
    $(function () {
    });

    function loadLevel() {
        let currentYear = new Date().getFullYear();
        let _html = "";
        for (let i = 0; i < 5; ++i) {
            let next = currentYear++;
            _html += `<option value="` + next + `">` + next + `</option>`;
        }

        return _html;
    }

    function printPdf() {
        renderPDF(document.getElementById("container"), "content", "a4", function () {
        });
    }

</script>


</html>
