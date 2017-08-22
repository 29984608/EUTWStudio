<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../../../public/tag.jsp" %>
<html>
<head>
    <title></title>
    <script type="text/javascript" src="${baseurl}/public/common/js/jquery-3.2.0.min.js"></script>
    <script src="${baseurl}/public/common/layui/layui.js" charset="utf-8"></script>
    <script src="${baseurl}/js/separator.js" charset="utf-8"></script>
    <link rel="stylesheet" href="${baseurl}/public/common/layui/css/layui.css" media="all">
    <link rel="stylesheet" type="text/css" href="${baseurl}/public/common/layui/css/layui.css" media="all">
    <link rel="stylesheet" type="text/css" href="${baseurl}/public/common/bootstrap/css/bootstrap.min.css" media="all">
    <link rel="stylesheet" type="text/css" href="${baseurl}/public/common/css/global.css" media="all">
    <link rel="stylesheet" type="text/css" href="${baseurl}/public/css/common.css" media="all">
    <link rel="stylesheet" type="text/css" href="${baseurl}/public/css/personal.css" media="all">
    <script type="text/javascript" src="${baseurl}/js/searchJs.js"></script>

</head>
<style>
    .layui-table th {
        font-size: 13px;
        line-height: 31px;
        min-height: 30px;
    }
