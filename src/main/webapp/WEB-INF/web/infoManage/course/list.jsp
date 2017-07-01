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
                            <select lay-filter="course" id="module_search">
                                <option value="">课程模块</option>
                            </select>
                        </div>

                        <div class="layui-input-inline" style="width: auto">
                            <select lay-filter="profession" id="semester-search">
                                <option value="">开课学期</option>
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                                <option value="6">6</option>

                            </select>
                        </div>
                        <div class="layui-input-inline">
                            <input type="text" name="title" id="name-search" lay-verify="title" autocomplete="off"
                                   placeholder="课程名称" value="" class="layui-input">
                        </div>
                        <a class="layui-btn" onclick="course.list()"><i class="layui-icon">&#xe615;</i>搜索</a>

                    </div>
                </div>
            </blockquote>
            <div class="larry-separate"></div>
            <div class="layui-tab-content larry-personal-body clearfix mylog-info-box">
                <a class="layui-btn" onclick="course.add()"><i class="layui-icon">&#xe61f;</i>添加</a>
                <a class="layui-btn" onclick="course.importExcel()"><i class="layui-icon">&#xe630;</i>导入 excel</a>
                <div class="layui-form">
                    <table class="layui-table">
                        <thead>
                        <tr>
                            <th>课程代码</th>
                            <th>名称</th>
                            <th>模块</th>
                            <th>学分</th>
                            <th>学时</th>
                            <th>开课学期</th>
                            <th>考核方式</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody id="list">

                        </tbody>
                    </table>
                </div>
                <div id="demo1"></div>
            </div>
        </div>
    </div>
</section>
</body>
<%@ include file="layer.jsp" %>
<script type="text/javascript" src="${baseurl}/public/common/layui/layui.js"></script>
<script type="text/javascript">
    let totalSize = 10;
    let currentIndex = 1;
    let pageSize = 10;
    let course;
    let modules;
    let methods = [{id: "笔试", name: "笔试"}, {id: "机考", name: "机考"}, {id: "大作业", name: "大作业"}, {
        id: "课堂作业",
        name: "课堂作业"
    }];
    let semesters = [{id: "1", name: "1"}, {id: "2", name: "2"}, {id: "3", name: "3"}, {id: "4", name: "4"}, {
        id: "5",
        name: "5"
    }, {id: "6", name: "6"}];
    layui.use(['jquery', 'layer', 'element', 'form', 'laytpl', 'laypage'], function () {
        window.jQuery = window.$ = layui.jquery;
        window.layer = layui.layer;
        var element = layui.element(),
            form = layui.form(),
            laytpl = layui.laytpl;


        course = {
            page: function () {
                layui.laypage({
                    cont: 'demo1',
                    pages: totalSize, //总页数
                    curr: currentIndex,
                    groups: 5,//连续显示分页数
                    skin: '#1E9FFF',
                    jump: function (obj, first) {
                        currentIndex = obj.curr;
                        if (!first) {
                            course.list();
                        }
                    }
                });
            },
            list: function () {
                let moduleId = $("#module_search").val();
                let semester = $("#semester-search").val();
                let name = $("#name-search").val();
                $.ajax({
                    url: baseUrl + "/course/list",
                    data: {
                        currentIndex: currentIndex,
                        pageSize: pageSize,
                        semester: semester,
                        moduleId: moduleId,
                        name: name
                    },
                    success: function (data) {
                        if (data.result) {
                            modules = data.modules;
                            $("#module_search").html("<option value=''>模块</option>" + course.loadSelectElementHtml(modules, 0));
                            currentIndex = data.page.currentIndex;
                            totalSize = data.page.totalSize;
                            course.page();
                            laytpl($("#list-tpl").text()).render(data, function (html) {
                                $("#list").html(html);
                            });
                            form.render();
                        } else {
                            layer.msg(data.msg);
                        }
                    }
                });
            },
            loadSelectElementHtml: function (data, type) {
                let _html = "";
                for (let i = 0; i < data.length; ++i) {
                    let isSelected = data[i].id == type ? "selected" : "";
                    _html += ` <option ` + isSelected + `  value="` + data[i].id + `">` + data[i].name + `</option>`;
                }

                return _html;
            },
            add: function () {
                $("#add-module").html(course.loadSelectElementHtml(modules, null));
                $("#add-method").html(course.loadSelectElementHtml(methods, null));
                $("#add-semester").html(course.loadSelectElementHtml(semesters, null));
                form.render();
                layer.open({
                    type: 1,
                    title: '添加',
                    area: ["100%", "100%"]
                    , content: $("#add")
                });
            },
            addAjax: function () {
                let data = $("#add-form").serialize();
                $.post(baseUrl + "/course/add", data, function (data) {
                    layer.msg(data.msg);
                    if (data.result) {
                        setTimeout("location.reload()", 500);
                    }
                })

            },
            update: function (id, code, name, method, moduleId, schoolScore, schoolHours, semester) {
                $("#id").val(id);
                $("#update-code").val(code);
                $("#update-name").val(name);
                $("#update-schoolScore").val(schoolScore);
                $("#update-schoolHours").val(schoolHours);

                $("#update-module").html(course.loadSelectElementHtml(modules, moduleId));
                $("#update-method").html(course.loadSelectElementHtml(methods, method));
                $("#update-semester").html(course.loadSelectElementHtml(semesters, semester));

                form.render();
                layer.open({
                    type: 1,
                    title: '修改',
                    area: ["100%", "100%"]
                    , content: $("#update")
                });
            },
            updateAjax:function () {
                let data = $("#update-form").serialize();
                $.post(baseUrl + "/course/update", data, function (data) {
                    layer.msg(data.msg);
                    if (data.result) {
                        setTimeout("location.reload()", 500);
                    }
                })
            },
            delete:function (id) {
                layer.confirm('确定删除？', {icon: 3, title: '提示'}, function (index) {
                    layer.close(index);
                    $.post(baseUrl + "/course/delete", {id: id}, function (data) {
                        layer.msg(data.msg);
                        setTimeout("location.reload()", 500);
                    })
                });
            }
        };
        $(function () {
            course.list();

            form.on('checkbox(checkedAll)', function (data) {
                $(".no_checkbox").prop({checked: data.elem.checked});
                form.render();
            });
        });
    });


</script>

</html>
