<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../../../public/tag.jsp" %>

<html>
<head>
    <meta charset="utf-8">
    <title></title>
    <script type="text/javascript" src="${baseurl}/public/common/js/jquery-3.2.0.min.js"></script>
    <link rel="stylesheet" type="text/css" href="${baseurl}/public/common/layui/css/layui.css" media="all">
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
<section class="larry-grid">
    <div class="larry-personal">
        <div class="layui-tab">

            <div class="larry-separate"></div>

            <div id="update" style="background: #fff">
                <div class="container" id="container" style="padding:50px 30px">
                    <h1 style="text-align: center;margin-left: -30px;font-size: 30px; ;">西安欧亚学院高职学院<span id="department"></span><span id="level"></span>级<span id="direction"></span>方向课程学习计划</h1>
                    <div style="margin:40px 0">

                        <table  class="layui-table lay-even " data-name="articleCatData">
                            <thead>
                            <tr>
                                <th>姓名</th>
                                <th>性别</th>
                                <th>籍贯</th>
                                <th>身份证号码</th>
                                <th>专业</th>
                                <th>就业方向</th>
                                <th>政治面貌</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <th id="name"></th>
                                <th id ="gender"></th>
                                <th id="native_place"></th>
                                <th id="idcard"></th>
                                <th id="profession"></th>
                                <th id="direction2"></th>
                                <th id="political_status"></th>
                            </tr>
                            </tbody>
                        </table>
                    </div>

                    <div id="timelineContainer" class="timelineContainer">

                        <div class="timelineToggle"><p><a class="expandAll ">+ 全部展开</a></p></div>

                        <br class="clear">
                        <div id="communication_container">

                        </div>


                        <br class="clear">
                    </div>
                </div>

            </div>
        </div>
    </div>
</section>
</body>
<script type="text/javascript" src="${baseurl}/public/css/timeAsix/inc/colorbox.js"></script>
<script type="text/javascript" src="${baseurl}/public/css/timeAsix/js/timeliner.min.js"></script>
<script>
    $(document).ready(function () {
        $.timeliner({
            startOpen: ['#19550828EX', '#19630828EX']
        });
        $.timeliner({
            timelineContainer: '#timelineContainer_2'
        });
        // Colorbox Modal
        $(".CBmodal").colorbox({
            inline: true,
            initialWidth: 100,
            maxWidth: 682,
            initialHeight: 100,
            transition: "elastic",
            speed: 750
        });
    });
</script>
<script type="text/javascript" src="${baseurl}/public/js/pdf/html2canvas.js"></script>
<script type="text/javascript" src="${baseurl}/public/js/pdf/jspdf.debug.js"></script>
<script type="text/javascript" src="${baseurl}/public/js/pdf/renderPDF.js"></script>
<script type="text/javascript">
    let communication;
    let no;
    layui.use(['jquery', 'layer', 'element','laypage', 'form', 'laytpl'], function () {
        window.jQuery = window.$ = layui.jquery;
        window.layer = layui.layer;
        var element = layui.element(),
            form = layui.form(),
            laytpl = layui.laytpl;

        communication = {
            updateAjax: function (data) {
                $.post(baseUrl + "/communication/updateContent", data, function (data) {
                    layer.msg(data.msg);
                })
            },
            updateContent: function (id, qaId) {
                let contents = "";
                let contentNodes = $("#id" + qaId + "EX").find(".update-contents");
                for (let i = 0; i < contentNodes.length; ++i) {
                    contents += $(contentNodes[i]).val() + "$%$";//Q&A 分隔符
                }
                let data = {
                    id: id,
                    content: contents
                }
                communication.updateAjax(data);
            },
            previewOrUpdate: function (studentNo) {

                $.post(baseUrl + "/communication/communication", {studentNo: studentNo}, function (data) {
                    if (data.result) {
                        $("#department").text(data.data[(data.data.length-1)].department);
                        $("#level").text(data.data[(data.data.length-1)].level);
                        $("#direction").text(data.data[(data.data.length-1)].direction);
                        showCommunicationContents(data.data);
                        $("#name").text(data.data[(data.data.length-1)].name);
                        $("#gender").text(data.data[(data.data.length-1)].gender);
                        $("#native_place").text(data.data[(data.data.length-1)].native_place);
                        $("#idcard").text(data.data[(data.data.length-1)].idcard);
                        $("#profession").text(data.data[(data.data.length-1)].profession);
                        $("#direction2").text(data.data[(data.data.length-1)].direction);
                        $("#political_status").text(data.data[(data.data.length-1)].political_status);
                    } else {
                        layer.msg(data.msg);
                    }
                });
            },
            loadDepartmentOrDirection: function (data, selectId) {
                let _html = ""
                for (let i = 0; i < data.length; ++i) {
                    if (selectId == data[i].id) {
                        _html += `<option selected value="` + data[i].id + `">` + data[i].name + `</option>`;
                    } else {
                        _html += `<option value="` + data[i].id + `">` + data[i].name + `</option>`;
                    }
                }

                return _html;
            }

        };
        $(function () {
            communication.previewOrUpdate('<shiro:principal property="userName"/>');
        });
    });

    function printPdf() {
        pdf(document.getElementById("container"), $("#exportPDFName").text(), "a3");
    }

    function showCommunicationContents(data) {

        let communication = ""
        for (let i = 0; i < data.length-1; ++i) {
            let com = data[i];
            communication += `
            <div class="timelineMajor">
                <h2 class="timelineMajorMarker">
                <span>` + com.time + `</span></h2>
                <dl class="timelineMinor">
                    <dt id="id` + com.id + `">
                    <a id='exportPDFName'>` + com.teacherName + ` - ` + com.direction + ` - ` + com.talkName + `</a></dt>
                    <%--QA 容器--%>
                    <dd class="timelineEvent" id="id` + com.id + `EX" style="display:none;">
                `;
            communication +=   loadPreviewQA(com.contents);
            communication += `</dd></dl></div>`;

        }

        $("#communication_container").html(communication);
    }

    function loadPreviewQA(contents) {
        let QA = "";
        for (let index = 0; index < contents.length; index += 2) {
            QA += `
             <dl class="timelineMinor">
                <dt id="` + index + `"><a style="font-size: 12px;color: peru">Q&A</a></dt>
                <dd class="timelineEvent" id="` + index + `EX" style="display:none;">
               <p style="font-size: 12px;"
                           class=" contents"> <a style="font-size: 12px;color: peru">Q：</a> ` + contents[index] + `</p>
                   <p style="font-size: 12px;"
                              class=" contents"> <a style="font-size: 12px;color: peru">A：</a> ` + contents[index + 1] + `</p>
                    <br class="clear">
                </dd>
            </dl>
         `;
        }
        return QA;
    }


</script>

</html>
