<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../../../public/tag.jsp" %>
<html>
<head>
    <title></title>
    <script type="text/javascript" src="${baseurl}/public/common/js/jquery-3.2.0.min.js"></script>
    <script type="text/javascript" src="${baseurl}/public/js/verify/messages_zh.js"></script>
    <script type="text/javascript" src="${baseurl}/public/js/verify/jquery.metadata.js"></script>
    <script type="text/javascript" src="${baseurl}/public/js/verify/jquery.validate.js"></script>
    <link rel="stylesheet" type="text/css" href="${baseurl}/public/common/layui/css/layui.css" media="all">
    <link rel="stylesheet" type="text/css" href="${baseurl}/public/common/layui/css/layui.css" media="all">
    <link rel="stylesheet" type="text/css" href="${baseurl}/public/common/bootstrap/css/bootstrap.min.css" media="all">
    <link rel="stylesheet" type="text/css" href="${baseurl}/public/common/css/global.css" media="all">
    <link rel="stylesheet" type="text/css" href="${baseurl}/public/css/common.css" media="all">
    <link rel="stylesheet" type="text/css" href="${baseurl}/public/css/personal.css" media="all">
</head>
<body>

<div class="layui-tab">
    <ul class="layui-tab-title">
        <li class="layui-this">区</li>
        <li>楼层</li>
        <li>宿舍</li>
    </ul>
    <div class="layui-tab-content">
        <div class="layui-tab-item layui-show">
            <section class="larry-grid">

                <div class="larry-personal">
                    <div class="layui-tab">

                        <form id="update-form1" lay-filter="role-add" class="layui-form layui-form-pane" method="post">

                            <blockquote class="layui-elem-quote mylog-info-tit">

                                <div class="layui-input-inline">
                                    <label class="layui-form-label">区</label>
                                    <div class="layui-inline">
                                        <div class="layui-input-inline">
                                            <select name="modules" lay-filter="modules_1" lay-verify="required" lay-search=""
                                                    id="queryAreas">
                                                <option value=""></option>
                                            </select>
                                        </div>
                                        <a class="layui-btn" onclick="area.list()"><i class="layui-icon">&#xe615;</i>搜索</a>
                                    </div>
                                </div>

                            </blockquote>
                        </form>



                        <div class="larry-separate"></div>

                        <div class="layui-tab-content larry-personal-body clearfix mylog-info-box">
                            <ul class="layui-tab-title">
                                <li class="layui-btn " onclick="area.add()"><i class="layui-icon">&#xe61f;</i>添加区
                                </li>
                            </ul>
                            <div class="layui-form ">
                                <table id="example" class="layui-table lay-even " data-name="articleCatData">
                                    <thead>
                                    <tr>
                                        <th>序号</th>
                                        <th>区</th>
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

            <script id="list-tpl" type="text/html">
                {{# layui.each(d.data.pageInfos, function(index, item){ }}
                <tr>
                    <td>{{ index+1}}</td>
                    <td>{{ item.name}}</td>
                    <td>
                        <button class="layui-btn layui-btn-mini layui-btn-normal"
                                onclick="area.update('{{item.id}}','{{item.name}}')">
                            <i class="layui-icon">&#xe642;</i>修改
                        </button>
                        <button class="layui-btn layui-btn-mini  layui-btn-danger" onclick="area.delete('{{item.id}}')">
                            <i class="layui-icon">&#xe60a;</i>删除
                        </button>
                    </td>
                </tr>
                {{# }); }}

            </script>
            <div id="add" style="margin: 10px;display: none">
                <form id="add-form" lay-filter="role-add" class="layui-form layui-form-pane" method="post">
                    <div class="layui-form-item">
                        <label class="layui-form-label">区名称</label>
                        <div class="layui-input-inline">
                            <input type="text" id="addAreaName"
                                   placeholder="请输入区名称" autocomplete="off" class="layui-input ">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-input-block">
                            <a class="layui-btn" onclick="area.addAjax()">立即提交</a>
                            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                        </div>
                    </div>
                </form>
            </div>
            <div id="update" style="margin: 10px;display: none">
                <form id="update-form" lay-filter="role-add" class="layui-form layui-form-pane" method="post">
                    <input type="hidden" id="updateAreaId" name="id"/>

                    <div class="layui-form-item">
                        <label class="layui-form-label">区名称</label>
                        <div class="layui-input-inline">
                            <input type="text" id="updateAreaName" name="name" required jq-verify="required"
                                   placeholder="请输入区名称" autocomplete="off" class="layui-input ">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-input-block">
                            <a class="layui-btn" onclick="area.updateAjax()">立即提交</a>
                            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                        </div>
                    </div>
                </form>
            </div>

        </div>
        <div class="layui-tab-item">
            <section class="larry-grid">

                <div class="larry-personal">
                    <div class="layui-tab">
                        <form id="update-form" lay-filter="role-add" class="layui-form layui-form-pane" method="post">

                            <blockquote class="layui-elem-quote mylog-info-tit">

                                <div class="layui-input-inline">
                                    <label class="layui-form-label">区</label>
                                    <div class="layui-inline">
                                        <div class="layui-input-inline">
                                            <select name="modules" lay-filter="modules_1" lay-verify="required" lay-search=""
                                                    id="queryAreasInFloor">
                                                <option value="">直接选择或搜索选择</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>

                                <div class="layui-input-inline">
                                    <label class="layui-form-label">楼层</label>
                                    <div class="layui-inline">
                                        <div class="layui-input-inline">
                                            <select name="modules1" lay-filter="modules_2" lay-verify="required" lay-search=""
                                                    id="queryFloorsInFloor">
                                                <option value="">直接选择或搜索选择</option>
                                            </select>
                                        </div>
                                        <a class="layui-btn" onclick="floor.list()"><i class="layui-icon">&#xe615;</i>搜索</a>
                                    </div>
                                </div>

                            </blockquote>
                        </form>

                        <div class="larry-separate"></div>

                        <div class="layui-tab-content larry-personal-body clearfix mylog-info-box">
                            <ul class="layui-tab-title">
                                <li class="layui-btn " onclick="floor.add()"><i class="layui-icon">&#xe61f;</i>添加楼层
                                </li>
                            </ul>
                            <div class="layui-form ">
                                <table id="example" class="layui-table lay-even " data-name="articleCatData">
                                    <thead>
                                    <tr>
                                        <th>序号</th>
                                        <th>区名称</th>
                                        <th>楼层</th>
                                        <th>操作</th>
                                    </tr>
                                    </thead>
                                    <tbody id="listInFloor">
                                    </tbody>
                                </table>

                            </div>
                            <div id="demo1InFloor"></div>
                        </div>
                    </div>
                </div>
            </section>

            <%@ include file="layerByFloor.jsp" %>
            <script type="text/javascript" src="${baseurl}/public/common/layui/layui.js"></script>
            <script type="text/javascript">
                let totalSize = 10;
                let currentIndex = 1;
                let pageSize = 10;
                let floor;
                layui.use(['jquery', 'layer', 'element', 'laypage', 'form', 'laytpl', 'tree'], function () {
                    window.jQuery = window.$ = layui.jquery;
                    window.layer = layui.layer;
                    var element = layui.element(),
                        form = layui.form(),
                        laytpl = layui.laytpl;


                    floor = {

                        page: function () {
                            layui.laypage({
                                cont: 'demo1InFloor',
                                pages: totalSize, //总页数
                                curr: currentIndex,
                                groups: 5,//连续显示分页数
                                skin: '#1E9FFF',
                                jump: function (obj, first) {
                                    currentIndex = obj.curr;
                                    if (!first) {
                                        floor.list();
                                    }
                                }
                            });
                        },
                        list: function () {
                            let areaId = $("#queryAreasInFloor").val();
                            let floorId = $("#queryFloorsInFloor").val();
                            let areaName = $("#queryAreasInFloor").find("option:selected").text();
                            let floorName = $("#queryFloorsInFloor").find("option:selected").text();
                            $.ajax({
                                url: baseUrl + "dorm/floor/list",
                                data: {
                                    currentIndex: currentIndex,
                                    pageSize: pageSize,
                                    areaId: areaId,
                                    floorId: floorId,
                                    areaName: areaName,
                                    floorName: floorName

                                },
                                success: function (data) {
                                    if (data.result) {
                                        currentIndex = data.data.pageUtil.currentIndex;
                                        totalSize = data.data.pageUtil.totalSize;
                                        floor.page();

                                        laytpl($("#list-tpl").text()).render(data, function (html) {
                                            $("#listInFloor").html(html);
                                        });
                                        floor.loadSelectAreaHtml();
                                        form.render();
                                    }
                                    $("#queryAreasInFloor").html(floor.loadDepartmentOrDirection(data.data.showAreaAndFloorInfos.queryAreaOfRoom), "-")
                                    $("#queryFloorsInFloor").html(floor.loadDepartmentOrDirection(data.data.showAreaAndFloorInfos.queryFloorOfRoom), "-")
                                }
                            });
                        },
                        add: function () {
                            layer.open({
                                type: 1,
                                area: ['390px', '260px'],
                                title: '添加'
                                , content: $("#add")
                            });

                        },
                        addAjax: function () {
                            let name = $("#addFloorNameInFloor").val();
                            var options = $("#showAreasAddInFloor option:selected");
                            var areaId = options.val();
                            layer.confirm('确定添加？', {icon: 3, title: '提示'}, function (index) {
                                layer.close(index);
                                $.post(baseUrl + "dorm/floor/add", {
                                    name: name,
                                    areaId: areaId
                                }, function (data) {
                                    layer.msg(data.msg);
                                    if (data.result) {
                                        setTimeout("location.reload()", 500);
                                    }
                                })
                            })
                        },
                        update: function (id, name, areaName, area_id) {
                            $("#updateFloorNameInFloor").val(name);
                            $("#updateFloorId").val(id);
                            $("#updateShowAreas").val(areaName);
                            $("#showAreasUpdatesInFloor").html(floor.loadSelectAreaHtml(area_id));
                            layer.open({
                                type: 1,
                                area: ["30%", "60%"],
                                title: '修改'
                                , content: $("#update")
                            });
                        },
                        loadSelectAreaHtml: function (area_id) {
                            let _html = "";
                            $.post(baseUrl + "dorm/floor/selectArea", function (data) {
                                $("#showAreasUpdatesInFloor").html(floor.loadDepartmentOrDirection(data.data.dormInfos, area_id))
                                laytpl($("#list-areas").text()).render(data, function (html) {
                                    $("#showAreasAddInFloor").html(html);
                                });
                                form.render();
                            })

                            return _html;
                        },
                        loadDepartmentOrDirection: function (data, selectId) {
                            let _html = `<option value="">直接选择或搜索选择</option>`;
                            for (let i = 0; i < data.length; ++i) {
                                if (selectId == data[i].id) {
                                    _html += `<option selected value="` + data[i].id + `">` + data[i].name + `</option>`;
                                } else {
                                    _html += `<option value="` + data[i].id + `">` + data[i].name + `</option>`;
                                }
                            }

                            return _html;
                        },
                        delete: function (id) {
                            layer.confirm('确定删除？', {icon: 3, title: '提示'}, function (index) {
                                layer.close(index);
                                $.post(baseUrl + "dorm/floor/delete", {id: id}, function (data) {
                                    layer.msg(data.msg);
                                    setTimeout("location.reload()", 400);
                                })
                            });
                        },
                        updateAjax: function () {
                            let name = $("#updateFloorNameInFloor").val();
                            let id = $("#updateFloorId").val();
                            layer.confirm('确定修改？', {icon: 3, title: '提示'}, function (index) {
                                layer.close(index);
                                $.post(baseUrl + "dorm/floor/update", {
                                    name: name,
                                    id: id
                                }, function (data) {
                                    layer.msg(data.msg);

                                    if (data.result) {
                                        setTimeout("location.reload()", 500);
                                    }
                                })
                            })
                        }
                    };
                    $(function () {
                        floor.list();

                        form.on('select(modules_1)', function (data) {
                            var id = data.value;

                            $.post(baseUrl + "dorm/room/showAreaAndFloorInfos", {areaId: data.value}, function (data) {
                                if (data.result) {
                                    var queryAreaOfRoom = data.data.queryAreaOfRoom
                                    var queryFloorOfRoom = data.data.queryFloorOfRoom

                                    $("#queryAreasInFloor").html(floor.loadDepartmentOrDirection(queryAreaOfRoom, id))
                                    $("#queryFloorsInFloor").html(floor.loadDepartmentOrDirection(queryFloorOfRoom), "-")
                                    form.render();
                                }
                            })
                        })
                    });
                });


            </script>

            <script>
                layui.use(['form', 'layedit', 'laydate'], function () {
                    var form = layui.form()
                        , layer = layui.layer
                        , layedit = layui.layedit
                        , laydate = layui.laydate;

                    //创建一个编辑器
                    var editIndex = layedit.build('LAY_demo_editor');

                    //自定义验证规则
                    form.verify({
                        title: function (value) {
                            if (value.length < 5) {
                                return '标题至少得5个字符啊';
                            }
                        }
                        , pass: [/(.+){6,12}$/, '密码必须6到12位']
                        , content: function (value) {
                            layedit.sync(editIndex);
                        }
                    });

                    //监听指定开关
                    form.on('switch(switchTest)', function (data) {
                        layer.msg('开关checked：' + (this.checked ? 'true' : 'false'), {
                            offset: '6px'
                        });
                        layer.tips('温馨提示：请注意开关状态的文字可以随意定义，而不仅仅是ON|OFF', data.othis)
                    });

                    //监听提交
                    form.on('submit(demo1)', function (data) {
                        layer.alert(JSON.stringify(data.field), {
                            title: '最终的提交信息'
                        })
                        return false;
                    });


                });
            </script>
        </div>
        <div class="layui-tab-item">
            <section class="larry-grid layui-form">
                <div class="larry-personal">
                    <div class="layui-tab">
                        <form id="update-form" lay-filter="role-add" class="layui-form layui-form-pane" method="post">


                            <blockquote class="layui-elem-quote mylog-info-tit">

                                <div class="layui-input-inline">
                                    <label class="layui-form-label">区</label>
                                    <div class="layui-inline">
                                        <div class="layui-input-inline">
                                            <select name="modules" lay-filter="modules_3" lay-verify="required" lay-search=""
                                                    id="queryAreasInRoom">
                                                <option value="">直接选择或搜索选择</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>

                                <div class="layui-input-inline">
                                    <label class="layui-form-label">楼层</label>
                                    <div class="layui-inline">
                                        <div class="layui-input-inline">
                                            <select name="modules1" lay-filter="modules_2" lay-verify="required" lay-search=""
                                                    id="queryFloorsInRoom">
                                                <option value="">直接选择或搜索选择</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>

                                <div class="layui-input-inline">
                                    <label class="layui-form-label">宿舍</label>
                                    <div class="layui-inline">
                                        <div class="layui-input-inline">
                                            <div class="layui-inline">
                                                <input type="text" name="title" id="roomNo" lay-verify="title"
                                                       autocomplete="off"
                                                       placeholder="宿舍号" value="" class="layui-input">
                                            </div>
                                            <a class="layui-btn" onclick="room.list()"><i class="layui-icon">&#xe615;</i>搜索</a>
                                        </div>
                                    </div>
                                </div>


                            </blockquote>
                        </form>
                        <div class="larry-separate"></div>

                        <div class="layui-tab-content larry-personal-body clearfix mylog-info-box">
                            <ul class="layui-tab-title">
                                <li class="layui-btn " onclick="room.add()"><i class="layui-icon">&#xe61f;</i>添加宿舍
                                </li>
                            </ul>
                            <div class="layui-form ">
                                <table id="example" class="layui-table lay-even " data-name="articleCatData">
                                    <thead>
                                    <tr>
                                        <th>序号</th>
                                        <th>区</th>
                                        <th>楼层</th>
                                        <th>宿舍号</th>
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

<%@include file="layer.jsp" %>
<script type="text/javascript" src="${baseurl}/public/common/layui/layui.js"></script>
<script type="text/javascript">
    let totalSize = 10;
    let currentIndex = 1;
    let pageSize = 10;
    let room;
    layui.use(['jquery', 'layer', 'element', 'laypage', 'form', 'laytpl', 'tree'], function () {
        window.jQuery = window.$ = layui.jquery;
        window.layer = layui.layer;
        var element = layui.element(),
            form = layui.form(),
            laytpl = layui.laytpl;


        room = {
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
                            room.list();
                        }
                    }
                });
            },
            list: function () {
                var areaId = $("#queryAreasInRoom").val();
                var floorId = $("#queryFloorsInRoom").val();
                var roomNo = $("#roomNo").val();
                $.ajax({
                    url: baseUrl + "dorm/room/list",
                    data: {
                        currentIndex: currentIndex,
                        pageSize: pageSize,
                        areaId: areaId,
                        floorId: floorId,
                        roomNo: roomNo
                    },
                    success: function (data) {
                        if (data.result) {
                            currentIndex = data.data.pageUtil.currentIndex;
                            totalSize = data.data.pageUtil.totalSize;
                            room.page();
                            laytpl($("#list-tpl").text()).render(data, function (html) {
                                $("#list").html(html);
                            });
                            form.render();
                        }
                        room.query()
                    }
                });
            },
            query: function () {
                $.post(baseUrl + "dorm/room/showAreaAndFloorInfosToQuery", function (data) {
                    if (data.result) {
                        $("#queryAreasInRoom").html(room.loadDepartmentOrDirection(data.data.queryAreaOfRoom, "-"))
                        $("#queryFloorsInRoom").html(room.loadDepartmentOrDirection(data.data.queryFloorOfRoom, "-"))
                    }
                    form.render();
                })
            },
            add: function () {
                $.post(baseUrl + "dorm/room/showAreaAndFloorInfosToAdd", function (data) {
                    if (data.result) {
                        $("#showAreasAdd").html(room.loadDepartmentOrDirection(data.data.queryAreaOfRoom, "-"))
                        $("#showFloorsAdd").html(room.loadDepartmentOrDirection(data.data.queryFloorOfRoom, "-"))

                    }
                    form.render();
                })
                layer.open({
                    type: 1,
                    area: ["30%", "70%"],
                    title: '添加'
                    , content: $("#add")
                });

            },
            addAjax: function () {
                var idFloor = $("#showFloorsAdd").val();
                var idArea = $("#showAreasAdd").val();
                let name = $("#addRoomName").val();
                let areaName = $("#showAreasAdd").find("option:selected").text();
                let floorName = $("#showFloorsAdd").find("option:selected").text();
                if (areaName === "一楼") {

                } else if (areaName === "二楼") {

                } else if (areaName === "三楼") {

                } else if (areaName === "四楼") {

                } else if (areaName === "五楼") {

                } else if (areaName === "六楼") {

                }

                /* alert(areaName);
                 alert(floorName);*/

                layer.confirm('确定添加？', {icon: 3, title: '提示'}, function (index) {
                    layer.close(index);
                    $.post(baseUrl + "dorm/room/add", {
                        name: name,
                        floorId: idFloor,
                        areaId: idArea
                    }, function (data) {
                        layer.msg(data.msg);
                        if (data.result) {
                            setTimeout("location.reload()", 500);
                        }
                    })
                })
            },
            update: function (id, name, floorId, areaId) {
                $.post(baseUrl + "dorm/room/showAreaAndFloorInfos", {areaId: areaId}, function (data) {
                    $("#updateRoomName").val(name);
                    $("#updateRoomId").val(id);
                    $("#showAreasUpdate").html(room.loadDepartmentOrDirection(data.data.queryAreaOfRoom, areaId))
                    $("#showFloorsUpdate").html(room.loadDepartmentOrDirection(data.data.queryFloorOfRoom, floorId))
                    form.render()
                    layer.open({
                        type: 1,
                        area: ["30%", "70%"],
                        title: '修改'
                        , content: $("#update")
                    });
                })

            },
            delete: function (id) {
                layer.confirm('确定删除？', {icon: 3, title: '提示'}, function (index) {
                    layer.close(index);
                    $.post(baseUrl + "dorm/room/delete", {id: id}, function (data) {
                        layer.msg(data.msg);
                        setTimeout("location.reload()", 400);
                    })
                });
            },
            updateAjax: function () {
                var idFloor = $("#showFloorsUpdate").val();
                let name = $("#updateRoomName").val();
                let id = $("#updateRoomId").val();
                layer.confirm('确定修改？', {icon: 3, title: '提示'}, function (index) {
                    layer.close(index);
                    $.post(baseUrl + "dorm/room/update", {
                        name: name,
                        id: id,
                        floorId: idFloor
                    }, function (data) {
                        layer.msg(data.msg);

                        if (data.result) {
                            setTimeout("location.reload()", 500);
                        }
                    })
                })
            },
            loadDepartmentOrDirection: function (data, selectId) {
                let _html = "<option value=\"\">直接选择或搜索选择</option>";
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
        $(function () {
            room.list();

            form.on('select(modules_1)', function (data) {
                var id = data.value;

                $.post(baseUrl + "dorm/room/showAreaAndFloorInfos", {areaId: data.value}, function (data) {
                    if (data.result) {
                        var queryAreaOfRoom = data.data.queryAreaOfRoom
                        var queryFloorOfRoom = data.data.queryFloorOfRoom

                        $("#showAreasAdd").html(room.loadDepartmentOrDirection(queryAreaOfRoom, id))
                        $("#showFloorsAdd").html(room.loadDepartmentOrDirection(queryFloorOfRoom, "-"))

                        form.render();
                    }
                })
            })

            form.on('select(modules_2)', function (data) {
                var id = data.value;

                $.post(baseUrl + "dorm/room/showAreaAndFloorInfos", {areaId: data.value}, function (data) {
                    if (data.result) {
                        var queryAreaOfRoom = data.data.queryAreaOfRoom
                        var queryFloorOfRoom = data.data.queryFloorOfRoom

                        $("#showAreasUpdate").html(room.loadDepartmentOrDirection(queryAreaOfRoom, id))
                        $("#showFloorsUpdate").html(room.loadDepartmentOrDirection(queryFloorOfRoom, "-"))

                        form.render();
                    }
                })
            })

            form.on('select(modules_3)', function (data) {
                var id = data.value;

                $.post(baseUrl + "dorm/room/showAreaAndFloorInfos", {areaId: data.value}, function (data) {
                    if (data.result) {
                        var queryAreaOfRoom = data.data.queryAreaOfRoom
                        var queryFloorOfRoom = data.data.queryFloorOfRoom

                        $("#queryAreasInRoom").html(room.loadDepartmentOrDirection(queryAreaOfRoom, id))
                        $("#queryFloorsInRoom").html(room.loadDepartmentOrDirection(queryFloorOfRoom), "-")
                        form.render();
                    }
                })
            })
        });
    });

</script>
        </div>
    </div>
</div>

<script>
    layui.use('element', function(){
        var $ = layui.jquery
            ,element = layui.element(); //Tab的切换功能，切换事件监听等，需要依赖element模块

        //触发事件
        var active = {
            tabAdd: function(){
                //新增一个Tab项
                element.tabAdd('demo', {
                    title: '新选项'+ (Math.random()*1000|0) //用于演示
                    ,content: '内容'+ (Math.random()*1000|0)
                    ,id: new Date().getTime() //实际使用一般是规定好的id，这里以时间戳模拟下
                })
            }
            ,tabDelete: function(othis){
                //删除指定Tab项
                element.tabDelete('demo', '44'); //删除：“商品管理”


                othis.addClass('layui-btn-disabled');
            }
            ,tabChange: function(){
                //切换到指定Tab项
                element.tabChange('demo', '22'); //切换到：用户管理
            }
        };

        $('.site-demo-active').on('click', function(){
            var othis = $(this), type = othis.data('type');
            active[type] ? active[type].call(this, othis) : '';
        });

        //Hash地址的定位
        var layid = location.hash.replace(/^#test=/, '');
        element.tabChange('test', layid);

        element.on('tab(test)', function(elem){
            location.hash = 'test='+ $(this).attr('lay-id');
        });

    });
</script>

<script type="text/javascript" src="${baseurl}/public/common/layui/layui.js"></script>
<script type="text/javascript">
    let totalSize = 10;
    let currentIndex = 1;
    let pageSize = 10;
    let area;
    layui.use(['jquery', 'layer', 'element', 'laypage', 'form', 'laytpl', 'tree'], function () {
        window.jQuery = window.$ = layui.jquery;
        window.layer = layui.layer;
        var element = layui.element(),
            form = layui.form(),
            laytpl = layui.laytpl;


        area = {
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
                            area.list();
                        }
                    }
                });
            },
            list: function () {
                let areaId = $("#queryAreas").val();
                let areaName = $("#queryAreas").find("option:selected").text();
                $.ajax({
                    url: baseUrl + "dorm/area/list",
                    data: {
                        currentIndex: currentIndex,
                        pageSize: pageSize,
                        areaId:areaId,
                        areaName:areaName
                    },
                    success: function (data) {
                        if (data.result) {
                            currentIndex = data.data.pageUtil.currentIndex;
                            totalSize = data.data.pageUtil.totalSize;
                            area.page();
                            $("#queryAreas").html(area.loadSelectElementHtml(data.data.pageInfos),"-")
                            laytpl($("#list-tpl").text()).render(data, function (html) {
                                $( "#list").html(html);
                            });
                            form.render();

                        }
                    }
                });
            },
            loadSelectElementHtml: function (data, type) {
                let _html = `<option value=''></option>`;
                for (let i = 0; i < data.length; ++i) {
                    let isSelected = data[i].id == type ? "selected" : "";
                    _html += ` <option ` + isSelected + `  value="` + data[i].id + `">` + data[i].name + `</option>`;
                }

                return _html;
            },
            add: function () {
                layer.open({
                    type: 1,
                    title: '添加'
                    , content: $("#add")
                });

            },
            addAjax:function () {
                let name = $("#addAreaName").val();
                layer.confirm('确定添加？', {icon: 3, title: '提示'}, function (index) {
                    layer.close(index);
                    $.post(baseUrl + "dorm/area/add", {
                        name: name
                    }, function (data) {
                        layer.msg(data.msg);
                        if (data.result) {
                            setTimeout("location.reload()",500);
                        }
                    })
                })
            },
            update: function (id, name) {
                $("#updateAreaName").val(name);
                $("#updateAreaId").val(id);
                layer.open({
                    type: 1,
                    title: '修改'
                    , content: $("#update")
                });
            },
            delete: function (id) {
                layer.confirm('确定删除？', {icon: 3, title: '提示'}, function (index) {
                    layer.close(index);
                    $.post(baseUrl + "dorm/area/delete", {id: id}, function (data) {
                        layer.msg(data.msg);
                        setTimeout("location.reload()", 400);
                    })
                });
            },
            updateAjax: function () {
                let name = $("#updateAreaName").val();
                let id = $("#updateAreaId").val();
                layer.confirm('确定修改？', {icon: 3, title: '提示'}, function (index) {
                    layer.close(index);
                    $.post(baseUrl + "dorm/area/update", {
                        name: name,
                        id: id
                    }, function (data) {
                        layer.msg(data.msg);

                        if (data.result) {
                            setTimeout("location.reload()", 500);
                        }
                    })
                })
            }
        };
        $(function () {
            area.list();
        });
    });


</script>
</body>
</html>
