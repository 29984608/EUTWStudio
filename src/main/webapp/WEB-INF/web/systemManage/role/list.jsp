<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../../../public/tag.jsp" %>
<%@ include file="../../../public/module.jsp" %>
<html>
<head>
    <meta charset="utf-8">
    <title>layui</title>
    <!-- 加载js文件-->
    <script type="text/javascript" src="${baseurl}/public/common/layui/layui.js"></script>
    <script type="text/javascript" src="${baseurl}/public/common/js/jquery-3.2.0.min.js"></script>
    <link rel="stylesheet" type="text/css" href="${baseurl}/public/common/layui/css/layui.css" media="all">
    <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
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
                    <li class="layui-btn layui-this" onclick="role.addRole()"><i class="layui-icon">&#xe60a;</i>添加角色
                    </li>
                </ul>
            </blockquote>
            <div class="larry-separate"></div>

            <div class="layui-tab-content larry-personal-body clearfix mylog-info-box">
                <div class="layui-form ">
                    <table id="example" class="layui-table lay-even " data-name="articleCatData">
                        <thead>
                        <tr>
                            <th width="30"><input type="checkbox" id="checkall" data-name="checkbox" lay-filter="check"
                                                  lay-skin="primary"></th>
                            <th>序号</th>
                            <th>角色名称</th>
                            <th>是否可用</th>
                            <th width="150">操作</th>
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
<div id="add-subcat" style="margin: 10px;display: none">
    <form id="role-add" lay-filter="role-add" class="layui-form layui-form-pane" method="post">
        <div class="layui-form-item">
            <label class="layui-form-label">角色名称</label>
            <div class="layui-input-inline">
                <input type="text" name="name" required jq-verify="required" jq-error="请输入角色名称"
                       placeholder="请输入角色描述" autocomplete="off" class="layui-input ">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">状态</label>
            <div class="layui-input-inline">
                <input type="radio" name="available" title="启用" value="true" checked/>
                <input type="radio" name="available" title="禁用" value="false"/>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" jq-submit>立即提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
</div>

<div id="tree" style="display: none"></div>
<script id="list-tpl" type="text/html">

    {{# layui.each(d.roles, function(index, item){ }}
    <tr>
        <td>
            <input type="checkbox" name="id" lay-skin="primary">
        </td>
        <td>{{ item.id}}</td>
        <td>{{ item.name}}</td>
        <td>
            <input type="checkbox" name="available" lay-skin="switch" lay-text="开启|关闭" {{#if (item.available=="true"){
                   }}checked="checked" {{# } }}>
        </td>
        <td>
            <button class="layui-btn layui-btn-mini " onclick="role.viewPermission({{item.id}})">
                <i class="iconfont">&#xe649;</i>查看权限
            </button>
            <button class="layui-btn layui-btn-mini " onclick="role.updatePermission({{item.id}})">
                <i class="iconfont">&#xe653;</i>配置权限
            </button>
        </td>
    </tr>
    {{# }); }}

</script>
<script type="text/javascript" src="${baseurl}/public/common/layui/layui.js"></script>
<script type="text/javascript">
    let totalSize = 10;
    let currentIndex = 1;
    let pageSize = 10;
    let role;
    let hasPermission;
    layui.use(['jquery', 'layer', 'element', 'laypage', 'form', 'laytpl', 'tree'], function () {
        window.jQuery = window.$ = layui.jquery;
        window.layer = layui.layer;
        var element = layui.element(),
            form = layui.form(),
            laytpl = layui.laytpl;


        role = {
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
                            role.list();
                        }
                    }
                });
            },
            list: function () {
                $.ajax({
                    url: baseUrl + "userRole/list",
                    data: {currentIndex: currentIndex, pageSize: pageSize},
                    success: function (data) {
                        if (data.result) {
                            currentIndex = data.page.currentIndex;
                            totalSize = data.page.totalSize;
                            role.page();
                            laytpl($("#list-tpl").text()).render(data, function (html) {
                                $("#list").html(html);
                            });
                            form.render();

                        }
                    }
                });

            },
            addRole: function () {
                layer.open({
                    type: 1,
                    title: '角色添加'
                    , content: $("#add-subcat")
                });

            },
            viewPermission: function (roleId) {
                $.ajax({
                    url: baseUrl + "/userRole/viewPermission",
                    data: {roleId: roleId},
                    success: function (data) {
                        if (data.result) {
                            console.log(data)
                            hasPermission = data.data.hasPermissions;
                            let nodes = role.changePermissionToTree(data.data.permissions);

                            role.showRoleTree(nodes);
                        }
                    }
                })

            },
            updatePermission: function (roleId) {

            },
            showRoleTree: function (nodes) {
                $("#tree").html("");
                layui.tree({
                    elem: $("#tree"),
                    nodes: nodes
                });
                layer.open({
                    type: 1,
                    title: '角色权限分配'
                    , content: $("#tree"),
                    area: ['100%', '100%']
                })
            },
            check: function (t, id) {

            },
            changePermissionToTree: function (data) {
                let nodesStr = "[";
                data.forEach(node => {
                    let children = node.children;
                    let checked = node.has === true ? "checked":"";
                    nodesStr += `{"spread":true,`;
                    nodesStr += `"id":` + node.id + `,`;
                    nodesStr += `"name":"<input type='checkbox' `+checked+`  onclick='role.check(this,` + node.id + `)' name='id'   style='position: absolute;' lay-skin='primary'><span style='margin-left: 20px'>` + node.name + '</span>"';
                    if (children.length === 0) {
                        nodesStr += "},"
                    } else {
                        nodesStr += ',"children":[';
                        children.forEach(sideNode => {
                            let permission = sideNode.children;
                            let checked = sideNode.has === true ? "checked":"";
                            nodesStr += `{"spread":true,`;
                            nodesStr += `"id":` + node.id + `,`;
                            nodesStr += `"name":"<input type='checkbox' `+checked+`  onclick='role.check(this,` + sideNode.id + `)' name='id'   style='position: absolute;' lay-skin='primary'><span style='margin-left: 20px'>` + sideNode.name +"</span>";
                            if (permission.length === 0) {
                                nodesStr += '"},';
                            } else {
                                permission.forEach(per => {
                                    let checked = per.has === "true" ? "checked":"";
                                    nodesStr += "<input type='checkbox' id='a3' "+checked+" name='id' onclick='role.check(this,3)' style='position: absolute;margin-left: 5px' lay-skin='primary'>";
                                    nodesStr += "<span style='margin-left: 25px'>" + per.name + "</span>";
                                })
                                nodesStr += '"},';
                            }
                        })
                        nodesStr = nodesStr.substr(0, nodesStr.length - 1) + "]},";
                    }
                })
                nodesStr = nodesStr.substr(0, nodesStr.length - 1)+"]";
                return JSON.parse(nodesStr);
            }
        }
        $(function () {
            role.list();

            form.on('submit(role-add)', function (data) {
                $.ajax({
                    url: baseUrl + "userRole/add",
                    data: $("#role-add").serialize(),
                    success: function (data) {
                        if (data.result) {
                            layer.msg(data.msg);
                            setTimeout("location.reload()", 1000);
                        }
                    }
                });

                return false;
            })


        });
    });


</script>

</html>
