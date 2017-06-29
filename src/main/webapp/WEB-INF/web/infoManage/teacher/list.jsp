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
<section class="larry-grid">
    <div class="larry-personal">
        <div class="layui-tab">
            <blockquote class="layui-elem-quote mylog-info-tit">
                <%--<shiro:hasPermission name="teacher:add">--%>
                <ul class="layui-tab-title">
                    <li class="layui-btn " onclick="teacher.add()"><i class="layui-icon">&#xe61f;</i>添加老师
                    </li>
                </ul>
                <%--</shiro:hasPermission>--%>
            </blockquote>
            <div class="larry-separate"></div>

            <div class="layui-tab-content larry-personal-body clearfix mylog-info-box">
                <div class="layui-form ">
                    <table id="example" class="layui-table lay-even " data-name="articleCatData">
                        <thead>
                        <tr>
                            <th>序号</th>
                            <th>工号</th>
                            <th>名字</th>
                            <th>性别</th>
                            <th>系</th>
                            <th>方向</th>
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
<%@include file="layer.jsp" %>
<script type="text/javascript" src="${baseurl}/public/common/layui/layui.js"></script>
<script type="text/javascript">
    let totalSize = 10;
    let currentIndex = 1;
    let pageSize = 10;
    let teacher;
    let classId = 0;
    layui.use(['jquery', 'layer', 'element', 'laypage', 'form', 'laytpl', 'tree'], function () {
        window.jQuery = window.$ = layui.jquery;
        window.layer = layui.layer;
        var element = layui.element(),
            form = layui.form(),
            laytpl = layui.laytpl;


        teacher = {
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
                            teacher.list();
                        }
                    }
                });
            },
            list: function () {
                $.ajax({
                    url: baseUrl + "/teacher/list",
                    data: {currentIndex: currentIndex, pageSize: pageSize},
                    success: function (data) {
                        if (data.result) {
                            currentIndex = data.page.currentIndex;
                            totalSize = data.page.totalSize;
                            teacher.page();
                            laytpl($("#list-tpl").text()).render(data, function (html) {
                                $("#list").html(html);
                            });
                            form.render();
                        }
                    }
                });
            },
            loadDepartmentOrDirection: function (data, selectId) {
                let _html = "";
                for (let i = 0; i < data.length; ++i) {
                    if (selectId == data[i].id) {
                        _html += `<option selected value="` + data[i].id + `">` + data[i].name + `</option>`;
                    } else {
                        _html += `<option value="` + data[i].id + `">` + data[i].name + `</option>`;
                    }
                }

                return _html;
            },
            loadClasses: function (classess, no) {
                let totalHtml = "";
                let _html = "";
                let level = classess.length === 0 ? 0 : classess[0].level;
                for (let i = 0; i < classess.length; ++i) {
                    let isChecked = classess[i].teacherId == no ? "checked" : "";
                    if (classess[i].level !== level) {
                        totalHtml += ` <div class="layui-form-item">
                                          <label class="layui-form-label" style="width: 60px;margin-left: 5%">` + level + `</label>
                                             <div class="layui-input-block" >`
                            + _html + `
                                             </div>
                                       </div>`;

                        level = classess[i].level;
                        _html = ` <input class="classId" type="checkbox" ` + isChecked + ` value="` + classess[i].id + `" title="` + classess[i].name + `" >`
                    } else {
                        _html += ` <input class="classId" type="checkbox" ` + isChecked + ` value="` + classess[i].id + `" title="` + classess[i].name + `" >`
                    }
                    if (i === classess.length - 1 && classess[i].level === level) {
                        totalHtml += ` <div class="layui-form-item">
                                          <label class="layui-form-label" style="width: 60px;margin-left: 5%">` + level + `</label>
                                             <div class="layui-input-block" >`
                            + _html + `
                                             </div>
                                       </div>`;
                    }
                }
                return totalHtml;
            },
            add: function () {
                $.post(baseUrl + "/teacher/loadDepartmentsAndDirectionsAndClasses", function (data) {
                    if (data.result) {
                        let departments = data.data.departments;
                        let directions = data.data.directions;
                        let classess = data.data.classess;

                        $("#department").html(teacher.loadDepartmentOrDirection(departments, "-"));
                        $("#direction").html(teacher.loadDepartmentOrDirection(directions, "-"));
                        $("#classes").html(teacher.loadClasses(classess, "-"));

                        form.render();
                        layer.open({
                            type: 1,
                            title: '添加',
                            area: ["100%", "100%"]
                            , content: $("#add")
                        });
                    }
                });

            },
            update: function (no,departmentId,directionId,name,gender) {
                $.post(baseUrl + "/teacher/loadDirectionsAndClassesByDepartmentId",{departmentId:departmentId}, function (data) {
                    if (data.result) {
                        let departments = data.data.departments;
                        let directions = data.data.directions;
                        let classess = data.data.classess;
                        $("#id").val(no)
                        $("#no-update").val(no);
                        $("#name-update").val(name);
                        if (gender === "男") $("#gender-man").prop({checked: true});
                        else $("#gender-woman").prop({checked: true});
                        $("#department-update").html(teacher.loadDepartmentOrDirection(departments, departmentId));
                        $("#direction-update").html(teacher.loadDepartmentOrDirection(directions, directionId));
                        $("#classes-update").html(teacher.loadClasses(classess, no));

                        form.render();
                        layer.open({
                            type: 1,
                            title: '修改',
                            area: ["100%", "100%"]
                            , content: $("#update")
                        });
                    }
                })
            },
            delete: function (id) {
                layer.confirm('确定删除？', {icon: 3, title: '提示'}, function (index) {
                    layer.close(index);
                    $.post(baseUrl + "/teacher/delete", {id: id}, function (data) {
                        layer.msg(data.msg);
                        setTimeout("location.reload()", 500);
                    })
                });
            },
            addAjax: function () {
                let data = $("#add-form").serialize();
                let classedIds = "";
                let classes = $(".classId");
                for (let i = 0; i < classes.length; ++i) {
                    if ($(classes[i]).prop("checked")) classedIds += $(classes[i]).val() + ",";
                }
                data += "&classIds=" + classedIds;

                $.post(baseUrl + "/teacher/add", data, function (data) {
                    layer.msg(data.msg);
                    if (data.result) {
                        setTimeout("location.reload()", 500);
                    }
                })
            },
            updateAjax: function () {
                let data = $("#update-form").serialize();
                let classedIds = "";
                let classes = $(".classId");
                for (let i = 0; i < classes.length; ++i) {
                    if ($(classes[i]).prop("checked")) classedIds += $(classes[i]).val() + ",";
                }
                data += "&classIds=" + classedIds;
                layer.confirm('确定修改?如果您修改了系,那么原来的班级就会被删除', {icon: 3, title: '提示'}, function (index) {
                    layer.close(index);
                    $.post(baseUrl + "/teacher/update", data, function (data) {
                        layer.msg(data.msg);
                        setTimeout("location.reload()", 500);
                    })
                });
            }
        };
        ;
        $(function () {
            teacher.list();

            form.on('select(department)', function (data) {
                $.post(baseUrl + "/teacher/loadDirectionsAndClassesByDepartmentId", {departmentId: data.value}, function (data) {
                    if (data.result) {
                        let directions = data.data.directions;
                        let classess = data.data.classess;

                        $("#direction").html(teacher.loadDepartmentOrDirection(directions, "-"));
                        $("#classes").html(teacher.loadClasses(classess, "-"));

                        $("#direction-update").html(teacher.loadDepartmentOrDirection(directions, "-"));
                        $("#classes-update").html(teacher.loadClasses(classess, "-"));
                        form.render();
                    }
                });
            });

        });
    })
    ;


</script>

</html>
