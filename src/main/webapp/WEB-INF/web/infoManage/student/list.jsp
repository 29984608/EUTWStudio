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
                            <select lay-filter="student" id="direction_search">
                                <option value="0">方向</option>
                            </select>
                        </div>

                        <div class="layui-input-inline" style="width: auto">
                            <select lay-filter="profession" id="profession-search">
                                <option value="0">专业</option>

                            </select>
                        </div>
                        <div class="layui-input-inline">
                            <input type="text" name="title" id="name_search" lay-verify="title" autocomplete="off"
                                   placeholder="姓名" class="layui-input">
                        </div>
                        <a class="layui-btn" onclick="student.list()"><i class="layui-icon">&#xe615;</i>搜索</a>

                    </div>
                </div>
            </blockquote>
            <div class="larry-separate"></div>
            <div class="layui-tab-content larry-personal-body clearfix mylog-info-box">
                <a class="layui-btn" onclick="student.add()"><i class="layui-icon">&#xe630;</i>分配班级</a>
                <a class="layui-form-mid layui-word-aux">请先勾选学生</a>
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
    {{# layui.each(d.data.students, function(index, item){ }}
    <tr>
        <th><input type="checkbox" value="{{item.no}}-{{item.name}}" class="no_checkbox" name="" lay-skin="primary"
        ></th>
        <td>{{ item.no}}</td>
        <td>{{ item.name}}</td>
        <td>{{ item.gender}}</td>
        <td>{{ item.direction}}</td>
        <td>{{ item.profession}}</td>
        <td>
            {{# if(item.classes === undefined){ }}
            未分配
            {{# }else{ }}
            {{ item.classes}}
            {{#}}}
        </td>
    </tr>
    {{# }); }}

</script>
<div id="add" style="margin: 10px;display: none">
    <form id="add-form" class="layui-form layui-form-pane" method="post">
        <div class="layui-form-item">
            <label class="layui-form-label">选择一个班级</label>
            <div class="layui-input-inline">
                <select id="classess">
                    <option value="0">请选择</option>
                </select>
            </div>
        </div>
        <div id="students">

        </div>
        <div class="layui-form-item" style="margin-top: 30px">
            <div class="layui-input-block">
                <a class="layui-btn" onclick="student.addAjax()">立即提交</a>
            </div>
        </div>
    </form>
</div>
<script type="text/javascript" src="${baseurl}/public/common/layui/layui.js"></script>
<script type="text/javascript">
    let student;
    layui.use(['jquery', 'layer', 'element', 'form', 'laytpl'], function () {
        window.jQuery = window.$ = layui.jquery;
        window.layer = layui.layer;
        var element = layui.element(),
            form = layui.form(),
            laytpl = layui.laytpl;


        student = {
            list: function () {
                let data = {
                    name: $("#name_search").val(),
                    directionId: $("#direction_search").val(),
                    professionId: $("#profession-search").val()
                }
                $.ajax({
                    url: baseUrl + "/student/list",
                    data: data,
                    success: function (data) {
                        if (data.result) {
                            $("#profession-search").html("<option value='0'>专业</option>"+student.loadSelectElementHtml(data.data.professions));
                            $("#direction_search").html("<option value='0'>方向</option>"+student.loadSelectElementHtml(data.data.directions));

                            laytpl($("#list-tpl").text()).render(data, function (html) {
                                $("#list").html(html);
                            });
                            form.render();

                        }
                    }
                });
            },
            loadSelectElementHtml: function (data) {
                let _html = "";
                for (let i = 0; i < data.length; ++i) {
                    _html += ` <option value="` + data[i].id + `">` + data[i].name + `</option>`;
                }

                return _html;
            },
            add: function () {
                let _html = "";
                let selectStudents = $(".no_checkbox:checked");
                if (selectStudents.length === 0) {
                    layer.msg("请先勾选学生");
                    return false;
                }
                _html += `<label class="layui-form-label" style="margin-bottom: 20px">一共` + selectStudents.length + `人</label>`
                for (let i = 0; i < selectStudents.length; ++i) {
                    let val = $(selectStudents[i]).val().split("-");
                    _html += `<input type="checkbox" class="hasSelected" value="` + val[0] + `" title="` + val[1] + `" checked>`;
                }
                $("#students").html(_html);

                $.post(baseUrl + "/student/loadTeacherHasClassess", function (data) {
                    if (data.result) {
                        $("#classess").html("<option value='0'>班级</option>"+student.loadSelectElementHtml(data.data));
                        form.render();
                        layer.open({
                            type: 1,
                            title: '添加',
                            area: ["100%", "100%"]
                            , content: $("#add")
                        });
                    }
                })
            },
            addAjax: function () {
                let classesId = $("#classess").val();
                if(classesId == "0") {
                    layer.msg("请选择一个班级");
                    return false;
                }
                let studentIds = "";
                let selectStudents = $(".hasSelected:checked");
                for (let i = 0; i < selectStudents.length; ++i)studentIds += $(selectStudents[i]).val() + ",";
                let data = {
                    classesId:classesId,
                    studentIds:studentIds
                }
                let msg = "确定分配"+selectStudents.length+"个学生到该年级?"
                layer.confirm(msg, {icon: 3, title: '提示'}, function (index) {
                    layer.close(index);
                    $.post(baseUrl + "/student/distributedClass", data, function (data) {
                        layer.msg(data.msg);
                        if (data.result) {
                            setTimeout("location.reload()", 500);
                        }
                    })
                });

            },
        };
        $(function () {
            student.list();

            form.on('checkbox(checkedAll)', function (data) {
                $(".no_checkbox").prop({checked: data.elem.checked});
                form.render();
            });
        });
    });


</script>

</html>
