<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../../public/tag.jsp" %>
<html>
<head>
    <title>教师沟通反馈页面</title>
    <script type="text/javascript" src="${baseurl}/public/common/js/jquery-3.2.0.min.js"></script>
    <script src="${baseurl}/public/common/layui/layui.js" charset="utf-8"></script>
    <link rel="stylesheet" href="${baseurl}/public/common/layui/css/layui.css" media="all">
    <link rel="stylesheet" type="text/css" href="${baseurl}/public/common/layui/css/layui.css" media="all">
    <link rel="stylesheet" type="text/css" href="${baseurl}/public/common/bootstrap/css/bootstrap.min.css" media="all">
    <link rel="stylesheet" type="text/css" href="${baseurl}/public/common/css/global.css" media="all">
    <link rel="stylesheet" type="text/css" href="${baseurl}/public/css/common.css" media="all">
    <link rel="stylesheet" type="text/css" href="${baseurl}/public/css/personal.css" media="all">
</head>
<body>
<section class="larry-grid">
    <div class="larry-personal">
        <div class="layui-tab">
            <form class="layui-form" action="">
                <blockquote class="layui-elem-quote mylog-info-tit">

                    <div class="layui-inline">
                        <div class="layui-input-inline" style="width: auto">
                            <select name="modules" lay-verify="required" lay-search="">
                                <option value="">系</option>
                                <option value="1">layer</option>
                                <option value="2">form</option>
                                <option value="3">layim</option>
                                <option value="4">element</option>
                                <option value="5">laytpl</option>
                                <option value="6">upload</option>
                            </select>
                        </div>


                        <div class="layui-input-inline">
                            <select name="modules" lay-verify="required" lay-search="">
                                <option value="">专业</option>
                                <option value="1">layer</option>
                                <option value="2">form</option>
                                <option value="3">layim</option>
                                <option value="4">element</option>
                            </select>
                        </div>

                        <div class="layui-input-inline">
                            <select name="modules" lay-verify="required" lay-search="">
                                <option value="">方向</option>
                                <option value="1">layer</option>
                                <option value="2">form</option>
                                <option value="3">layim</option>
                                <option value="4">element</option>
                                <option value="5">laytpl</option>
                            </select>
                        </div>

                        <div class="layui-input-inline">
                            <div class="layui-input-inline" style="width: 200px">
                                <input name="password" lay-verify="pass" placeholder="请输入学生姓名" autocomplete="off"
                                       class="layui-input" type="text">
                            </div>
                        </div>
                        <button class="layui-btn"><i class="layui-icon">&#xe615;</i>查找</button>
                    </div>

                </blockquote>
                <div class="larry-separate"></div>
                <div class="layui-tab-content larry-personal-body clearfix mylog-info-box">
                    <a class="layui-btn" id="addCommunication"><i class="layui-icon">&#xe608;</i> 添加</a>
                    <a class="layui-btn"><i class="layui-icon">&#xe60a;</i>打印</a>

                    <a class="layui-btn layui-btn-danger"><i class="layui-icon">&#xe640;</i>删除</a>
                    <div class="layui-form">
                        <table class="layui-table">
                            <thead>
                            <tr>
                                <th><input type="checkbox" name="" lay-skin="primary" lay-filter="allChoose">
                                </th>
                                <th>学号</th>
                                <th>姓名</th>
                                <th>沟通时间</th>
                                <th>沟通导师</th>
                                <th>沟通对象</th>
                                <th>沟通方向</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td><input type="checkbox" name="" lay-skin="primary"></td>
                                <td>15610903150627</td>
                                <td>张三</td>
                                <td>1989-10-14</td>
                                <td>张三</td>
                                <td>李四</td>
                                <td>
                                    <p>question：123123</p>
                                </td>
                                <td>
                                    <a class="layui-btn layui-btn-mini"  onclick="seeCommunication()">添加</a>

                                    <a class="layui-btn layui-btn-mini">编辑</a>

                                    <a class="layui-btn layui-btn-mini layui-btn-normal">预览
                                    </a>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div id="demo7"></div>
                </div>
            </form>
        </div>
    </div>
</section>

<div id="addInfo" style="display: none;width: auto">
    <form class="layui-form" action="">
        <div class="layui-form-item">
            <label class="layui-form-label">学生学号</label>
            <div class="layui-input-inline">
                <input name="password" required lay-verify="required" placeholder="请输入密码" autocomplete="off"
                       class="layui-input">
            </div>
        </div>


        <div class="layui-form-item">
            <label class="layui-form-label">学生姓名</label>
            <div class="layui-input-inline">
                <input name="password" required lay-verify="required" placeholder="请输入密码" autocomplete="off"
                       class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">沟通时间</label>
            <div class="layui-input-inline">
                <input name="date" id="date" lay-verify="date" placeholder="yyyy-mm-dd" autocomplete="off"
                       class="layui-input" onclick="layui.laydate({elem: this})" type="text">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">沟通项目</label>
            <div class="layui-input-inline">
                <select name="modules" lay-verify="required" lay-search="">
                    <option value="">专业</option>
                    <option value="1">layer</option>
                    <option value="2">form</option>
                    <option value="3">layim</option>
                    <option value="4">element</option>
                    <option value="5">laytpl</option>
                </select>
            </div>
        </div>


        <div class="layui-form-item">
            <label class="layui-form-label">沟通内容</label>
            <div class="layui-input-block">
                <textarea placeholder="请录入相关沟通内容" class="layui-textarea"></textarea>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
