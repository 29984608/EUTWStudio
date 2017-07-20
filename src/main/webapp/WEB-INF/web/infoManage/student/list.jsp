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

</head>
<body>
<section class="larry-grid layui-form">
    <div class="larry-personal">
        <div class="layui-tab">
            <form id="update-form" lay-filter="role-add" class="layui-form layui-form-pane" method="post">
                <blockquote class="layui-elem-quote mylog-info-tit">

                    <div class="layui-form-item">
                        <div class="layui-input-inline">
                            <div class="layui-inline">
                                <div class="layui-input-inline">
                                    <select name="modules" lay-filter="department" lay-verify="required" lay-search=""
                                            id="department_search">
                                        <option value="">系</option>
                                    </select>
                                </div>
                            </div>
                        </div>

                        <div class="layui-input-inline">
                            <div class="layui-inline">
                                <div class="layui-input-inline">
                                    <select name="modules1" lay-filter="modules_2" lay-verify="required" lay-search=""
                                            id="level_search">
                                        <option value="">年级</option>
                                    </select>
                                </div>
                            </div>
                        </div>

                        <div class="layui-input-inline">
                            <div class="layui-inline">
                                <div class="layui-input-inline">
                                    <select name="modules" lay-filter="modules_3" lay-verify="required" lay-search=""
                                            id="direction_search">
                                        <option value="">方向</option>
                                    </select>
                                </div>
                            </div>
                        </div>

                        <div class="layui-input-inline">
                            <div class="layui-inline">
                                <div class="layui-input-inline">
                                    <select name="modules1" lay-filter="modules_2" lay-verify="required" lay-search=""
                                            id="classes_search">
                                        <option value="">班级</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div>
                        <div class="layui-form-item">
                            <div class="layui-form-inline">
                                <label class="layui-form-label">性别</label>
                                <div class="layui-input-inline" id="sex" style="width: 30%">
                                    <input type="radio" name="sex" value="" title="全部" checked="">
                                    <input type="radio" name="sex" value="男" title="男">
                                    <input type="radio" name="sex" value="女" title="女">
                                </div>

                                <label class="layui-form-label">住宿类型</label>
                                <div class="layui-input-inline" id="TypeOfAccommodation" onclick="student.showDormAndHideDorm()" style="width: 40%">

                                    <input type="radio" name="TypeOfAccommodation" value="" title="全部" checked=""
                                    >
                                    <input type="radio" name="TypeOfAccommodation" value="1" title="校内"
                                            >
                                    <input type="radio" name="TypeOfAccommodation" value="2" title="校外"
                                           >
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <span id="dorm">
                            <div class="layui-input-inline">
                                <div class="layui-inline">
                                    <div class="layui-input-inline">
                                        <select name="modules" lay-filter="dorm" lay-verify="required" lay-search=""
                                                id="area_search">
                                            <option value="">区</option>
                                        </select>
                                    </div>
                                </div>
                            </div>

                            <div class="layui-input-inline">
                                <div class="layui-inline">
                                    <div class="layui-input-inline">
                                        <select name="modules1" lay-filter="modules_2" lay-verify="required"
                                                lay-search=""
                                                id="floor_search">
                                            <option value="">楼层</option>
                                        </select>
                                    </div>
                                </div>
                            </div>

                            <div class="layui-inline" style="margin-right: -15px">
                                <div class="layui-inline">
                                    <div class="layui-input-inline">
                                        <input type="text" name="title" id="roomNo_search" lay-verify="title"
                                               autocomplete="off"
                                               placeholder="宿舍" class="layui-input">
                                    </div>
                                </div>
                            </div>
                        </span>

                        <div class="layui-inline" style="margin-right: -15px">
                            <div class="layui-inline">
                                <div class="layui-input-inline">
                                    <input type="text" name="title" id="studentNo_search" lay-verify="title"
                                           autocomplete="off"
                                           placeholder="学号" class="layui-input">
                                </div>

                            </div>
                        </div>

                        <div class="layui-inline" style="margin-right: -15px">
                            <div class="layui-inline" style="margin-right: -10px">
                                <div class="layui-input-inline">
                                    <input type="text" name="title" id="studentName_search" lay-verify="title"
                                           autocomplete="off"
                                           placeholder="姓名" class="layui-input" style="margin-right: 3px">
                                </div>
                                <a class="layui-btn" onclick="currentIndex = 1;student.list()"><i class="layui-icon">&#xe615;</i>搜索</a>
                            </div>
                        </div>
                    </div>

                </blockquote>
            </form>
            <div class="larry-separate"></div>
            <div class="layui-tab-content larry-personal-body clearfix mylog-info-box">
                <div class="layui-form">
                    <table class="layui-table">
                        <thead>
                        <tr>
                            <th>学号</th>
                            <th>姓名</th>
                            <th>性别</th>
                            <th>系</th>
                            <th>年级</th>
                            <th>住宿类型</th>
                            <th>专业</th>
                            <th>方向</th>
                            <th>班级</th>
                            <th>区</th>
                            <th>楼层</th>
                            <th>宿舍</th>
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

