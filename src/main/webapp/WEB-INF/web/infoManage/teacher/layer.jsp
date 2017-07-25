<%@ page contentType="text/html; charset=UTF-8" %>
<script id="list-tpl" type="text/html">
    {{# layui.each(d.teachers, function(index, item){ }}
    <tr>
        <td>{{ index+1}}</td>
        <td>{{ item.no}}</td>
        <td>{{ item.name}}</td>
        <td>{{ item.gender}}</td>
        <td>{{ item.classify}}</td>
        {{ } }}
        <td>
            <shiro:hasPermission name="teacher:update">
            <button class="layui-btn layui-btn-mini layui-btn-normal"
                    onclick="teacher.update('{{item.no}}','{{item.departmentId}}','{{item.directionId}}','{{item.name}}','{{item.gender}}','{{ item.classify}}','{{item.deptId}}')">
                <i class="layui-icon">&#xe642;</i>修改
            </button>
            </shiro:hasPermission>
            <shiro:hasPermission name="teacher:delete">
            <button class="layui-btn layui-btn-mini  layui-btn-danger" onclick="teacher.delete('{{item.no}}')">
                <i class="layui-icon">&#xe60a;</i>删除
            </button>
            </shiro:hasPermission>
        </td>
    </tr>
    {{# }); }}

</script>
<div id="add" style="margin: 10px;display: none">
    <form id="add-form" lay-filter="role-add" class="layui-form layui-form-pane" method="post">
        <div class="layui-form-item">
            <label class="layui-form-label">工号</label>
            <div class="layui-input-inline">
                <input type="text" name="no"  lay-verify="required"
                       placeholder="请输入工号" id="no-add" autocomplete="off" class="layui-input ">
            </div>
            <label class="layui-form-label">名字</label>
            <div class="layui-input-inline">
                <input type="text" name="name"
                       placeholder="请输入名称" id="name-add" autocomplete="off" class="layui-input ">
            </div>
            <label class="layui-form-label">性别</label>
            <div class="layui-input-inline">
                <input type="radio" name="gender" value="男" title="男">
                <input type="radio" name="gender" value="女" title="女" checked>
            </div>

            <label class="layui-form-label">所属类别</label>
            <div class="layui-input-inline">
                <select id="classify" name="classify"  lay-filter="classify">
                    <option value="1">职业导师</option>
                    <option value="2">行政</option>
                    <option value="3">社区导员</option>
                </select>
            </div>
        </div>
        <div id="show_career">
            <div class="layui-form-item" >
                <label class="layui-form-label">所属系</label>
                <div class="layui-input-inline">
                    <select id="department" name="departmentId"  lay-filter="department">
                        <option value="" >请选择一个系</option>

                    </select>
                </div>
                <label class="layui-form-label">所属方向</label>
                <div class="layui-input-inline">
                    <select id="direction" name="directionId" lay-verify="">
                        <option value="" >请选择一个方向</option>

                    </select>
                </div>
            </div>

            <label class="layui-form-label" style="margin-bottom: 20px">可选班级</label>
            <div id="classes" >

            </div>
        </div>
        <div id="show_dept" style="display: none">
            <div class="layui-form-item" >
                <label class="layui-form-label">部门</label>
                <div class="layui-input-inline">
                    <select id="dept" name="deptId"  lay-filter="department">
                        <option value="0">请选择一个部门</option>

                    </select>
                </div>

            </div>

        </div>

        <div id="show_community" style="display: none">
            <div class="layui-form-item">
                <label class="layui-form-label">区号</label>
                <div class="layui-input-inline" >
                <select lay-filter="queryAreaOfRoom" name="areaId" id="queryAreaOfRoom">
                    <option value="">选择区号</option>
                </select>
            </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">层号</label>
                <div id="floor" >

                </div>
            </div>
        </div>
        <div class="layui-form-item" style="margin-top: 30px">
            <div class="layui-input-block">
                <a class="layui-btn"  onclick="teacher.addAjax()">立即提交</a>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
</div>
<div id="update" style="margin: 10px;display: none">
    <form id="update-form" lay-filter="role-add" class="layui-form layui-form-pane" method="post">
        <input type="hidden" name="no" id="id">
        <div class="layui-form-item">
            <label class="layui-form-label">工号</label>
            <div class="layui-input-inline">
                <input type="text"
                       placeholder="请输入工号" disabled id="no-update" autocomplete="off" class="layui-input ">
            </div>
            <label class="layui-form-label">名字</label>
            <div class="layui-input-inline">
                <input type="text" name="name"
                       placeholder="请输入名称" id="name-update" autocomplete="off" class="layui-input ">
            </div>
            <label class="layui-form-label">性别</label>
            <div class="layui-input-inline">
                <input type="radio" name="gender" id="gender-man" value="男" title="男">
                <input type="radio" name="gender" id="gender-woman" value="女" title="女" >
            </div>
            <label class="layui-form-label">所属类别</label>
            <input type="hidden" name="classify" id="classify_hidden">
            <div class="layui-input-inline">
                <input type="text" disabled name="classify" id="classify_text" autocomplete="off" class="layui-input " >
            </div>
        </div>


        <div id="show_career_update">
            <div class="layui-form-item" >
                <label class="layui-form-label">所属系</label>
                <div class="layui-input-inline">
                    <select id="department-update" name="departmentId"  lay-filter="department">
                        <option value="" >请选择一个系</option>

                    </select>
                </div>
                <label class="layui-form-label">所属方向</label>
                <div class="layui-input-inline">
                    <select id="direction-update" name="directionId" lay-verify="">
                        <option value="" >请选择一个方向</option>

                    </select>
                </div>
            </div>
            <label class="layui-form-label" style="margin-bottom: 20px">可选班级</label>
            <div class="layui-form-mid layui-word-aux">修改了系,那么原来的班级就会被删除!</div>
            <div id="classes-update" >

            </div>
        </div>
        <div id="show_dept_update" >
            <div class="layui-form-item" >
                <label class="layui-form-label">部门</label>
                <div class="layui-input-inline">
                    <select id="dept_update" name="deptId"  lay-filter="department">
                        <option value="0">请选择一个部门</option>

                    </select>
                </div>
            </div>
        </div>

        <div class="layui-form-item" style="margin-top: 30px">
            <div class="layui-input-block">
                <a class="layui-btn" lay-submit lay-filter="submit_a" onclick="teacher.updateAjax()">确定修改</a>
            </div>
        </div>
    </form>
</div>