</style>
<body style=" background: #fff;">
<section class=" layui-form">
    <div class="larry-personal">
        <div class="layui-tab">
            <div id="update" style="">
                <div class="container" id="container" style=" background: #fff;width: 60%; ">
                    <h1 style="text-align: center;margin-left: -30px;margin-top: 40px; ;color:#00ab9f ">西安欧亚学院<span
                            id="studentName1"></span>学生档案</h1>
                    <div style="margin-top: 40px;">
                        <div style="width: 100%; height: 100%; float: left;padding-left: 25px">
                            <h4 style="color: #00ab9f;font-weight: bold">基本信息</h4>
                            <table class="layui-table lay-even " data-name="articleCatData"
                                   style="border: 0px solid red">
                                <tbody>
                                <tr>
                                    <th colspan="3" style="width:140px;">学号：<span id="studentNo"></span></th>
                                    <th colspan="4" style="width:125px;">姓名：<span id="studentName"></span></th>
                                    <th colspan="1" >性别：<span id="studentSex"></span></th>
                                    <th colspan="1" >民族：<span id="famous_family"></span></th>
                                    <th colspan="3" style="width:211px">身份证号：<span id="idcard"></span></th>
                                    <th rowspan = " 3 " style="padding: 1px;width:130px;">
                                        <div style="width:130px; height: 150px; border: 0px solid #00ab9f">
                                            <img id="images" style="width:100%" height="100%"/>
                                        </div>
                                    </th>
                                </tr>
                                <tr>

                                    <th colspan="4" style="width:145px;">出生日期：<span id="born"></span></th>
                                    <th colspan="4" style="width:200px;">籍贯：<span id="native_place"></span></th>
                                    <th colspan="3" style="width:190px;">政治面貌：<span id="political_status"></span></th>
                                    <th >婚否：<span id="is_marry"></span></th>
                                </tr>
                                <tr>
                                    <th colspan="3" style="width:120px;">血型：<span id="blood"></span></th>
                                    <th colspan="3">身高：<span id="height"></span>cm</th>
                                    <th colspan="3" style="width:170px;">体重：<span id="weight"></span>kg</th>
                                    <th colspan="3">健康状况：<span id="health_status"></span></th>
                                </tr>
                                <tr>
                                    <th colspan="5">联系方式：<span id="phone"></span></th>
                                    <th colspan="4">qq：<span id="qq"></span></th>
                                    <th colspan="4">邮箱：<span id="email"></span></th>
                                </tr>
                                <tr>
                                    <th colspan="9">家庭住址：<span id="actual_address"></span></th>
                                    <th colspan="2">邮编编码：<span id="family_zip_code"></span></th>
                                    <th colspan="2">联系电话：<span id="student_contact_method"></span></th>
                                </tr>
                                <tbody id="family">
                                </tbody>
                                <tr>
                                    <th colspan="7">紧急联系人：<span id="emergency_contact_name"></span></th>

                                    <th colspan="6">联系方式：<span id="emergency_contact_method"></span></th>
                                </tr>
                                </tbody>
                            </table>
                            <h4 style="color: #00ab9f;font-weight: bold ;padding-top: 15px;">教育经历</h4>
                            <table class="layui-table lay-even " data-name="articleCatData"
                                   style="border: 0px solid red">
                                <tbody id="experience_div">

                                </tbody>
                            </table>
                            <h4 style="color: #00ab9f;font-weight: bold ;padding-top: 15px;">学业信息</h4>
                            <table class="layui-table lay-even " data-name="articleCatData"
                                   style="border: 0px solid red">
                                <tbody>
                                <tr>
                                    <th colspan="4">学籍状态：<span id="student_status"></span></th>
                                </tr>
                                <tr>
                                    <th colspan="2">学生类别：<span id="student_type"></span></th>
                                    <th colspan="2">高考成绩：<span id="sat_score"></span></th>

                                </tr>
                                <tr>
                                    <th>录取专业：<span id="profession"></span></th>
                                    <th>现专业：<span id="originProfession"></span></th>
                                    <th>就业方向：<span id="direction"></span></th>
                                    <th>班级：<span id="classes"></span></th>
                                </tr>
                                <tr>
                                    <th colspan="2">职业导师：<span id="teacherName"></span></th>
                                    <th colspan="2">社区辅导员：<span id="teacherCommunity"></span></th>
                                </tr>
                                <tr>
                                </tr>

                                <tr>
                                    <th colspan="2">缴费状态：
                                        第一年：(<span id="payment_status_first_year"></span>)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        第二年：(<span id="payment_status_second_year"></span>)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        第三年：(<span id="payment_status_third_year"></span>)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                                    </th>
                                    <th colspan="2">实践类型：<span id="practice_learning_type"></span></th>

                                </tr>
                                <tr>
                                    <th colspan="2">宿舍位置：<span id="area"></span>&nbsp;-&nbsp;<span
                                            id="floor"></span>&nbsp;-&nbsp;<span id="room"></span>房间
                                    </th>
                                    <th colspan="2">困难类别：<span id="hard_type"></span></th>
                                </tr>
                                </tbody>
                            </table>
                            <h4 style="color: #00ab9f;font-weight: bold ;padding-top: 15px;">获奖或荣誉</h4>
                            <table class="layui-table lay-even " data-name="articleCatData"
                                   style="border: 0px solid red">
                                <tbody id="own_punishment">

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

</body>

