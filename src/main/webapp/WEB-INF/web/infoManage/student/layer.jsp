<%@ page contentType="text/html; charset=UTF-8" %>
<script id="list-tpl" type="text/html">
    {{# layui.each(d.studentInfos, function(index,item){ }}
    <tr>
        <th><input type="checkbox" value="{{item.no}}-{{item.name}}" class="no_checkbox" name="" lay-skin="primary"></th>
        <td>{{ item.no}}</td>
        <td>{{ item.name}}</td>
        <td>{{ item.rename}}</td>
        <td>{{ item.birthday}}</td>
        <td>{{ item.idcard}}</td>
        <td>
            {{# if(item.classes === undefined){ }}
            未分配
            {{# }else{ }}
            {{ item.classes}}
            {{#}}}
        </td>
        <td>

            <%--<shiro:hasPermission name="communication:update">--%>
            <button class="layui-btn layui-btn-mini layui-btn-normal"
                    onclick="communication.previewOrUpdate('{{ item.name}}','{{item.no}}','update')">
                <i class="layui-icon">&#xe642;</i>修改
            </button>
            <%--</shiro:hasPermission>--%>
            <%--<shiro:hasPermission name="communication:delete">--%>
            <button class="layui-btn layui-btn-mini  " onclick="communication.previewOrUpdate('{{ item.name}}','{{item.no}}','preview')">
                <i class="layui-icon">&#xe60a;</i>预览
            </button>
            <%--</shiro:hasPermission>--%>
        </td>
    </tr>
    {{# }); }}

</script>
