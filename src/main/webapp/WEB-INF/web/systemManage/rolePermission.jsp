<%--
  Created by IntelliJ IDEA.
  User: acey
  Date: 17-6-22
  Time: 下午5:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>layui</title>
    <!-- 加载js文件-->
    <script type="text/javascript" src="../../common/layui/layui.js"></script>
    <script type="text/javascript" src="../../common/js/jquery-3.2.0.min.js"></script>
    `
    <link rel="stylesheet" type="text/css" href="../../common/layui/css/layui.css" media="all">
    <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>
<body>

<fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
    <legend>面板嵌套</legend>
</fieldset>
<form class="layui-form layui-form-pane" action="">
    <div class="layui-collapse" lay-accordion="">
        <div class="layui-colla-item">
            <h2 class="layui-colla-title">信息管理 <span style="float: right"><input type="checkbox" name="yyy" lay-skin="switch" lay-text="开|关" checked></span></h2>
            <div class="layui-colla-content layui-show">

                <div class="layui-collapse" lay-accordion="">
                    <div class="layui-collapse" lay-accordion="">
                        <input type="checkbox" name="" title="增" checked>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="checkbox" name="" title="删" checked>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="checkbox" name="" title="改" checked>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="checkbox" name="" title="查" checked>
                    </div>
                    <div class="layui-colla-item">
                        <h2 class="layui-colla-title" style="width: auto">课程表<span style="float: right"><input type="checkbox" name="yyy" lay-skin="switch" lay-text="开|关" checked></span></h2>
                        <div class="layui-colla-content layui-show">

                            <div class="layui-collapse" lay-accordion="">
                                <input type="checkbox" name="" title="增" checked>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <input type="checkbox" name="" title="删" checked>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <input type="checkbox" name="" title="改" checked>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <input type="checkbox" name="" title="查" checked>
                            </div>

                        </div>
                    </div>
                    <div class="layui-colla-item">
                        <h2 class="layui-colla-title">专业表<span style="float: right"><input type="checkbox" name="zzz" lay-skin="switch" lay-text="开|关"></span></h2>
                        <div class="layui-colla-content">
                            <input type="checkbox" name="" title="增" checked>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="checkbox" name="" title="删" checked>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="checkbox" name="" title="改" checked>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="checkbox" name="" title="查" checked>
                        </div>
                    </div>
                    <div class="layui-colla-item">
                        <h2 class="layui-colla-title">方向表<span style="float: right"><input type="checkbox" name="zzz" lay-skin="switch" lay-text="开|关"></h2>
                        <div class="layui-colla-content">
                            <input type="checkbox" name="" title="增" checked>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="checkbox" name="" title="删" checked>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="checkbox" name="" title="改" checked>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="checkbox" name="" title="查" checked>
                        </div>
                    </div>
                    <div class="layui-colla-item">
                        <h2 class="layui-colla-title">学生信息表<span style="float: right"><input type="checkbox" name="zzz" lay-skin="switch" lay-text="开|关"></h2>
                        <div class="layui-colla-content">
                            <input type="checkbox" name="" title="增" checked>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="checkbox" name="" title="删" checked>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="checkbox" name="" title="改" checked>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="checkbox" name="" title="查" checked>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
</form>

<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
    layui.use(['element', 'layer'], function () {
        var element = layui.element();
        var layer = layui.layer;

        //监听折叠
        element.on('collapse(test)', function (data) {
            layer.msg('展开状态：' + data.show);
        });
    });
</script>

<script>
    layui.use(['form', 'layedit', 'laydate'], function () {
        var form = layui.form()
            , layer = layui.layer
            , layedit = layui.layedit
            , laydate = layui.laydate;

        //创建一个编辑器
        var editIndex = layedit.build('LAY_demo_editor');

        //自定义验证规则
        form.verify({
            title: function (value) {
                if (value.length < 5) {
                    return '标题至少得5个字符啊';
                }
            }
            , pass: [/(.+){6,12}$/, '密码必须6到12位']
            , content: function (value) {
                layedit.sync(editIndex);
            }
        });

        //监听指定开关
        form.on('switch(switchTest)', function (data) {
            layer.msg('开关checked：' + (this.checked ? 'true' : 'false'), {
                offset: '6px'
            });
            layer.tips('温馨提示：请注意开关状态的文字可以随意定义，而不仅仅是ON|OFF', data.othis)
        });

        //监听提交
        form.on('submit(demo1)', function (data) {
            layer.alert(JSON.stringify(data.field), {
                title: '最终的提交信息'
            })
            return false;
        });
    });
</script>


</body>
</html>
