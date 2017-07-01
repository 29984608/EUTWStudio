<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../../../public/tag.jsp" %>
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
            <blockquote class="layui-elem-quote mylog-info-tit">

                <div class="layui-inline">
                    <div class="layui-inline">
                        <div class="layui-input-inline">
                            <input type="text" name="title" id="name_search" lay-verify="title" autocomplete="off"
                                   placeholder="姓名" class="layui-input">
                        </div>
                        <a class="layui-btn" onclick="communication.list()"><i class="layui-icon">&#xe615;</i>搜索</a>

                    </div>
                </div>
            </blockquote>
            <div class="larry-separate"></div>
            <div class="layui-tab-content larry-personal-body clearfix mylog-info-box">
                <a class="layui-btn" onclick="communication.add()"><i class="layui-icon">&#xe630;</i>打印</a>
                <div class="layui-form">
                    <table class="layui-table">
                        <thead>
                        <tr>
                            <th><input type="checkbox" lay-filter="checkedAll" name="" lay-skin="primary"
                                       lay-filter="allChoose"></th>
                            <th>学号</th>
                            <th>姓名</th>
                            <th>性别</th>
                            <th>方向</th>
                            <th>专业</th>
                            <th>班级</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody id="list">

                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</section>
</body>
<%@include file="layer.jsp" %>
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
<script type="text/javascript">
    let communication;
    let student;
    let no;
    layui.use(['jquery', 'layer', 'element', 'form', 'laytpl'], function () {
        window.jQuery = window.$ = layui.jquery;
        window.layer = layui.layer;
        var element = layui.element(),
            form = layui.form(),
            laytpl = layui.laytpl;

        communication = {
            list: function () {
                let data = {
                    name: $("#name_search").val(),
                }
                $.ajax({
                    url: baseUrl + "/communication/list",
                    data: data,
                    success: function (data) {
                        if (data.result) {
                            laytpl($("#list-tpl").text()).render(data, function (html) {
                                $("#list").html(html);
                            });
                            form.render();

                        }
                    }
                });
            },
            add: function (studentNo) {
                $.post(baseUrl + "/student/student", {studentNo: studentNo}, function (data) {
                    if (data.result) {
                        student = data.data;

                        $(".no").val(student.no);
                        $("#studentName").val(student.name);
                        $("#talkName").text(student.name);
                        form.render();
                        layer.open({
                            type: 1,
                            title: '添加',
                            area: ["100%", "100%"]
                            , content: $("#add")
                        });
                    } else {
                        layer.msg(data.msg);
                    }
                })

            },
            addAjax: function () {
                let no = $(".no").val();
                let direction = $("#direction").val();
                let talkName = $("#talkName").text();
                let contents = "";
                let contentNodes = $(".add-contents");
                for (let i = 0; i < contentNodes.length; ++i) {
                    contents += $(contentNodes[i]).val() + "$%$";
                }

                let data = {
                    "studentId": no,
                    "direction": direction,
                    "talkName": talkName,
                    "content": contents
                }
                $.post(baseUrl + "/communication/add", data, function (data) {
                    layer.msg(data.msg);
                    setTimeout("location.reload()", 500);
                })
            },
            updateAjax: function (data) {
                $.post(baseUrl + "/communication/updateContent", data, function (data) {
                    layer.msg(data.msg);
                })
            },
            updateContent: function (id, qaId) {
                let contents = "";
                let contentNodes = $("#" + qaId + "").find(".update-contents");
                for (let i = 0; i < contentNodes.length; ++i) {
                    contents += $(contentNodes[i]).val() + "$%$";
                }
                let data = {
                    id: id,
                    content: contents
                }
                communication.updateAjax(data);
            },
            previewOrUpdate: function (studentNo, type) {
                $.post(baseUrl + "/communication/communication", {studentNo: studentNo}, function (data) {
                    if (data.result) {
                        showCommunicationContents(data.data, type);
                        let title = type === "preview" ? "预览" : "添加";
                        layer.open({
                            type: 1,
                            title: title,
                            area: ["100%", "100%"]
                            , content: $("#update")
                        });
                    } else {
                        layer.msg(data.msg);
                    }
                });
            }
        };
        $(function () {
            communication.list();

            form.on('radio(talk)', function (data) {
                let talkName = data.value == "parent" ? student.parentName : student.name;
                $("#talkName").text(talkName);
            });
        });
    });


</script>


</html>