<script src="${baseurl}/js/searchJs.js"/>
<script type="text/javascript" src="${baseurl}/public/js/pdf/html2canvas.js"></script>
<script type="text/javascript">
    layui.use(['jquery', 'layer', 'element', 'laypage', 'form', 'laytpl', 'tree'], function () {
        window.jQuery = window.$ = layui.jquery;
        window.layer = layui.layer;
        var element = layui.element(),
            form = layui.form(),
            laytpl = layui.laytpl;

        student = {
            preview: function (studentNo) {
                $.post(baseUrl + "/personalInformation/update", {studentNo: "<shiro:principal property="userName"/>"}, function (data) {
                    $("#phone").text("").append(data.student[0].student_contact_method);
                    $("#qq").text("").append(data.student[0].qq);
                    $("#email").text("").append(data.student[0].email);
                    $("#images").text("").attr("src", HEAD_IMAGE_PREFIX + data.student[0].head_image);
                    $("#studentNo").text("").append(data.student[0].no);
                    $("#studentName").text("").append(data.student[0].name);
                    $("#studentName1").text("").append(data.student[0].name);
                    if (data.student[0].gender == 'F') {
                        $("#studentSex").text("").append("女");
                    } else if (data.student[0].gender == 'M') {
                        $("#studentSex").text("").append("男");
                    }
                    $("#famous_family").text("").append(data.student[0].famousFamily);
                    $("#idcard").text("").append(data.student[0].idcard);
                    $("#native_place").text("").append(data.student[0].native_place);
                    $("#born").text("").append(data.student[0].born);
                    $("#political_status").text("").append(data.student[0].political_status);
                    $("#blood").text("").append(data.student[0].blood);
                    $("#height").text("").append(data.student[0].height);
                    $("#weight").text("").append(data.student[0].weight);
                    $("#health_status").text("").append(data.student[0].health_status);
                    $("#is_marry").text("").append(data.student[0].is_marry);
                    $("#family_zip_code").text("").append(data.student[0].family_zip_code);
                    $("#student_contact_method").text("").append(data.student[0].student_contact_method);
                    $("#actual_address").text("").append(data.student[0].actual_address);
                    $("#family").html("")
                    for (var i = 0; i < data.family.length; i++) {
                        $("#family").append("<tr> <th colspan='5' >" + data.family[i].relationship + "：" + data.family[i].name + "</th>" +
                            "<th colspan='4' style='width: 70px'>职务：" + data.family[i].staff + "</th>"+
                            "<th colspan='4'>联系电话：" + data.family[i].phone + "</th></tr>" +
                            "<tr><th colspan='5' style='width: 130px'>政治面貌：" + data.family[i].political_status + "</th>" +
                            "<th colspan='8'>工作单位：" + data.family[i].work_place + "</th> </tr>");
                    }
                    $("#emergency_contact_name").text("").append(data.student[0].emergency_contact_name);
                    $("#emergency_contact_method").text("").append(data.student[0].emergency_contact_method);
                    $("#experience_div").html("")
                    for (var i = 0; i < data.experience.length; i++) {
                        $("#experience_div").append("<tr class='experience_divToEveryOne'> <th>时间：" + data.experience[i].start_time + "——" + data.experience[i].end_time + "</th>" +
                            "<th> 学校名称：" + data.experience[i].work_place + "</th>" +
                            "<th >担任职位：" + data.experience[i].staff + "</th></tr>");
                    }
                    $("#student_type").text("").append(data.student[0].student_type);
                    $("#sat_score").text("").append(data.student[0].sat_score);
                    $("#originProfession").text("").append(data.student[0].originProfession);
                    $("#profession").text("").append(data.student[0].profession);
                    $("#direction").text("").append(data.student[0].direction);
                    $("#classes").text("").append(data.student[0].classes);
                    $("#teacherName").text("").append(data.student[0].teacherName);
                    $("#teacherName").text("").append(data.student[0].teacherName);
                    $("#teacherCommunity").text("").append(data.student[0].teacherCommunity);
                    $("#student_status").text("").append(data.student[0].student_status);
                    $("#practice_learning_type").text("").append(data.student[0].practice_learning_type);
                    $("#payment_status_first_year").text("").append(data.student[0].payment_status_first_year);
                    $("#payment_status_second_year").text("").append(data.student[0].payment_status_second_year);
                    $("#payment_status_third_year").text("").append(data.student[0].payment_status_third_year);
                    $("#area").text("").append(data.student[0].area);
                    $("#floor").text("").append(data.student[0].floor);
                    $("#room").text("").append(data.student[0].room);
                    $("#hard_type").text("").append(data.student[0].hard_type);
                    $("#own_punishment").text("")
                    for (var i = 0; i < data.ownPunishment.length; i++) {
                        $("#own_punishment").append("<tr><th>" + data.ownPunishment[i].date + " —— " + data.ownPunishment[i].centent + "</th></tr>");
                    }
                })
            }
        }
        $(function () {
            student.preview();
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

    });
</script>

</html>
