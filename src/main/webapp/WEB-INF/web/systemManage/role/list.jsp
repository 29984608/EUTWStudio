<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../../../public/tag.jsp" %>
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
<script>

</script>
<section class="larry-grid">
    <div class="larry-personal">
        <div class="layui-tab">
            <blockquote class="layui-elem-quote mylog-info-tit">
                <ul class="layui-tab-title">
                    <li class="layui-btn layui-this"><i class="layui-icon">&#xe60a;</i>添加角色</li>
                </ul>
                <button class="layui-btn layui-btn-mini layui-btn-danger ajax" data-params='{"content":".add-subcat", "title":"添加角色","type":"1"}'>
                    <i class="iconfont">&#xe626;</i>删除
                </button>
            </blockquote>
            <div class="larry-separate"></div>
            <div class="layui-tab-content larry-personal-body clearfix mylog-info-box">
                <!-- 操作日志 -->
                <div class="layui-form ">
                    <table id="example" class="layui-table lay-even " data-name="articleCatData">
                        <thead>
                        <tr>
                            <th width="30"><input type="checkbox" id="checkall" data-name="checkbox" lay-filter="check"
                                                  lay-skin="primary"></th>
                            <th>序号</th>
                            <th>角色名称</th>
                            <th>是否可用</th>
                            <th width="142">操作</th>
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
<div class="add-subcat" style="display: none">
    <form id="form1" class="layui-form layui-form-pane" action="${contextPath}/role/create" method="post"  >
        <div class="layui-form-item">
            <label class="layui-form-label">角色名称</label>
            <div class="layui-input-block">
                <input type="text" name="role" required jq-verify="required" jq-error="请输入分类名称" placeholder="请输入分类名称" autocomplete="off" class="layui-input ">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">角色描述</label>
            <div class="layui-input-inline">
                <input type="text" name="description" required jq-verify="required" jq-error="请输入角色描述" placeholder="请输入角色描述" autocomplete="off" class="layui-input ">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">状态</label>
            <div class="layui-input-inline">
                <input type="radio" name="available" title="启用" value="true" checked />
                <input type="radio" name="available" title="禁用" value="false" />
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" jq-submit jq-filter="submit">立即提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
</div>
<%--<script id="list-tpl" type="text/html">--%>
    <%--<table  class="layui-table lay-even" data-name="taskList"  data-tplid="list-tpl">--%>
        <%--<thead>--%>
        <%--<tr>--%>
            <%--<th width="30"><input type="checkbox"  data-name="checkbox" lay-filter="check"--%>
                                  <%--lay-skin="primary"></th>--%>
            <%--<th>序号</th>--%>
            <%--<th>角色名称</th>--%>
            <%--<th>是否可用</th>--%>
            <%--<th width="142">操作</th>--%>
        <%--</tr>--%>
        <%--</thead>--%>
        <%--<tbody>--%>
        <%--{{# layui.each(d.roles, function(index, item){ }}--%>
        <%--<tr>--%>
            <%--<td><input type="checkbox" name="checkbox" value="{{ item.id}}" lay-skin="primary"></td>--%>
            <%--<td>{{ item.name}}</td>--%>
            <%--<td>{{ item.description}}</td>--%>
            <%--<td>--%>
                <%--<input type="checkbox" name="zzz" lay-skin="switch" lay-text="开启|关闭">--%>
            <%--</td>--%>
            <%--<td>--%>
                <%--<button class="layui-btn layui-btn-mini modal-iframe" data-params='{"content": "${contextPath}{{item.actionUrl}}?processId={{item.processId }}&taskId={{item.taskId}}&orderId={{item.orderId}}", "title": "处理","full":"true"}'>--%>
                    <%--<i class="iconfont">&#xe653;</i>处理--%>
                <%--</button>--%>
            <%--</td>--%>
        <%--</tr>--%>
        <%--{{# }); }}--%>
        <%--</tbody>--%>

    <%--</table>--%>
<%--</script>--%>
<script type="text/javascript" src="${baseurl}/public/common/layui/layui.js"></script>
<script type="text/javascript">
    let totalSize = 0;
    let currentIndex = 1;
    let pageSize = 10;
    $(function () {
        role.list();
    });

    layui.use(['jquery', 'layer', 'element', 'laypage', 'form', 'laytpl'], function () {
        window.jQuery = window.$ = layui.jquery;
        window.layer = layui.layer;
        var element = layui.element(),
            form = layui.form();

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
    });

    let role = {
        list: function () {
            $.ajax({
                url: baseUrl + "role/list",
                data: {currentIndex: currentIndex, pageSize: pageSize},
                success: function (data) {
                    if (data.result) {
                        currentIndex = data.page.currentIndex;
                        totalSize = data.page.totalSize;
                        let pageData = data.roles;
                        let _html = "";
                        $("#list").html("");
                        pageData.forEach(role => {
                            let id = role.id;
                            let name = role.name;
                            let isAvailable = role.available === '1' ? 'checked' : '';
                            _html +=`
                             <tr>
                                <td>
                                     <input type="checkbox" name=""  lay-skin="primary" checked>
                                </td>
                                <td>` + id + `</td>
                                <td class="edit">` + name + `</td>
                                <td>
                                    <input type="checkbox" name="zzz" lay-skin="switch" lay-text="开启|关闭">
                                </td>
                                <td>
                                    <button class="layui-btn layui-btn-mini " onclick="">
                                        <i class="iconfont">&#xe649;</i>查看权限
                                    </button>
                                    <button class="layui-btn layui-btn-mini " onclick="">
                                        <i class="iconfont">&#xe653;</i>配置权限
                                    </button>
                                </td>
                            </tr>
                            `

                        })
                        $("#list").append(_html);
                    }
                }
            });

        }
    }
</script>
</body>
</html>
