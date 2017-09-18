<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../../../public/tag.jsp" %>
<html>
<head>
    <meta charset="utf-8">
    <title></title>
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
                <ul class="layui-tab-title">
                    <li class="layui-btn " onclick="menu.addMenu()"><i class="layui-icon">&#xe61f;</i>添加菜单
                    </li>
                </ul>
            </blockquote>
            <div class="larry-separate"></div>

            <div class="layui-tab-content larry-personal-body clearfix mylog-info-box">
                <div class="layui-form ">
                    <table id="example" class="layui-table lay-even " data-name="articleCatData">
                        <thead>
                        <tr>
                            <th>id</th>
                            <th>菜单名称</th>
                            <th>url</th>
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
    let menu;
    layui.use(['jquery', 'layer', 'element', 'laypage', 'form', 'laytpl'], function () {
        window.jQuery = window.$ = layui.jquery;
        window.layer = layui.layer;
        let element = layui.element(),
            form = layui.form(),
            laytpl = layui.laytpl;

        menu = {
            list: function () {
                $.ajax({
                    url: baseUrl + "menu/list",
                    type: "post",
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
            addMenu: function () {
                layer.open({
                    type: 1,
                    title: '菜单添加'
                    , content: $("#add")
                });
            },
            addMenuAjax: function () {
                let data = $("#menu-add").serialize();
                $.post('${baseurl}/menu/addFirstMenu', data, (data) => {
                        layer.msg(data.msg);
                        if (data.result) {
                            setTimeout('location.reload()', 500);
                        }
                    }
                )
            },
            delete: function (id) {
                layer.confirm('确定删除？', {icon: 3, title: '提示'}, function (index) {
                    layer.close(index);
                    $.post(baseUrl + "/menu/delete", {id: id}, function (data) {
                        layer.msg(data.msg);
                        setTimeout("location.reload()", 500);
                    })
                });
            }
            ,
            update: function (id, name, url) {
                $("#update_id").val(id);
                $("#update_name").val(name);
                $("#update_url").val(url);
                layer.open({
                    type: 1,
                    title: '菜单添加'
                    , content: $("#update")
                });
            },
            updateMenuAjax: function () {
                let data = $("#update_form").serialize();
                $.post('${baseurl}/menu/updateFirstMenu', data, (data) => {
                        layer.msg(data.msg);
                        if (data.result) {
                            setTimeout('location.reload()', 500);
                        }
                    }
                )
            }
            ,
            viewPermission: function (roleId) {
            }
            ,
            deletePermission: function (roleId) {

            }
        };
        $(function () {
            menu.list();
        });
    });
</script>
</html>
