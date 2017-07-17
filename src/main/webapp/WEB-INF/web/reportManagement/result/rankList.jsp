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
<section class="larry-grid layui-form">
    <div class="larry-personal">
        <div class="layui-tab">
            <blockquote class="layui-elem-quote mylog-info-tit">
                <div class="layui-inline">
                    <div class="layui-input-inline" style="width: auto;margin-bottom: 10px;">
                        <select lay-filter="department" id="department_search">
                            <option value="">系</option>


                        </select>
                    </div>
                    <div class="layui-input-inline" style="width: auto;margin-bottom: 10px;">
                        <select lay-filter="level" id="level_search">
                            <option value="">年级</option>


                        </select>
                    </div>
                    <div class="layui-input-inline" style="width: auto;margin-bottom: 10px;">
                        <select  id="direction_search">
                            <option value="">方向</option>


                        </select>
                    </div>

                    <a class="layui-btn" style="width: auto ;margin-bottom: 10px;" onclick="rank.list()"><i
                            class="layui-icon">&#xe615;</i>搜索</a>
                </div>


            </blockquote>
        </div>
        <div class="larry-separate"></div>
        <div class="layui-tab-content larry-personal-body clearfix mylog-info-box">
            <div class="layui-form">
                <table class="layui-table">
                    <thead>
                    <tr>
                        <th>系</th>
                        <th>年级</th>
                        <th>就业方向</th>
                        <th>班级</th>
                        <th>学号</th>
                        <th>姓名</th>
                        <th>课程代码</th>
                        <th>课程名称</th>
                        <th>分数</th>
                    </tr>
                    </thead>
                    <tbody id="list">

                    </tbody>
                </table>
            </div>
            <div id="demo1"></div>
        </div>
    </div>
    </div>
</section>
</body>
<script id="list-tpl" type="text/html">
    {{# layui.each(d.results, function(index, item){ }}
    <tr>
        <td>{{ item.departmentName}}</td>
        <td>{{ item.level}}</td>
        <td>{{ item.directionName}}</td>
        <td>{{ item.classesName}}</td>
        <td>{{ item.no}}</td>
        <td>{{ item.studentName}}</td>
        <td>{{ item.courseCode}}</td>
        <td>{{ item.courseName}}</td>
        <td>{{ item.score}}</td>
    </tr>
    {{# }); }}

</script>
<script type="text/javascript" src="${baseurl}/public/common/layui/layui.js"></script>
<script type="text/javascript">
    let rank;
    let totalSize = 10;
    let currentIndex = 1;
    let pageSize = 10;
    layui.use(['jquery', 'layer', 'element', 'laypage', 'form', 'laytpl'], function () {
        window.jQuery = window.$ = layui.jquery;
        window.layer = layui.layer;
        var element = layui.element(),
            form = layui.form(),
            laytpl = layui.laytpl;

        rank = {
            page: function () {
                layui.laypage({
                    cont: 'demo1',
                    pages: totalSize, //总页数
                    curr: currentIndex,
                    groups: 5,//连续显示分页数
                    skin: '#1E9FFF',
                    jump: function (obj, first) {
                        currentIndex = obj.curr;
                        if (!first) {
                            rank.list();
                        }
                    }
                });
            },
            list: function () {
                let data = {
                    departmentId: $("#department_search").val(),
                    directionId: $("#direction_search").val(),
                    level: $("#level_search").val(),
                    currentIndex: currentIndex,
                    pageSize: pageSize
                };
                $.ajax({
                    url: baseUrl + "/result/rankList",
                    data: data,
                    type: "post",
                    success: function (data) {
                        if (data.result) {
                            console.log(data);
                            currentIndex = data.page.currentIndex;
                            totalSize = data.page.totalSize;
                            rank.page();
                            laytpl($("#list-tpl").text()).render(data, function (html) {
                                $("#list").html(html);
                            });
                            form.render();
                        }else{
                            layer.msg(data.msg);
                        }
                    }
                });
            }
        };
        $(function () {
            rank.list();

        });
    })

</script>


</html>