<script type="text/javascript" src="${baseurl}/public/js/pdf/html2canvas.js"></script>
<script type="text/javascript">
    let student;
    let totalSize = 10;
    let currentIndex = 1;
    let pageSize = 10;
    layui.use(['jquery', 'layer', 'element', 'laypage', 'form', 'laytpl', 'tree'], function () {
        window.jQuery = window.$ = layui.jquery;
        window.layer = layui.layer;
        var element = layui.element(),
            form = layui.form(),
            laytpl = layui.laytpl;

        student = {
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
                            student.list();
                        }
                    }
                });
            },

            list: function () {
                let department_search = $("#department_search").val();
                let level_search = $("#level_search").val();
                let direction_search = $("#direction_search").val();
                let classes_search = $("#classes_search").val();
                let area_search = $("#area_search").val();
                let floor_search = $("#floor_search").val();
                let roomNo_search = $("#roomNo_search").val();
                let studentNo_search = $("#studentNo_search").val();
                let name = $("#studentName_search").val();
                let sex = $("input[name='sex']:checked").val();
                let TypeOfAccommodation = $("input[name='TypeOfAccommodation']:checked").val();

                $.ajax({
                    url: baseUrl + "/student/list",
                    type: "post",
                    data: {
                        currentIndex: currentIndex,
                        pageSize: pageSize,
                        departmentId: department_search,
                        level: level_search,
                        directionId: direction_search,
                        classesId: classes_search,
                        areaId: area_search,
                        floorId: floor_search,
                        roomId: roomNo_search,
                        studentNo: studentNo_search,
                        name: name,
                        sex: sex,
                        TypeOfAccommodation: TypeOfAccommodation
                    },
                    success: function (data) {
                        if (data.result) {
                            currentIndex = data.page.currentIndex;
                            totalSize = data.page.totalSize;
                            student.page();
                            laytpl($("#list-tpl").text()).render(data, function (html) {
                                $("#list").html(html);
                            });
                            form.render();
                        }
                    }
                });
            },
            showDormAndHideDorm: function () {
                if ($("input[name='TypeOfAccommodation']:checked").val() === "1") {
                    $("#dorm").show();
                } else {
                    $("#dorm").hide();
                }
            },
            loadDirectionsByDepartmentId: function (id) {
                $.post(baseUrl + "/communication/queryDirectionByDepartmentId", {departmentId: id}, function (data) {
                    if (data.result) {
                        $("#direction_search").html(`<option value="">方向</option>`).append(loadOptionsHtml(data.data, "-"));

                        form.render();
                    }
                })
            }, loadClassByDepartmentId: function (id) {
                $.post(baseUrl + "/communication/queryClassByDepartmentId", {departmentId: id}, function (data) {
                    if (data.result) {
                        $("#classes_search").html(`<option value="">班级</option>`).append(loadOptionsHtml(data.data, "-"));

                        form.render();
                    }
                })
            },
            loadDepartmentOrDirectionArea: function (data, selectId) {
                let _html = "<option value=\"\">区</option>";
                for (let i = 0; i < data.length; ++i) {
                    if (selectId == data[i].id) {
                        _html += `<option  selected value="` + data[i].id + `">` + data[i].name + `</option>`;
                    } else {
                        _html += `<option value="` + data[i].id + `">` + data[i].name + `</option>`;
                    }
                }

                return _html;
            },
            loadDepartmentOrDirectionFloor: function (data, selectId) {
                let _html = "<option value=\"\">楼层</option>";
                for (let i = 0; i < data.length; ++i) {
                    if (selectId == data[i].id) {
                        _html += `<option  selected value="` + data[i].id + `">` + data[i].name + `</option>`;
                    } else {
                        _html += `<option value="` + data[i].id + `">` + data[i].name + `</option>`;
                    }
                }

                return _html;
            },
        };


        function loadALlDepartments() {
            $.post(baseUrl + "/department/allDepartments", function (data) {
                if (data.result) {
                    $("#department_search").html(`<option value="" selected>系</option>`).append(loadOptionsHtml(data.data, "-"));
                }
            });
        }

        function loadAllLevels() {
            let date = new Date();
            let year = date.getFullYear();
            let differ = year - 2017;
            if (differ >= 0) {
                for (let i = differ; i >= 0; i--) {
                    $("#level_search").append(`<option value="` + year + `">` + (year + i) + `</option>`)
                }
            }
        }

        function loadAllDirections() {
            $.post(baseUrl + "/communication/queryDirectionByDepartment", function (data) {
                if (data.result) {
                    $("#direction_search").html(`<option value="">方向</option>`).append(loadOptionsHtml(data.data, "-"))
                }
            })
        }

        function loadAllClassess() {
            $.post(baseUrl + "/communication/queryClass", function (data) {
                if (data.result) {
                    $("#classes_search").html(`<option value="">班级</option>`).append(loadOptionsHtml(data.data, "-"));
                }
            });
        }

        function loadOptionsHtml(data, selectId) {
            let _html = "";
            for (let i = 0; i < data.length; ++i) {
                if (selectId == data[i].id) {
                    _html += `<option  selected value="` + data[i].id + `">` + data[i].name + `</option>`;
                } else {
                    _html += `<option value="` + data[i].id + `">` + data[i].name + `</option>`;
                }
            }

            return _html;
        }

        function queryAreaAndFloor() {
            $.post(baseUrl + "dorm/room/showAreaAndFloorsToQuery", function (data) {
                if (data.result) {
                    $("#area_search").html(student.loadDepartmentOrDirectionArea(data.data.queryAreaOfRoom, "-"))
                    $("#floor_search").html(student.loadDepartmentOrDirectionFloor(data.data.queryFloorOfRoom, "-"))
                }
                form.render();
            })
        }

        $(function () {
            student.showDormAndHideDorm();
            queryAreaAndFloor();
            loadALlDepartments();
            loadAllDirections();
            loadAllLevels();
            loadAllClassess();
            student.list();
            form.render();

            form.on('select(department)', function (data) {

                $("#department_search").html(student.loadClassByDepartmentId(data.value));
                $("#direction_search").html(student.loadDirectionsByDepartmentId(data.value));
            });

            form.on('select(dorm)', function (data) {
                var id = data.value;

                $.post(baseUrl + "dorm/room/showAreaAndFloors", {areaId: data.value}, function (data) {
                    if (data.result) {
                        var queryAreaOfRoom = data.data.queryAreaOfRoom
                        var queryFloorOfRoom = data.data.queryFloorOfRoom

                        $("#area_search").html(student.loadDepartmentOrDirectionArea(queryAreaOfRoom, id))
                        $("#floor_search").html(student.loadDepartmentOrDirectionFloor(queryFloorOfRoom), "-")
                        form.render();
                    }
                })
            })
        });
    });

</script>

</html>
