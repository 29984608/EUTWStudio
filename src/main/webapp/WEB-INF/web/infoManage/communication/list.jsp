<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../../../public/tag.jsp" %>
<html>
<head>
    <title></title>
    <script type="text/javascript" src="${baseurl}/public/common/js/jquery-3.2.0.min.js"></script>
    <script src="${baseurl}/public/common/layui/layui.js" charset="utf-8"></script>
    <link rel="stylesheet" href="${baseurl}/public/common/layui/css/layui.css" media="all">
    <link rel="stylesheet" type="text/css" href="${baseurl}/public/common/layui/css/layui.css" media="all">
    <link rel="stylesheet" type="text/css" href="${baseurl}/public/common/bootstrap/css/bootstrap.min.css" media="all">
    <link rel="stylesheet" type="text/css" href="${baseurl}/public/common/css/global.css" media="all">
    <link rel="stylesheet" type="text/css" href="${baseurl}/public/css/common.css" media="all">
    <link rel="stylesheet" type="text/css" href="${baseurl}/public/css/personal.css" media="all">
    <%--时间轴--%>
    <link rel="stylesheet" href="${baseurl}/public/css/timeAsix/css/screen.css" type="text/css" media="screen">
    <link rel="stylesheet" href="${baseurl}/public/css/timeAsix/css/responsive.css" type="text/css" media="screen">
    <link rel="stylesheet" href="${baseurl}/public/css/timeAsix/inc/colorbox.css" type="text/css" media="screen">

</head>
<body>
<section class="larry-grid">
    <div class="larry-personal">
        <div class="layui-tab">
            <form class="layui-form" action="">
                <blockquote class="layui-elem-quote mylog-info-tit">

                    <div class="layui-inline">
                        <div class="layui-input-inline">
                            <select name="modules" lay-verify="required" lay-search="">
                                <option value="">班级</option>
                                <option value="1">物业管理1701</option>
                                <option value="2">物业管理1802</option>
                                <option value="3">工程造价1601</option>
                                <option value="4">房地产1701</option>
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
                    <a class="layui-btn"><i class="layui-icon">&#xe60a;</i>打印</a>
                    <div class="layui-form">
                        <table class="layui-table">
                            <thead>
                            <tr>
                                <th>学号</th>
                                <th>姓名</th>
                                <th>专业</th>
                                <th>班级</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>15610903150627</td>
                                <td>张三</td>
                                <td>工程造价</td>
                                <td>
                                    工程造价1701
                                </td>
                                <td>
                                    <a class="layui-btn layui-btn-small" onclick="addCommunication()"><i
                                            class="layui-icon">&#xe608;</i>添加</a>

                                    <a class="layui-btn layui-btn-normal layui-btn-small" onclick="upCommunication()"><i
                                            class="layui-icon">&#xe642;</i>编辑</a>

                                    <%--<a class="layui-btn layui-btn-small layui-btn-normal" onclick="seeCommunication()"><i class="layui-icon">&#xe60a;</i>预览--%>
                                    <a class="layui-btn  layui-btn-small" onclick="seeCommunication()"><i
                                            class="layui-icon">&#xe60a;</i>预览</a>
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

</body>
<%@include file="layer.jsp" %>
<script type="text/javascript" src="${baseurl}/public/css/timeAsix/inc/colorbox.js"></script>
<script type="text/javascript" src="${baseurl}/public/css/timeAsix/js/timeliner.min.js"></script>
<script>
    $(document).ready(function () {
        $.timeliner({
            startOpen: ['#19550828EX', '#19630828EX']
        });
        $.timeliner({
            timelineContainer: '#timelineContainer_2'
        });
        // Colorbox Modal
        $(".CBmodal").colorbox({
            inline: true,
            initialWidth: 100,
            maxWidth: 682,
            initialHeight: 100,
            transition: "elastic",
            speed: 750
        });
    });

    layui.use('form', function () {
        var $ = layui.jquery, form = layui.form();

    });
    function seeCommunication() {
        layer.open({
            type: 1,
            title: '沟通反馈记录详细信息',
            area: ['100%', '100%'],
            skin: 'yourclass',
            content: $('#communication_info'),
        });
    }

    function addCommunication() {

        layer.open({
            type: 1,
            title: '添加沟通反馈记录',
            area: ['100%', '100%'],
            skin: 'yourclass',
            content: $('#addInfo'),
        });
    }

    function upCommunication() {
        layer.open({
            type: 1,
            title: '添加沟通反馈记录',
            area: ['100%', '100%'],
            skin: 'yourclass',
            content: $('#communication_info'),
        });
    }
</script>


</html>
