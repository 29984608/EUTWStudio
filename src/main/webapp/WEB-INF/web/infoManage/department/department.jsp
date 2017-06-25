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
                <div class="larry-separate"></div>
                <div class="layui-tab-content larry-personal-body clearfix mylog-info-box">
                    <a class="layui-btn"><i class="layui-icon">&#xe621;</i>打印</a>
                    <a class="layui-btn"><i class="layui-icon">&#xe61e;</i>导出</a>
                    <div class="layui-form">
                        <table class="layui-table">
                            <colgroup>
                                <col width="50">
                                <col width="200">
                                <col width="200">
                                <col width="150">
                                <col width="200">
                                <col width="280">
                            </colgroup>

                            <thead>
                            <tr>
                                <th><input type="checkbox" name="" lay-skin="primary" lay-filter="allChoose"></th>
                                <th>编号</th>
                                <th>系代码</th>
                                <th>系名称</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td><input type="checkbox" name="" lay-skin="primary"></td>
                                <td>01</td>
                                <td>8405</td>
                                <td>物流贸易系</td>
                                <td>
                                    <a class="layui-btn  layui-btn-small layui-btn-normal"  onclick="updatainfo()"><i class="layui-icon">&#xe642;</i> 编辑</a>
                                    <a class="layui-btn  layui-btn-small" onclick="InfoPreview()"><i class="layui-icon">&#xe60a;</i>预览</a>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div id="demo7"></div>
                </div>
                <div id="demo1"></div>
            </form>
        </div>
    </div>
</section>

<div id="updatainfo" style="display: none;width: auto;">
    <div >
        <form class="layui-form"   action="">
            <div class="layui-form-item">
                <label class="layui-form-label">系代码</label>
                <div class="layui-input-inline">
                    <input name="password" required lay-verify="required" placeholder="系代码" autocomplete="off"
                           class="layui-input">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">系名称</label>
                <div class="layui-input-inline">
                    <select name="modules" lay-verify="required" lay-search="">
                        <option value="">系名称</option>
                        <option value="1">物流贸易系</option>
                        <option value="1">工程造价系</option>
                        <option value="2">物流贸易系</option>
                        <option value="3">物流贸易系</option>
                        <option value="4">物流贸易系</option>
                        <option value="5">物流贸易系</option>
                        <option value="7">物流贸易系</option>
                        <option value="8">物流贸易系</option>
                    </select>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block " style="margin-left: 24%">
                    <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
            </div>
        </form>
    </div>
</div>
<div id="InfoPreview" style="display: none;width: auto;">
    <div >
        <form class="layui-form"   action="">
            <div class="layui-form-item">
                <label class="layui-form-label">系代码</label>
                <div class="layui-input-inline">
                    <input name="password" required lay-verify="required" placeholder="系代码" autocomplete="off"
                           class="layui-input">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">系名称</label>
                <div class="layui-input-inline">
                    <select name="modules" lay-verify="required" lay-search="">
                        <option value="">系名称</option>
                        <option value="1">物流贸易系</option>
                        <option value="1">工程造价系</option>
                        <option value="2">物流贸易系</option>
                        <option value="3">物流贸易系</option>
                        <option value="4">物流贸易系</option>
                        <option value="5">物流贸易系</option>
                        <option value="7">物流贸易系</option>
                        <option value="8">物流贸易系</option>
                    </select>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block " style="margin-left: 24%">
                    <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
            </div>
        </form>
    </div>
</div>

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
            cont: 'demo1'
            , pages: 100 //总页数
            , groups: 5 //连续显示分页数
        });
    });
</script>

<script>
    //修改系信息
    function updatainfo() {
        layer.open({
            type: 1,
            title: '修改系信息',
            skin: 'yourclass',
            content: $('#updatainfo')
        });
    }
    //预览系信息
    function InfoPreview() {
        layer.open({
            type: 1,
            title: '预览系信息',
            skin: 'yourclass',
            content: $('#InfoPreview')
        });
    }
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
