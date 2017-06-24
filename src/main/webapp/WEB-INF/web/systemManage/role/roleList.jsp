<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script id="list-tpl" type="text/html" data-params='{"url":"${baseurl}/role/list","dataName":"rolelist","pageid":"#page","data":"pagesize=10"}'>
    <table id="example" class="layui-table lay-even" data-name="articleCatData" data-tplid="list-tpl">
        <thead>
        <tr>
            <th width="30"><input type="checkbox" id="checkall" data-name="checkbox" lay-filter="check" lay-skin="primary"></th>
            <th width="80">序号
                <div class="order-box">
                    <a href="javascript:;" class="sort" data-filed="id" data-asc="true"><i class="iconfont" >&#xe615;</i></a>
                    <a href="javascript:;" class="sort down" data-filed="id"><i class="iconfont">&#xe647;</i></a>
                </div>
            </th>
            <th>角色名称</th>
            <th width="40">角色描述</th>
            <th width="40">状态</th>
            <th width="240">操作</th>
        </tr>
        </thead>
        <tbody>
        {{# layui.each(d.list, function(index, item){ }}
        <tr>
            <td><input type="checkbox" name="checkbox" value="{{ item.id}}" lay-skin="primary"></td>
            <td>{{ item.id}}</td>
            <td class="edit" data-list='{"key":"id={{ item.id}}","filed":"title","render":"true"}' data-params='{"url":"./data/success.json","data":"id={{ item.id}}"}'>{{ item.role}}</td>
            <td>{{item.name}}</td>
            <td><input type="checkbox" name="switch" lay-skin="switch" lay-text="启用|禁用" {{#if (item.available){ }}checked="checked" {{# } }} lay-filter="ajax" data-params='{"url":"${contextPath}/role/updateStatus","data":"id={{ item.id}}&status={{item.available}}","method":"post"}'></td>
            <td>
                <button class="layui-btn layui-btn-mini " onclick="viewPermisson({{item.id}});">
                    <i class="iconfont">&#xe649;</i>查看权限
                </button>
                <button class="layui-btn layui-btn-mini " onclick="setPermission({{item.id}});" >
                    <i class="iconfont">&#xe653;</i>配置权限
                </button>
            </td>
        </tr>
        {{# }); }}
        </tbody>

    </table>
</script>
<div  id="permission"  style="display: none"/>
    <div >
        <ul id="permission_tree" class="ztree"></ul>
    </div>
</div>
<div  id="viewper"  style="display: none"/>
<div >
    <ul id="viewper_tree" class="ztree"></ul>
</div>
</div>
<input type="hidden" id="pers"/>
<input type="hidden" id="infoString"/>
<script>
    function setPermission(roleId) {
        $("#permission_tree").empty();
         checkInfo(roleId)
        $.post("${contextPath}/role/getPermission", {roleId: roleId}, function (data) {
            if (data.success) {
                var zNodes = data.nodes;
                var zTree = $.fn.zTree.init($("#permission_tree"), setting, zNodes);
                var nodes = zTree.getNodes;
                var info =$("#infoString").val();
                for(var i=0;i<nodes.length;i++){
                    if(!nodes[i].isParent ){
                        var id=nodes[i].id;
                        alert(info+"=========="+id)
                         if (info.indexOf("add"+id) > 0){
                             $("#add"+nodes.id).prop("checked", "checked");
                         }
                        if (info.indexOf("update"+id) > 0){
                            $("update"+nodes.id).prop("checked", "checked");
                        }
                        if (info.indexOf("del"+id) > 0){
                            $("#del"+nodes.id).prop("checked", "checked");
                        }
                        if (info.indexOf("check"+id) > 0){
                            $("#check"+nodes.id).prop("checked", "checked");
                        }
                    }
                }
            } else {
                layer.msg("查询失败!")
            }
        })
        layer.open({
            type: 1,
            title: "配置权限",
            area: ['550px', '550px'],
            fixed: false, //不固定
            maxmin: true,
            content: $('#permission'),
            btn: ['保存','取消'],
            yes: function(index){
                getCheckedPermission();
                $.post("${contextPath}/role/savePermission", {permissions:  $("#pers").val(),roleId: roleId}, function (data) {
                    if(data.success){
                        layer.msg('更改成功');
                        layer.close(index);
                        location.reload()
                    }else {
                        layer.msg('更改失败')
                    }
                })
            }
        })
    }
    function addDiyDom(treeId, treeNode) {
        var aObj = $("#" + treeNode.tId + "_a");
        if(!treeNode.isParent){
        var id=treeNode.id;
        var infoString = $("#infoString").val();

        var editStr =""
         if (infoString.indexOf("add" + id)>=0){
             editStr+="&nbsp;<input type='checkbox' id='add"+id+"' value='add' class='add'  onchange='clickCheckbox(id,this.checked);' checked/>&nbsp;新增&nbsp;"
         }else{
             editStr+=editStr+="&nbsp;<input type='checkbox' id='add"+id+"' value='add'  onchange='clickCheckbox(id,this.checked);' class='add' />&nbsp;新增&nbsp;"
         }
         if (infoString.indexOf("update" + id)>=0){
             editStr+="<input type='checkbox' id='update"+id+"' value='update' class='update' onchange='clickCheckbox(id,this.checked);' checked/>&nbsp;修改&nbsp;"
         }else{
             editStr+="<input type='checkbox' id='update"+id+"' value='update' class='update' onchange='clickCheckbox(id,this.checked);' />&nbsp;修改&nbsp;"
         }
         if (infoString.indexOf("del" + id)>=0){
                editStr+="<input type='checkbox' id='del"+id+"' value='del' class='del' onchange='clickCheckbox(id,this.checked);' checked/>&nbsp;删除&nbsp;"
            }else{
                editStr+="<input type='checkbox' id='del"+id+"' value='del' class='del' onchange='clickCheckbox(id,this.checked);' />&nbsp;删除&nbsp;"
         }
        if (infoString.indexOf("check" + id)>=0){
                editStr+="<input type='checkbox' id='check"+id+"' value='check' class='check' onchange='clickCheckbox(id,this.checked);' checked/>&nbsp;查看&nbsp;"
            }else{
                editStr+="<input type='checkbox' id='check"+id+"' value='check' class='check' onchange='clickCheckbox(id,this.checked);' />&nbsp;查看&nbsp;"
         }
            +
            +
         /*   +"<input type='checkbox' id='sel"+id+"' value='sel' class='sel'/>&nbsp;查询&nbsp;"*/
            +
        aObj.append(editStr);
        }
    };
    var setting = {
        check: {
            enable: true,
            chkboxType: {"Y" : "ps", "N" : "ps"},
        },
        data: {
            simpleData: {
                enable: true,
                idKey: "id",
                pIdKey: "pId",
                rootPId: 0
            }
        },
        view:{
            addDiyDom: addDiyDom
        },
        callback:{
            onCheck:onCheck
        }
    };
    function onCheck(e,treeId,treeNode){
        var isChecked = treeNode.checked;
        if(isChecked){
            callBackNodeChecked(treeNode);
        }else{
            callBackRemoveChecked(treeNode);
        }
       /* alert(adds.join())*/
/*        var pers = [];
        $('input:checked').each(function(){
            var sfruit=$(this).val();
            pers.push(sfruit);
        });*/
 //       alert(pers.join());
     /*   $("#orgids").val(ids);*/
     /*    alert(ids.join())*/
    }
    function getCheckedPermission() {
        var treeObj=$.fn.zTree.getZTreeObj("permission_tree"),
            nodes=  treeObj.transformToArray(treeObj.getNodes()); // 将 zTree 节点数据转换为简单 Array 格式
/*        for(var node in treeObj.transformToArray(nodes)) { //转换成数组
            alert(node)
        }*/
        var adds = [];
        for(var i=0;i<nodes.length;i++){
              var nodeId="";
               if (nodes[i].checked){
                 nodeId=nodes[i].id+"#"+"*";
               }
              adds.push(nodeId);
                var oper1="";
                if( document.getElementById("add"+nodes[i].id)!=null&&  document.getElementById("add"+nodes[i].id).checked){
                    oper1+=nodes[i].id+"#"+$("#add"+nodes[i].id).val();
                    adds.push(oper1);
                }
                var oper2="";
                if( document.getElementById("update"+nodes[i].id)!=null&&  document.getElementById("update"+nodes[i].id).checked){
                    oper2+=nodes[i].id+"#"+$("#update"+nodes[i].id).val();
                    adds.push(oper2);
                }
                var oper3="";
                if( document.getElementById("del"+nodes[i].id)!=null&&  document.getElementById("del"+nodes[i].id).checked){
                    oper3+=nodes[i].id+"#"+$("#del"+nodes[i].id).val();
                    adds.push(oper3);
                }
                var oper4="";
                if( document.getElementById("check"+nodes[i].id)!=null&&  document.getElementById("check"+nodes[i].id).checked){
                    oper4+=nodes[i].id+"#"+$("#check"+nodes[i].id).val();
                    adds.push(oper4);
                }
        }
        $("#pers").val(adds);

    }
    function callBackNodeChecked(nodes){
        if(nodes.isParent){
            var treeObj = $.fn.zTree.getZTreeObj("permission_tree");
            treeObj.expandNode(nodes, false, true, true);
            //如果为父选中父节点
            $("#add"+nodes.id).prop("checked", "checked");
            $("#update"+nodes.id).prop("checked", "checked");
            $("#del"+nodes.id).prop("checked", "checked");
            $("#check"+nodes.id).prop("checked", "checked");
            var child=nodes.children;
            if(child.length>0){
                for(var i=0;i<child.length;i++){
                    if(child[i].isParent){
                        $("#add"+child[i].id).prop("checked", "checked");
                        $("#update"+child[i].id).prop("checked", "checked");
                        $("#del"+child[i].id).prop("checked", "checked");
                        $("#check"+child[i].id).prop("checked", "checked");
                        callBackNodeChecked(child[i]);
                    }else{
                        var node = treeObj.getNodeByParam("id", id, null)
                        treeObj.checkNode(node, true,false);
                        treeObj.selectNode(node);
                        $("#add"+child[i].id).prop("checked", "checked");
                        $("#update"+child[i].id).prop("checked", "checked");
                        $("#del"+child[i].id).prop("checked", "checked");
                        $("#check"+child[i].id).prop("checked", "checked");
                    }
                }
            }
        }else{
            $("#add"+nodes.id).prop("checked", "checked");
            $("#update"+nodes.id).prop("checked", "checked");
            $("#del"+nodes.id).prop("checked", "checked");
            $("#check"+nodes.id).prop("checked", "checked");
        }
    }
    function callBackRemoveChecked(nodes){
        if(nodes.isParent){
            var treeObj = $.fn.zTree.getZTreeObj("permission_tree");
            treeObj.expandNode(nodes, true, true, true);
            $("#add"+nodes.id).prop("checked",false);
            $("#update"+nodes.id).prop("checked",false);
            $("#del"+nodes.id).prop("checked",false);
            $("#sel"+nodes.id).prop("checked",false);
            $("#check"+nodes.id).prop("checked",false);
            $("#sort"+nodes.id).prop("checked",false);
            $("#batchDel"+nodes.id).prop("checked",false);
            var child=nodes.children;
            if(child.length>0){
                for(var i=0;i<child.length;i++){
                    if(child[i].isParent){
                        $("#add"+child[i].id).prop("checked",false);
                        $("#update"+child[i].id).prop("checked", false);
                        $("#del"+child[i].id).prop("checked", false);
                        $("#sel"+child[i].id).prop("checked", false);
                        $("#check"+child[i].id).prop("checked", false);
                        $("#sort"+child[i].id).prop("checked", false);
                        $("#batchDel"+child[i].id).prop("checked",false);
                        callBackRemoveChecked(child[i]);
                    }else{
                        $("#add"+child[i].id).prop("checked",false);
                        $("#update"+child[i].id).prop("checked", false);
                        $("#del"+child[i].id).prop("checked", false);
                        $("#sel"+child[i].id).prop("checked", false);
                        $("#check"+child[i].id).prop("checked", false);
                        $("#sort"+child[i].id).prop("checked", false);
                        $("#batchDel"+child[i].id).prop("checked",false);
                    }
                }
            }
        }else{
            $("#add"+nodes.id).prop("checked",false);
            $("#update"+nodes.id).prop("checked",false);
            $("#del"+nodes.id).prop("checked",false);
            $("#sel"+nodes.id).prop("checked",false);
            $("#check"+nodes.id).prop("checked",false);
            $("#sort"+nodes.id).prop("checked",false);
            $("#batchDel"+nodes.id).prop("checked",false);
        }
    }
    function checkInfo(roleId) {
        $.post("${contextPath}/role/checkInfo", {roleId: roleId}, function (data) {
            if (data.success) {
                var  permissions= data.permissions;
                var info=""
                $.each(permissions,function(index,per){
                    info+=per.permission+per.resourceId+","
                })
                $("#infoString").val(info);
            } else {
                layer.msg("查询失败!")
                return false;
            }
        })
    }
    /**
     * 查看角色权限
     * @param roleId
     */
    function viewPermisson(roleId) {
        $("#permission_tree").empty();
        checkInfo(roleId)
        $.post("${contextPath}/role/getViewPermission", {roleId: roleId}, function (data) {
            if (data.success) {
                var zNodes = data.nodes;
                var zTree = $.fn.zTree.init($("#permission_tree"), setting1, zNodes);
                var nodes = zTree.getNodes;
            } else {
                layer.msg("查询失败!")
            }
        })
        layer.open({
            type: 1,
            title: "拥有的权限",
            area: ['550px', '450px'],
            fixed: false, //不固定
            maxmin: true,
            content: $('#permission')
        })
    }
    var setting1 = {
        data: {
            simpleData: {
                enable: true,
                idKey: "id",
                pIdKey: "pId",
            }
        },
        view:{
            addDiyDom: addDiyDomView
        }
    };
    /**
     * 自定义控件父子关联关系
     * @param id
     * @param checked
     */
    function clickCheckbox(id,checked){
        var value = id.replace(/[^0-9]/ig,"");
        var treeObj = $.fn.zTree.getZTreeObj("permission_tree");
        if (checked){
            var node = treeObj.getNodeByParam("id", value, null)
            treeObj.checkNode(node, true,true);
            treeObj.selectNode(node);
        }
        if(!$("#add" + value).prop("checked")&&!$("#update" + value).prop("checked")&&!$("#check" + value).prop("checked")&&!$("#del" + value).prop("checked")){
            var node = treeObj.getNodeByParam("id", value, null)
            treeObj.checkNode(node, false,false);
        }
    }
    function addDiyDomView(treeId, treeNode) {
        var aObj = $("#" + treeNode.tId + "_a");
        if(!treeNode.isParent){
            var id=treeNode.id;
            var infoString = $("#infoString").val();
            var editStr =""
            if (infoString.indexOf("add" + id)>=0){
                editStr+="&nbsp;<input type='checkbox' id='add"+id+"' value='add' class='add'  checked disabled/>&nbsp;新增&nbsp;"
            }
            if (infoString.indexOf("update" + id)>=0) {
                editStr += "<input type='checkbox' id='update" + id + "' value='update' class='update' disabled checked/>&nbsp;修改&nbsp;"
            }
            if (infoString.indexOf("del" + id)>=0) {
                editStr += "<input type='checkbox' id='del" + id + "' value='del' class='del' disabled checked/>&nbsp;删除&nbsp;"
            }
            if (infoString.indexOf("check" + id)>=0){
                editStr+="<input type='checkbox' id='check"+id+"' value='check' class='check' disabled checked/>&nbsp;查看&nbsp;"
            }
             aObj.append(editStr);
        }
    };
</script>
<%--<%@ include file="./viewtree.jsp"%>--%>
