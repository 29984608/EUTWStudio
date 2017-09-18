<%@ page contentType="text/html; charset=UTF-8" %>
<div id="add" style="margin: 10px;display: none">
    <form id="menu-add" lay-filter="menu-add" class="layui-form layui-form-pane" method="post">
        <div class="layui-form-item">
            <label class="layui-form-label">名称</label>
            <div class="layui-input-inline">
                <input type="text" name="name" required
                       placeholder="" autocomplete="off" class="layui-input ">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">url</label>
            <div class="layui-input-inline">
                <input type="text" name="url" required
                       placeholder="" autocomplete="off" class="layui-input ">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <a class="layui-btn" onclick="menu.addMenuAjax()">添加</a>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
</div>
<div id="update" style="margin: 10px;display: none">
    <form id="update_form" class="layui-form layui-form-pane" method="post">
        <div class="layui-form-item">
            <input type="hidden" id="update_id" name="id"/>
            <label class="layui-form-label">角色名称</label>
            <div class="layui-input-inline">
                <input type="text" id="update_name" name="name" required jq-verify="required" jq-error="请输入角色名称"
                       autocomplete="off" class="layui-input ">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">状态</label>
            <div class="layui-input-inline">
                <input type="radio" id="update_available_true" name="available" title="启用" value="true"/>
                <input type="radio" id="update_available_false" name="available" title="禁用" value="false"/>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <a class="layui-btn" onclick="menu.updateRole()">立即提交</a>
            </div>
        </div>
    </form>
</div>
<div id="tree" style="display: none;padding: 30px 0 0 30px"></div>
<script id="list-tpl" type="text/html">
    {{# layui.each(d.data, function(index, item){ }}
    <tr>
        <td>{{ item.id}}</td>
        <td>{{ item.name}}</td>
        <td>{{ item.url}}</td>
        <td>
            <button class="layui-btn layui-btn-mini " style="background: #21a1a1"
                    onclick="menu.update('{{item.id}}')">
                <i class="layui-icon">&#xe642;</i>修改
            </button>
            <button class="layui-btn layui-btn-mini  layui-btn-danger" onclick="menu.delete('{{item.id}}')">
                <i class="layui-icon">&#xe60a;</i>删除
            </button>
        </td>
    </tr>
    {{# }); }}

</script>