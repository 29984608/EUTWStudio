<%@ page contentType="text/html; charset=UTF-8" %>
<script id="list-tpl" type="text/html">
    {{# layui.each(d.classess, function(index, item){ }}
    <tr>
        <td>{{ index+1}}</td>
        <td>{{ item.level}}</td>
        <td>{{ item.name}}</td>
        <td>
            <%--<shiro:hasPermission name="classes:update">--%>
            <button class="layui-btn layui-btn-mini layui-btn-normal"
                    onclick="classes.update('{{item.id}}','{{item.level}}','{{item.name}}','{{item.departmentId}}')">
                <i class="layui-icon">&#xe642;</i>修改
            </button>
            <%--</shiro:hasPermission>--%>
            <%--<shiro:hasPermission name="classes:delete">--%>
            <button class="layui-btn layui-btn-mini  layui-btn-danger" onclick="classes.delete('{{item.id}}')">
                <i class="layui-icon">&#xe60a;</i>删除
            </button>
            <%--</shiro:hasPermission>--%>
        </td>
    </tr>
    {{# }); }}

</script>
<div id="add" style="margin: 10px;display: none">
    <form id="add-form" lay-filter="role-add" class="layui-form layui-form-pane" method="post">
        <div class="layui-form-item">
            <label class="layui-form-label">年级所属系</label>
            <div class="layui-input-inline">
                <select name="departmentId" id="department-add">
                    <option value="">请选择一个系</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">年级代码</label>
            <div class="layui-input-inline">
                <input type="text" name="level"
                       placeholder="请输入年级代码" autocomplete="off" class="layui-input ">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">年级名称</label>
            <div class="layui-input-inline">
                <input type="text" name="name"
                       placeholder="请输入年级名称" autocomplete="off" class="layui-input ">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <a class="layui-btn" onclick="classes.addManualAjax()">立即提交</a>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
</div>
<div id="update" style="margin: 10px;display: none">
    <form id="update-form" lay-filter="role-add" class="layui-form layui-form-pane" method="post">
        <input type="hidden" id="id" name="id"/>
        <div class="layui-form-item">
            <label class="layui-form-label">年级所属系</label>
            <div class="layui-input-inline">
                <select name="departmentId" id="department-update">
                    <option value="">请选择一个系</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">年级代码</label>
            <div class="layui-input-inline">
                <input type="text" id="level" name="level" required jq-verify="required"
                       placeholder="请输入年级代码" autocomplete="off" class="layui-input ">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">年级名称</label>
            <div class="layui-input-inline">
                <input type="text" id="name" name="name" required jq-verify="required"
                       placeholder="请输入年级名称" autocomplete="off" class="layui-input ">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <a class="layui-btn" onclick="classes.updateAjax()">立即提交</a>
            </div>
        </div>
    </form>
</div>