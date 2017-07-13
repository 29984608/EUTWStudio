<%@ page contentType="text/html; charset=UTF-8" %>
<script id="list-tpl" type="text/html">
    {{# layui.each(d.studentInfos, function(index,item){ }}
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
            {{# if(item.depatmentName === undefined){ }}
            未分配
            {{# }else{ }}
            {{ item.depatmentName}}
            {{#}}}
        </td>
        <td>
            {{# if(item.professionName === undefined){ }}
            未分配
            {{# }else{ }}
            {{ item.professionName}}
            {{#}}}
        </td>
        <td>
            {{# if(item.directionName === undefined){ }}
            未分配
            {{# }else{ }}
            {{ item.directionName}}
            {{#}}}
        </td>

        <td>
            {{# if(item.classesName === undefined){ }}
            未分配
            {{# }else{ }}
            {{ item.classesName}}
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
