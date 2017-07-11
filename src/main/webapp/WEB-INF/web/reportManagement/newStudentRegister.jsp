<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../../public/tag.jsp" %>

<html>
<head>
    <meta charset="utf-8">
    <title></title>
    <script type="text/javascript" src="${baseurl}/public/common/js/jquery-3.2.0.min.js"></script>
    <link rel="stylesheet" type="text/css" href="${baseurl}/public/common/layui/css/layui.css" media="all">
    <link rel="stylesheet" type="text/css" href="${baseurl}/public/common/layui/css/layui.css" media="all">
    <link rel="stylesheet" type="text/css" href="${baseurl}/public/common/bootstrap/css/bootstrap.min.css" media="all">
    <link rel="stylesheet" type="text/css" href="${baseurl}/public/common/css/global.css" media="all">
    <link rel="stylesheet" type="text/css" href="${baseurl}/public/css/common.css" media="all">
    <link rel="stylesheet" type="text/css" href="${baseurl}/public/css/personal.css" media="all">
</head>
<body>
<style>
    .head {
        margin-left: -15px
    }
</style>
<section class="larry-grid">
    <div class="larry-personal">
        <div class="layui-tab">
            <div class="layui-tab-content larry-personal-body clearfix mylog-info-box" style="padding: 10px">
                <div class="layui-form ">
                    <h2 style="text-align: center;font-weight: bold;margin: 20px 0">西安欧亚学院学生入学登记表</h2>
                    <div id="head">
                        <div id="department" class="layui-inline head">
                            <label class="layui-form-label">分院：</label>
                            <div class="layui-input-inline">
                                <input type="text" placeholder="分院" class="layui-input">
                            </div>
                        </div>
                        <div id="profession" class="layui-inline head">
                            <label class="layui-form-label">专业：</label>
                            <div class="layui-input-inline">
                                <input type="text" placeholder="专业" class="layui-input">
                            </div>
                        </div>
                        <div id="classes" class="layui-inline head">
                            <label class="layui-form-label">班级：</label>
                            <div class="layui-input-inline">
                                <input type="text" placeholder="班级" class="layui-input">
                            </div>
                        </div>
                        <div id="no" class="layui-inline head">
                            <label class="layui-form-label">学号：</label>
                            <div class="layui-input-inline">
                                <input type="text" placeholder="学号" class="layui-input">
                            </div>
                        </div>
                        <div id="entry_school_time" class="layui-inline head">
                            <label class="layui-form-label" style="width: 100px">入学时间：</label>
                            <div class="layui-input-inline">
                                <input type="text" placeholder="入学时间" class="layui-input">
                            </div>
                        </div>
                    </div>
                    <table id="body" class="layui-table  " data-name="articleCatData">
                        <tbody id="list">
                        <%--<div class="site-demo-upload" style="position: absolute;">--%>
                            <%--<img id="LAY_demo_upload" src="${baseurl}/images/user/user.jpg" width="100px" height="200px">--%>
                            <%--<div class="site-demo-upbar">--%>
                                <%--<input type="file" name="file" class="layui-upload-file" id="test">--%>
                            <%--</div>--%>
                        <%--</div>--%>
                        <tr>
                            <th>
                                <div class="layui-inline head">
                                    <label class="layui-form-label">姓名：</label>
                                    <div class="layui-input-inline">
                                        <input type="text" placeholder="姓名" class="layui-input">
                                    </div>
                                </div>
                                <div class="layui-inline head">
                                    <label class="layui-form-label">性别：</label>
                                    <div class="layui-input-inline">
                                        <input type="radio" name="sex" value="男" title="男">
                                        <input type="radio" name="sex" value="女" title="女" checked>
                                    </div>
                                </div>
                                <div class="layui-inline head">
                                    <label class=" layui-form-label " style="width: 100px;">出生年月：</label>
                                    <div class="layui-input-inline">
                                        <input class="layui-input" placeholder="出生年月"
                                               onclick="layui.laydate({elem: this, festival: true})">
                                    </div>
                                </div>
                                <div class="layui-inline head">
                                    <label class="layui-form-label">民族：</label>
                                    <div class="layui-input-inline">
                                        <input type="text" placeholder="民族" class="layui-input">
                                    </div>
                                </div>
                                <div class="layui-inline head">
                                    <label class="layui-form-label">婚否：</label>
                                    <div class="layui-input-inline">
                                        <input type="radio" name="marry" value="已婚" title="已婚">
                                        <input type="radio" name="marry" value="未婚" title="未婚" checked>
                                    </div>
                                </div>
                            </th>
                        </tr>
                        <tr>
                            <th>
                                <div class="layui-inline head">
                                    <label class="layui-form-label">籍贯：</label>
                                    <div class="layui-input-inline">
                                        <input type="text" placeholder="籍贯" class="layui-input">
                                    </div>
                                </div>
                                <div class="layui-inline head">
                                    <label class="layui-form-label " style="width: 100px;">政治面貌：</label>
                                    <div class="layui-input-inline">
                                        <input type="text" placeholder="籍贯" class="layui-input">
                                    </div>
                                </div>
                                <div class="layui-inline head">
                                    <label class="layui-form-label " style="width: 100px;" >文化程度：</label>
                                    <div class="layui-input-inline">
                                        <input type="text" placeholder="文化程度" value="高中" class="layui-input">
                                    </div>
                                </div>
                                <div class="layui-inline head">
                                    <label class="layui-form-label " style="width: 100px;">学生类别：</label>
                                    <div class="layui-input-inline">
                                        <input type="radio" name="nature" value="本科" title="本科">
                                        <input type="radio" name="nature" value="专升本" title="专升本" checked>
                                        <input type="radio" name="nature" value="专科" title="专科" >
                                    </div>
                                </div>
                            </th>
                        </tr>
                        </tbody>
                    </table>

                </div>
            </div>
        </div>
    </div>
</section>
</body>

<script type="text/javascript" src="${baseurl}/public/common/layui/layui.js"></script>
<script type="text/javascript">
    layui.use(['jquery', 'layer', 'element', 'form', "laydate","upload"], function () {
        window.jQuery = window.$ = layui.jquery;
        window.layer = layui.layer;
        let element = layui.element(),
            laydate = layui.laydate,
            form = layui.form();


        layui.upload({
            url: '/test/upload.json'
            ,elem: '#test' //指定原始元素，默认直接查找class="layui-upload-file"
            ,method: 'get' //上传接口的http类型
            ,success: function(res){
                LAY_demo_upload.src = res.url;
            }
        });
        var start = {
            min: laydate.now()
            , max: '2099-06-16 23:59:59'
            , istoday: false
            , choose: function (datas) {
                end.min = datas; //开始日选好后，重置结束日的最小日期
                end.start = datas //将结束日的初始值设定为开始日
            }
        };

        var end = {
            min: laydate.now()
            , max: '2099-06-16 23:59:59'
            , istoday: false
            , choose: function (datas) {
                start.max = datas; //结束日选好后，重置开始日的最大日期
            }
        };

        $(function () {

        });
    });


</script>

</html>
