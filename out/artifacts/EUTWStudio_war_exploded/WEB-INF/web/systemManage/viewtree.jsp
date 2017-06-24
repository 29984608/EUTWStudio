<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script>
    function viewPermisson(roleId) {
        $("#viewper").empty();
        $.post("${contextPath}/role/getViewPermission", {roleId: roleId}, function (data) {
            if (data.success) {
                var zNodes = data.nodes;
                var zTree = $.fn.zTree.init($("#viewper_tree"), setting1, zNodes);
                alert(zTree)
                var nodes = zTree.getCheckedNodes(true);
            } else {
                layer.msg("查询失败!")
            }
        })
        layer.open({
            type: 1,
            title: "拥有权限",
            area: ['550px', '550px'],
            fixed: false, //不固定
            maxmin: true,
            content: $('#viewper')
        })
    }
    var setting1 = {
        check: {
            enable: true,
            /*  chkboxType: {"Y" : "ps", "N" : "ps"},*/
            chkboxType: {"Y" : "", "N" : ""}
        },
        data: {
            simpleData: {
                enable: true,
                idKey: "id",
                pIdKey: "pId",
                rootPId: 0
            }
        },
        callback:{
            onCheck:onCheck
        }
    };

</script>
