<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../public/tag.jsp" %>

<html lang="en">
<head>
    <title>高职学生信息管理系统</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">

    <!-- load css -->
    <link rel="stylesheet" type="text/css" href="${baseurl}/public/common/layui/css/layui.css" media="all">
    <link rel="stylesheet" type="text/css" href="${baseurl}/public/common/css/global.css" media="all">
    <link rel="stylesheet" type="text/css" href="${baseurl}/public/css/font_bmgv5kod1961tt9.css">
    <link rel="stylesheet" type="text/css" href="${baseurl}/public/common/bootstrap/css/bootstrap.min.css" media="all">
    <link rel="stylesheet" type="text/css" href="${baseurl}/public/css/common.css" media="all">
    <link rel="stylesheet" type="text/css" href="${baseurl}/public/css/main.css" media="all">
</head>
<body>
<div class="larry-grid larry-wrapper">
    <%--<div class="row" id="infoSwitch">--%>
        <%--<blockquote class="layui-elem-quote col-md-12 head-con">--%>
            <%--<div>尊敬的admin<span id="weather"></span></div>--%>
            <%--<i class="larry-icon larry-guanbi close" id="closeInfo"></i>--%>
        <%--</blockquote>--%>
    <%--</div>--%>
        <div style="width: 1000px;float: left">
            <blockquote class="layui-elem-quote">尊敬的用户您好</blockquote>
        </div>
    <div class="row shortcut" id="shortcut">
        <%--<div class="col-xs-12 col-sm-6 col-md-4 col-lg-2 ">--%>
        <%--<section class="panel clearfix">--%>
        <%--<div class="symbol shortcut-bg1"><i class="larry-icon larry-daishenhe1"--%>
        <%--data-icon="larry-daishenhe1"></i></div>--%>
        <%--<div class="value">--%>
        <%--<a data-href="html/temp.html">--%>
        <%--<h1 id="count1">10</h1>--%>
        <%--</a>--%>
        <%--<p>待审的文章</p>--%>
        <%--</div>--%>
        <%--</section>--%>
        <%--</div>--%>

        <div class="col-xs-12 col-sm-6 col-md-4 col-lg-2 " style="float: right">
            <a onclick="teacher.add()">
                <div class="panel">
                    <div class="symbol shortcut-bg2"><i class="larry-icon larry-fabu2" data-icon="larry-fabu2"></i>
                    </div>
                    <div class="value">
                        <h1>22</h1>
                        <p>我要发布通知</p>
                    </div>
                </div>
            </a>
        </div>



    </div>
        <blockquote class="layui-elem-quote">这个貌似不用多介绍，因为你已经在太多的地方都看到</blockquote>

        <blockquote class="layui-elem-quote layui-quote-nm">layui 2.0 提供强力驱动</blockquote>
</div>


</div>
<script type="text/javascript" src="${baseurl}/public/common/layui/layui.js"></script>
<script type="text/javascript" src="${baseurl}/public/common/js/jquery-3.2.0.min.js"></script>
<script type="text/javascript" src="${baseurl}/public/common/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${baseurl}/public/common/jsplugin/jquery.leoweather.min.js"></script>
<script type="text/javascript" src="${baseurl}/public/common/jsplugin/echarts.min.js"></script>
<!-- 引入当前页面js文件 -->
<script type="text/javascript" src="${baseurl}/public/js/main.js"></script>
<script>
    layui.use('layedit', function () {
        var layedit = layui.layedit
            , $ = layui.jquery;

        //构建一个默认的编辑器
        //自定义工具栏
        layedit.build('LAY_demo1', {
            tool: ['face', 'strong', 'italic', 'underline', 'del', '|', 'link', 'left', 'center', 'right']
            , height: 300
        })
        var index = layedit.build('LAY_demo1');

        //编辑器外部操作
        var active = {
            content: function () {
                alert(layedit.getContent(index)); //获取编辑器内容
            }
            , text: function () {
                alert(layedit.getText(index)); //获取编辑器纯文本内容
            }
            , selection: function () {
                alert(layedit.getSelection(index));
            }
        };

        $('.site-demo-layedit').on('click', function () {
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });


    });
</script>
<script type="text/javascript">
    layui.use(['jquery', 'layer', 'element', 'laypage', 'form', 'laytpl', 'tree', 'layedit'], function () {
        window.jQuery = window.$ = layui.jquery;
        window.layer = layui.layer;

        var element = layui.element(),
            form = layui.form(),
            layedit = layui.layedit,
            laytpl = layui.laytpl;


        teacher = {
            add: function () {
                layer.open({
                    type: 1,
                    title: '发布通知',
                    area: ["100%", "100%"]
                    , content: $("#notice")
                });

            },
            delete: function (id) {
                layer.confirm('确定删除？', {icon: 3, title: '提示'}, function (index) {
                    layer.close(index);
                    $.post(baseUrl + "/teacher/delete", {id: id}, function (data) {
                        layer.msg(data.msg);
                        setTimeout("location.reload()", 500);
                    })
                });
            },
            addAjax: function () {
                let data = $("#add-form").serialize();
                let classedIds = "";
                let floorIds = "";
                let classes = $(".classId");
                let floors = $(".floorId");
                for (let i = 0; i < classes.length; ++i) {
                    if ($(classes[i]).prop("checked")) classedIds += $(classes[i]).val() + ",";
                }
                data += "&classIds=" + classedIds;
                for (let i = 0; i < floors.length; ++i) {
                    if ($(floors[i]).prop("checked")) floorIds += $(floors[i]).val() + ",";
                }

                data += "&floorIds=" + floorIds;

                $.post(baseUrl + "/teacher/add", data, function (data) {
                    layer.msg(data.msg);
                    if (data.msg) {
                        setTimeout("location.reload()", 500);
                    }
                })
            },
        };
    });

</script>
<div id="notice" style="display: none">
    <div style="margin-bottom: 20px; width: 600px;">

        <textarea class="layui-textarea" id="LAY_demo1" style="display: none">
  把编辑器的初始内容放在这textarea即可
</textarea>
        <div class="site-demo-button" style="margin-top: 20px;">
            <button class="layui-btn site-demo-layedit" data-type="content">获取编辑器内容</button>
            <button class="layui-btn site-demo-layedit" data-type="text">获取编辑器纯文本内容</button>
            <button class="layui-btn site-demo-layedit" data-type="selection">获取编辑器选中内容</button>
        </div>
    </div>
</div>
</body>
</html>