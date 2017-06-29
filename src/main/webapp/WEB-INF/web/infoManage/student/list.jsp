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
</head>
<body>
<section class="larry-grid layui-form">
    <div class="larry-personal">
        <div class="layui-tab">
            <blockquote class="layui-elem-quote mylog-info-tit">

                <div class="layui-inline">
                    <div class="layui-inline">
                        <div class="layui-input-inline">
                            <select lay-filter="student" id="student">
                                <option value="">方向</option>

                            </select>
                        </div>

                        <div class="layui-input-inline" style="width: auto">
                            <select  lay-filter="profession" id="profession">
                                <option value="">专业</option>

                            </select>
                        </div>
                        <div class="layui-input-inline">
                            <input type="text" name="title" lay-verify="title" autocomplete="off"
                                   placeholder="姓名" class="layui-input">
                        </div>
                        <button class="layui-btn"><i class="layui-icon">&#xe615;</i>搜索</button>

                    </div>
                </div>
            </blockquote>
            <div class="larry-separate"></div>
            <div class="layui-tab-content larry-personal-body clearfix mylog-info-box">
                <button class="layui-btn"><i class="layui-icon">&#xe630;</i>分配班级</button>
                <div class="layui-form">
                    <table class="layui-table">
                        <thead>
                        <tr>
                            <th><input type="checkbox" name="" lay-skin="primary" lay-filter="allChoose"></th>
                            <th>学号</th>
                            <th>姓名</th>
                            <th>性别</th>
                            <th>方向</th>
                            <th>专业</th>
                            <th>班级</th>
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
<script id="list-tpl" type="text/html">
    {{# layui.each(d.data, function(index, item){ }}
    <tr>
        <th><input type="checkbox" name="" lay-skin="primary" lay-filter="allChoose"></th>
        <td>{{ item.no}}</td>
        <td>{{ item.name}}</td>
        <td>{{ item.gender}}</td>
        <td>{{ item.direction}}</td>
        <td>{{ item.profession}}</td>
        <td>{{ item.classes}}</td>
    </tr>
    {{# }); }}

</script>
<script type="text/javascript" src="${baseurl}/public/common/layui/layui.js"></script>
<script type="text/javascript">
    let student;
    let professionId = 0;
    let directionId = 0;
    let name = "";
    layui.use(['jquery', 'layer', 'element', 'form', 'laytpl'], function () {
        window.jQuery = window.$ = layui.jquery;
        window.layer = layui.layer;
        var element = layui.element(),
            form = layui.form(),
            laytpl = layui.laytpl;


        student = {
            list: function () {
                $.ajax({
                    url: baseUrl + "/student/list",
                    data: {professionId: professionId, directionId: directionId,name:name},
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
            add: function () {
                layer.open({
                    type: 1,
                    title: '添加'
                    , content: $("#add")
                });

            },
            update: function (id, code, name) {
                $("#id").val(id);
                $("#code").val(code);
                $("#name").val(name);
                layer.open({
                    type: 1,
                    title: '修改'
                    , content: $("#update")
                });
            },
            delete: function (id) {
                layer.confirm('确定删除？', {icon: 3, title: '提示'}, function (index) {
                    layer.close(index);
                    $.post(baseUrl + "/student/delete", {id: id}, function (data) {
                        layer.msg(data.msg);
                        location.reload();
                    })
                });
            },
            addAjax: function () {
                let data = $("#add-form").serialize();
                $.post(baseUrl + "/student/add", data, function (data) {
                    layer.msg(data.msg);
                    if (data.result) {
                        setTimeout("location.reload()", 500);
                    }
                })
            },
            updateAjax: function () {
                let data = $("#update-form").serialize();
                $.post(baseUrl + "/student/update", data, function (data) {
                    layer.msg(data.msg);
                    if (data.result) {
                        setTimeout("location.reload()", 500);
                    }

                })
            }
        };
        $(function () {
            student.list();
        });
    });


</script>

</html>