</div>

<div id="seeInfo" style="display: none">
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
        <legend>张三学生沟通反馈记录</legend>
    </fieldset>

    <form class="layui-form" action="">

        <%--<div class="layui-inline">--%>
            <%--<label class="layui-form-label" style="width: auto">学生姓名</label>--%>
            <%--<div class="layui-input-inline">--%>
                <%--<input name="stuNo" lay-verify="stuNo" autocomplete="off" class="layui-input" type="text">--%>
            <%--</div>--%>
        <%--</div>--%>

        <%--<div class="layui-inline">--%>
            <%--<label class="layui-form-label" style="width: auto">学生学号</label>--%>
            <%--<div class="layui-input-inline">--%>
                <%--<input name="stuNo" lay-verify="stuNo" autocomplete="off" class="layui-input" type="text">--%>
            <%--</div>--%>
        <%--</div>--%>
    </form>
</div>

<script>
    layui.use('form', function () {
        var $ = layui.jquery, form = layui.form();

        //全选
        form.on('checkbox(allChoose)', function (data) {
            var child = $(data.elem).parents('table').find('tbody input[type="checkbox"]');
            child.each(function (index, item) {
                item.checked = data.elem.checked;
            });
            form.render('checkbox');
        });

    });

    //分页
    layui.use(['laypage', 'layer'], function () {
        var laypage = layui.laypage
            , layer = layui.layer;

        laypage({
            cont: 'demo7'
            , pages: 100 //总页数
            , groups: 5 //连续显示分页数
        });
    });
</script>

<script>
    $(document).ready(function () {

    })
    
    function seeCommunication() {
        layer.open({
            type: 1,
            title: '沟通反馈记录详细信息',
            area: ['100%', '100%'],
            skin: 'yourclass',
            content: $('#seeInfo'),
        });
    }

    $("#addCommunication").click(function () {
        layer.open({
            type: 1,
            title: '添加沟通反馈记录',
            area: ['100%', '100%'],
            skin: 'yourclass',
            content: $('#addInfo'),
        });
    })

    $("#delCommunication").click(function () {
        layer.open({
            type: 1,
            title: '添加沟通反馈记录',
            area: ['990px', '450px'],
            offset: ['0px', '100px'],
            skin: 'yourclass',
            content: $('#addInfo'),
        });
    })
</script>

<script>
    layui.use('layer', function () { //独立版的layer无需执行这一句
        var $ = layui.jquery, layer = layui.layer; //独立版的layer无需执行这一句

        //触发事件
        var active = {

            notice: function () {
                //示范一个公告层
                layer.open({
                    type: 1
                    ,
                    title: false //不显示标题栏
                    ,
                    closeBtn: false
                    ,
                    area: '300px;'
                    ,
                    shade: 0.8
                    ,
                    id: 'LAY_layuipro' //设定一个id，防止重复弹出
                    ,
                    btn: ['火速围观', '残忍拒绝']
                    ,
                    moveType: 1 //拖拽模式，0或者1
                    ,
                    content: '<div style="padding: 50px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;">你知道吗？亲！<br>layer ≠ layui<br><br>layer只是作为Layui的一个弹层模块，由于其用户基数较大，所以常常会有人以为layui是layerui<br><br>layer虽然已被 Layui 收编为内置的弹层模块，但仍然会作为一个独立组件全力维护、升级。<br><br>我们此后的征途是星辰大海 ^_^</div>'
                    ,
                    success: function (layero) {
                        var btn = layero.find('.layui-layer-btn');
                        btn.css('text-align', 'center');
                        btn.find('.layui-layer-btn0').attr({
                            href: 'http://www.layui.com/'
                            , target: '_blank'
                        });
                    }
                });
            }
            , offset: function (othis) {
                var type = othis.data('type')
                    , text = othis.text();

                layer.open({
                    type: 1
                    , offset: type //具体配置参考：http://www.layui.com/doc/modules/layer.html#offset
                    , id: 'LAY_demo' + type //防止重复弹出
                    , content: '<div style="padding: 20px 100px;">' + text + '</div>'
                    , btn: '关闭全部'
                    , btnAlign: 'c' //按钮居中
                    , shade: 0 //不显示遮罩
                    , yes: function () {
                        layer.closeAll();
                    }
                });
            }
        };

        $('.site-demo-button .layui-btn').on('click', function () {
            var othis = $(this), method = othis.data('method');
            active[method] ? active[method].call(this, othis) : '';
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
            ,stuNo:function (value) {
                if (value.length<14){
                    return '请输入正确格式的学号';
                }
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
