<%@ page contentType="text/html; charset=UTF-8" %>
<script id="list-tpl" type="text/html">
    {{# layui.each(d.student, function(index,item){ }}
    <tr>
        <td>
            {{# if(item.no === undefined){ }}
            未分配
            {{# }else{ }}
            {{ item.no}}
            {{#}}}
        </td>

        <td>
            {{# if(item.name === undefined){ }}
            未分配
            {{# }else{ }}
            {{ item.name}}
            {{#}}}
        </td>
        <td>
            {{# if(item.gender === undefined){ }}
            未分配
            {{# }else{ }}
            {{ item.gender}}
            {{#}}}
        </td>
        <td>
            {{# if(item.department === undefined){ }}
            未分配
            {{# }else{ }}
            {{ item.department}}
            {{#}}}
        </td>
        <td>
            {{# if(item.level === undefined){ }}
            未分配
            {{# }else{ }}
            {{ item.level}}
            {{#}}}
        </td>
        <td>
            {{# if(item.stay_type === "1"){ }}
            校内
            {{# }else{ }}
            校外
            {{#}}}
        </td>
        <td>
            {{# if(item.profession === undefined){ }}
            未分配
            {{# }else{ }}
            {{ item.profession}}
            {{#}}}
        </td>
        <td>
            {{# if(item.direction === undefined){ }}
            未分配
            {{# }else{ }}
            {{ item.direction}}
            {{#}}}
        </td>

        <td>
            {{# if(item.classes === undefined){ }}
            未分配
            {{# }else{ }}
            {{ item.classes}}
            {{#}}}
        </td>

        <td>
            {{# if(item.area === undefined){ }}
            未分配
            {{# }else{ }}
            {{ item.area}}
            {{#}}}
        </td>

        <td>
            {{# if(item.floor === undefined){ }}
            未分配
            {{# }else{ }}
            {{ item.floor}}
            {{#}}}
        </td>

        <td>
            {{# if(item.room === undefined){ }}
            未分配
            {{# }else{ }}
            {{ item.room}}
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
