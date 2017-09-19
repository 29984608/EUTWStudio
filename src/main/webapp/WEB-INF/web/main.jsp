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
<style type="text/css">
    *{

    }
    .h1, .h2, .h3, h1, h2, h3{
        margin: 0px;
        font-size: 18px;

    }
    .layui-colla-title{
        background-color: #ffffff;
    }
</style>
<body>
    <div style="width: 95%;margin: 0 auto">
        <blockquote class="layui-elem-quote" id="admin">尊敬的<span><shiro:principal property="name"/></span>您好<i class="larry-icon larry-guanbi close" id="closeInfo"></i></blockquote>
    </div>
        <fieldset class="layui-elem-field layui-field-title"style="margin-top: 10px;width: 95%;margin: 0 auto;margin-bottom: 10px;">
            <legend>公告栏</legend>
        </fieldset>
    <div class="" style="width: 95%;margin: 0 auto;font-size: 16px;">
        <div class="layui-collapse " lay-filter="test">
            <div class="layui-colla-item">
                <h2 class="layui-colla-title" style="height: 90px;">
                    公告：完成本周作业及案例分析<span style="font-size: 12px;color: darkgray;float: right">发时间： 2017.09.25 15:33:30</span><br>
                    <p style="font-size: 14px;text-indent: 2em;">同学们，3月15日作业截止日期延期一天，变为3月17日下午五点半，请同学们及时提交作业<span style="font-size: 12px;color: darkgray;float: right">发布人：付宏科 </span></p>
                </h2>
                <div class="layui-colla-content">
                    <p style="font-size: 14px;">有不少其他答案说是因为JS太差。我下面的答案已经说了，这不是根本性的原因。但除此之外，我还要纠正一些对JS具体问题的误解。JS当初是被作为脚本语言设计的，所以某些问题并不是JS设计得差或者是JS设计者的失误。比如var的作用域问题，并不是“错误”，而是当时绝大部分脚本语言都是这样的，如perl/php/sh等。模块的问题也是，脚本语言几乎都没有模块/命名空间功能。弱类型、for-in之类的问题也是，只不过现在用那些老的脚本语言的人比较少，所以很多人都误以为是JS才有的坑。另外有人说JS是半残语言，满足不了开发需求，1999年就该死。半残这个嘛，就夸张了。JS虽然有很多问题，但是设计总体还是优秀的。——来自知乎@贺师俊</p>
                </div>
            </div>
            <div class="layui-colla-item">
                <h2 class="layui-colla-title" style="height: 90px;">
                    公告：完成本周作业及案例分析<span style="font-size: 12px;color: darkgray;float: right">发时间： 2017.09.25 15:33:30</span><br>
                    <p style="font-size: 14px;text-indent: 2em;">同学们，3月15日作业截止日期延期一天，变为3月17日下午五点半，请同学们及时提交作业<span style="font-size: 12px;color: darkgray;float: right">发布人：付宏科 </span></p>
                </h2>
                <div class="layui-colla-content">
                    <p style="font-size: 14px;">有不少其他答案说是因为JS太差。我下面的答案已经说了，这不是根本性的原因。但除此之外，我还要纠正一些对JS具体问题的误解。JS当初是被作为脚本语言设计的，所以某些问题并不是JS设计得差或者是JS设计者的失误。比如var的作用域问题，并不是“错误”，而是当时绝大部分脚本语言都是这样的，如perl/php/sh等。模块的问题也是，脚本语言几乎都没有模块/命名空间功能。弱类型、for-in之类的问题也是，只不过现在用那些老的脚本语言的人比较少，所以很多人都误以为是JS才有的坑。另外有人说JS是半残语言，满足不了开发需求，1999年就该死。半残这个嘛，就夸张了。JS虽然有很多问题，但是设计总体还是优秀的。——来自知乎@贺师俊</p>
                </div>
            </div>
            <div class="layui-colla-item">
                <h2 class="layui-colla-title" style="height: 90px;">
                    公告：完成本周作业及案例分析<span style="font-size: 12px;color: darkgray;float: right">发时间： 2017.09.25 15:33:30</span><br>
                    <p style="font-size: 14px;text-indent: 2em;">同学们，3月15日作业截止日期延期一天，变为3月17日下午五点半，请同学们及时提交作业<span style="font-size: 12px;color: darkgray;float: right">发布人：付宏科 </span></p>
                </h2>
                <div class="layui-colla-content">
                    <p style="font-size: 14px;">有不少其他答案说是因为JS太差。我下面的答案已经说了，这不是根本性的原因。但除此之外，我还要纠正一些对JS具体问题的误解。JS当初是被作为脚本语言设计的，所以某些问题并不是JS设计得差或者是JS设计者的失误。比如var的作用域问题，并不是“错误”，而是当时绝大部分脚本语言都是这样的，如perl/php/sh等。模块的问题也是，脚本语言几乎都没有模块/命名空间功能。弱类型、for-in之类的问题也是，只不过现在用那些老的脚本语言的人比较少，所以很多人都误以为是JS才有的坑。另外有人说JS是半残语言，满足不了开发需求，1999年就该死。半残这个嘛，就夸张了。JS虽然有很多问题，但是设计总体还是优秀的。——来自知乎@贺师俊</p>
                </div>
            </div>
            <div class="layui-colla-item">
                <h2 class="layui-colla-title" style="height: 90px;">
                    公告：完成本周作业及案例分析<span style="font-size: 12px;color: darkgray;float: right">发时间： 2017.09.25 15:33:30</span><br>
                    <p style="font-size: 14px;text-indent: 2em;">同学们，3月15日作业截止日期延期一天，变为3月17日下午五点半，请同学们及时提交作业<span style="font-size: 12px;color: darkgray;float: right">发布人：付宏科 </span></p>
                </h2>
                <div class="layui-colla-content">
                    <p style="font-size: 14px;">有不少其他答案说是因为JS太差。我下面的答案已经说了，这不是根本性的原因。但除此之外，我还要纠正一些对JS具体问题的误解。JS当初是被作为脚本语言设计的，所以某些问题并不是JS设计得差或者是JS设计者的失误。比如var的作用域问题，并不是“错误”，而是当时绝大部分脚本语言都是这样的，如perl/php/sh等。模块的问题也是，脚本语言几乎都没有模块/命名空间功能。弱类型、for-in之类的问题也是，只不过现在用那些老的脚本语言的人比较少，所以很多人都误以为是JS才有的坑。另外有人说JS是半残语言，满足不了开发需求，1999年就该死。半残这个嘛，就夸张了。JS虽然有很多问题，但是设计总体还是优秀的。——来自知乎@贺师俊</p>
                </div>
            </div>
            <div class="layui-colla-item">
                <h2 class="layui-colla-title" style="height: 90px;">
                    公告：完成本周作业及案例分析<span style="font-size: 12px;color: darkgray;float: right">发时间： 2017.09.25 15:33:30</span><br>
                    <p style="font-size: 14px;text-indent: 2em;">同学们，3月15日作业截止日期延期一天，变为3月17日下午五点半，请同学们及时提交作业<span style="font-size: 12px;color: darkgray;float: right">发布人：付宏科 </span></p>
                </h2>
                <div class="layui-colla-content">
                    <p style="font-size: 14px;">有不少其他答案说是因为JS太差。我下面的答案已经说了，这不是根本性的原因。但除此之外，我还要纠正一些对JS具体问题的误解。JS当初是被作为脚本语言设计的，所以某些问题并不是JS设计得差或者是JS设计者的失误。比如var的作用域问题，并不是“错误”，而是当时绝大部分脚本语言都是这样的，如perl/php/sh等。模块的问题也是，脚本语言几乎都没有模块/命名空间功能。弱类型、for-in之类的问题也是，只不过现在用那些老的脚本语言的人比较少，所以很多人都误以为是JS才有的坑。另外有人说JS是半残语言，满足不了开发需求，1999年就该死。半残这个嘛，就夸张了。JS虽然有很多问题，但是设计总体还是优秀的。——来自知乎@贺师俊</p>
                </div>
            </div>
            <div class="layui-colla-item">
                <h2 class="layui-colla-title" style="height: 90px;">
                    公告：完成本周作业及案例分析<span style="font-size: 12px;color: darkgray;float: right">发时间： 2017.09.25 15:33:30</span><br>
                    <p style="font-size: 14px;text-indent: 2em;">同学们，3月15日作业截止日期延期一天，变为3月17日下午五点半，请同学们及时提交作业<span style="font-size: 12px;color: darkgray;float: right">发布人：付宏科 </span></p>
                </h2>
                <div class="layui-colla-content">
                    <p style="font-size: 14px;">有不少其他答案说是因为JS太差。我下面的答案已经说了，这不是根本性的原因。但除此之外，我还要纠正一些对JS具体问题的误解。JS当初是被作为脚本语言设计的，所以某些问题并不是JS设计得差或者是JS设计者的失误。比如var的作用域问题，并不是“错误”，而是当时绝大部分脚本语言都是这样的，如perl/php/sh等。模块的问题也是，脚本语言几乎都没有模块/命名空间功能。弱类型、for-in之类的问题也是，只不过现在用那些老的脚本语言的人比较少，所以很多人都误以为是JS才有的坑。另外有人说JS是半残语言，满足不了开发需求，1999年就该死。半残这个嘛，就夸张了。JS虽然有很多问题，但是设计总体还是优秀的。——来自知乎@贺师俊</p>
                </div>
            </div>
            <div class="layui-colla-item">
                <h2 class="layui-colla-title" style="height: 90px;">
                    公告：完成本周作业及案例分析<span style="font-size: 12px;color: darkgray;float: right">发时间： 2017.09.25 15:33:30</span><br>
                    <p style="font-size: 14px;text-indent: 2em;">同学们，3月15日作业截止日期延期一天，变为3月17日下午五点半，请同学们及时提交作业<span style="font-size: 12px;color: darkgray;float: right">发布人：付宏科 </span></p>
                </h2>
                <div class="layui-colla-content">
                    <p style="font-size: 14px;">有不少其他答案说是因为JS太差。我下面的答案已经说了，这不是根本性的原因。但除此之外，我还要纠正一些对JS具体问题的误解。JS当初是被作为脚本语言设计的，所以某些问题并不是JS设计得差或者是JS设计者的失误。比如var的作用域问题，并不是“错误”，而是当时绝大部分脚本语言都是这样的，如perl/php/sh等。模块的问题也是，脚本语言几乎都没有模块/命名空间功能。弱类型、for-in之类的问题也是，只不过现在用那些老的脚本语言的人比较少，所以很多人都误以为是JS才有的坑。另外有人说JS是半残语言，满足不了开发需求，1999年就该死。半残这个嘛，就夸张了。JS虽然有很多问题，但是设计总体还是优秀的。——来自知乎@贺师俊</p>
                </div>
            </div>
            <div class="layui-colla-item">
                <h2 class="layui-colla-title" style="height: 90px;">
                    公告：完成本周作业及案例分析<span style="font-size: 12px;color: darkgray;float: right">发时间： 2017.09.25 15:33:30</span><br>
                    <p style="font-size: 14px;text-indent: 2em;">同学们，3月15日作业截止日期延期一天，变为3月17日下午五点半，请同学们及时提交作业<span style="font-size: 12px;color: darkgray;float: right">发布人：付宏科 </span></p>
                </h2>
                <div class="layui-colla-content">
                    <p style="font-size: 14px;">有不少其他答案说是因为JS太差。我下面的答案已经说了，这不是根本性的原因。但除此之外，我还要纠正一些对JS具体问题的误解。JS当初是被作为脚本语言设计的，所以某些问题并不是JS设计得差或者是JS设计者的失误。比如var的作用域问题，并不是“错误”，而是当时绝大部分脚本语言都是这样的，如perl/php/sh等。模块的问题也是，脚本语言几乎都没有模块/命名空间功能。弱类型、for-in之类的问题也是，只不过现在用那些老的脚本语言的人比较少，所以很多人都误以为是JS才有的坑。另外有人说JS是半残语言，满足不了开发需求，1999年就该死。半残这个嘛，就夸张了。JS虽然有很多问题，但是设计总体还是优秀的。——来自知乎@贺师俊</p>
                </div>
            </div>
            <div class="layui-colla-item">
                <h2 class="layui-colla-title" style="height: 90px;">
                    公告：完成本周作业及案例分析<span style="font-size: 12px;color: darkgray;float: right">发时间： 2017.09.25 15:33:30</span><br>
                    <p style="font-size: 14px;text-indent: 2em;">同学们，3月15日作业截止日期延期一天，变为3月17日下午五点半，请同学们及时提交作业<span style="font-size: 12px;color: darkgray;float: right">发布人：付宏科 </span></p>
                </h2>
                <div class="layui-colla-content">
                    <p style="font-size: 14px;">有不少其他答案说是因为JS太差。我下面的答案已经说了，这不是根本性的原因。但除此之外，我还要纠正一些对JS具体问题的误解。JS当初是被作为脚本语言设计的，所以某些问题并不是JS设计得差或者是JS设计者的失误。比如var的作用域问题，并不是“错误”，而是当时绝大部分脚本语言都是这样的，如perl/php/sh等。模块的问题也是，脚本语言几乎都没有模块/命名空间功能。弱类型、for-in之类的问题也是，只不过现在用那些老的脚本语言的人比较少，所以很多人都误以为是JS才有的坑。另外有人说JS是半残语言，满足不了开发需求，1999年就该死。半残这个嘛，就夸张了。JS虽然有很多问题，但是设计总体还是优秀的。——来自知乎@贺师俊</p>
                </div>
            </div>
            <div class="layui-colla-item">
                <h2 class="layui-colla-title" style="height: 90px;">
                    公告：完成本周作业及案例分析<span style="font-size: 12px;color: darkgray;float: right">发时间： 2017.09.25 15:33:30</span><br>
                    <p style="font-size: 14px;text-indent: 2em;">同学们，3月15日作业截止日期延期一天，变为3月17日下午五点半，请同学们及时提交作业<span style="font-size: 12px;color: darkgray;float: right">发布人：付宏科 </span></p>
                </h2>
                <div class="layui-colla-content">
                    <p style="font-size: 14px;">有不少其他答案说是因为JS太差。我下面的答案已经说了，这不是根本性的原因。但除此之外，我还要纠正一些对JS具体问题的误解。JS当初是被作为脚本语言设计的，所以某些问题并不是JS设计得差或者是JS设计者的失误。比如var的作用域问题，并不是“错误”，而是当时绝大部分脚本语言都是这样的，如perl/php/sh等。模块的问题也是，脚本语言几乎都没有模块/命名空间功能。弱类型、for-in之类的问题也是，只不过现在用那些老的脚本语言的人比较少，所以很多人都误以为是JS才有的坑。另外有人说JS是半残语言，满足不了开发需求，1999年就该死。半残这个嘛，就夸张了。JS虽然有很多问题，但是设计总体还是优秀的。——来自知乎@贺师俊</p>
                </div>
            </div>
            <div class="layui-colla-item">
                <h2 class="layui-colla-title" style="height: 90px;">
                    公告：完成本周作业及案例分析<span style="font-size: 12px;color: darkgray;float: right">发时间： 2017.09.25 15:33:30</span><br>
                    <p style="font-size: 14px;text-indent: 2em;">同学们，3月15日作业截止日期延期一天，变为3月17日下午五点半，请同学们及时提交作业<span style="font-size: 12px;color: darkgray;float: right">发布人：付宏科 </span></p>
                </h2>
                <div class="layui-colla-content">
                    <p style="font-size: 14px;">有不少其他答案说是因为JS太差。我下面的答案已经说了，这不是根本性的原因。但除此之外，我还要纠正一些对JS具体问题的误解。JS当初是被作为脚本语言设计的，所以某些问题并不是JS设计得差或者是JS设计者的失误。比如var的作用域问题，并不是“错误”，而是当时绝大部分脚本语言都是这样的，如perl/php/sh等。模块的问题也是，脚本语言几乎都没有模块/命名空间功能。弱类型、for-in之类的问题也是，只不过现在用那些老的脚本语言的人比较少，所以很多人都误以为是JS才有的坑。另外有人说JS是半残语言，满足不了开发需求，1999年就该死。半残这个嘛，就夸张了。JS虽然有很多问题，但是设计总体还是优秀的。——来自知乎@贺师俊</p>
                </div>
            </div>

        </div>

    </div>

        <script>
            //注意：折叠面板 依赖 element 模块，否则无法进行功能性操作
            layui.use('element', function(){
                var element = layui.element;

                //…
            });
        </script>

</div>
<script type="text/javascript" src="${baseurl}/public/common/layui/layui.js"></script>
<script type="text/javascript" src="${baseurl}/public/common/js/jquery-3.2.0.min.js"></script>
<script type="text/javascript" src="${baseurl}/public/common/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${baseurl}/public/common/jsplugin/jquery.leoweather.min.js"></script>
<script type="text/javascript" src="${baseurl}/public/common/jsplugin/echarts.min.js"></script>
<!-- 引入当前页面js文件 -->
<script type="text/javascript" src="${baseurl}/public/js/main.js"></script>
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
                $("#notice").show();
                layer.open({
                    type: 1,
                    title: '发布通知',
                    area: ["100%", "100%"]
                    , content: $("#notice")
                });
                form.render();

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
        $(function () {
            $("#notice").hide();

            $("#closeInfo").click(function () {
                $("#admin").fadeOut("slow");
            });
        });
    });


</script>

</body>
</html>