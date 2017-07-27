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
    <%--省市区联动--%>
    <script src="${baseurl}/js/city/distpicker.js"></script>
    <script src="${baseurl}/js/city/main.js"></script>
    <script src="${baseurl}/js/city/distpicker.data.js"></script>

</head>
<body>
<section class="larry-grid layui-form">
    <div class="larry-personal">
        <div class="layui-tab">
            <form id="update-form" lay-filter="role-add" class="layui-form layui-form-pane" method="post">
                <blockquote class="layui-elem-quote mylog-info-tit">

                    <div class="layui-form-item">
                        <div class="layui-input-inline">
                            <div class="layui-inline">
                                <div class="layui-input-inline">
                                    <select name="modules" lay-filter="department" lay-verify="required" lay-search=""
                                            id="department_search">
                                        <option value="">系</option>
                                    </select>
                                </div>
                            </div>
                        </div>

                        <div class="layui-input-inline">
                            <div class="layui-inline">
                                <div class="layui-input-inline">
                                    <select name="modules1" lay-filter="modules_2" lay-verify="required" lay-search=""
                                            id="level_search">
                                        <option value="">年级</option>
                                    </select>
                                </div>
                            </div>
                        </div>

                        <div class="layui-input-inline">
                            <div class="layui-inline">
                                <div class="layui-input-inline">
                                    <select name="modules" lay-filter="modules_3" lay-verify="required" lay-search=""
                                            id="direction_search">
                                        <option value="">方向</option>
                                    </select>
                                </div>
                            </div>
                        </div>

                        <div class="layui-input-inline">
                            <div class="layui-inline">
                                <div class="layui-input-inline">
                                    <select name="modules1" lay-filter="modules_2" lay-verify="required" lay-search=""
                                            id="classes_search">
                                        <option value="">班级</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div>
                        <div class="layui-form-item">
                            <div class="layui-form-inline">
                                <label class="layui-form-label">性别</label>
                                <div class="layui-input-inline" id="sex" style="width: 30%">
                                    <input type="radio" name="sex" value="" title="全部" checked="">
                                    <input type="radio" name="sex" value="男" title="男">
                                    <input type="radio" name="sex" value="女" title="女">
                                </div>

                                <label class="layui-form-label">住宿类型</label>
                                <div class="layui-input-inline" id="TypeOfAccommodation"
                                     onclick="student.showDormAndHideDorm()" style="width: 40%">

                                    <input type="radio" name="TypeOfAccommodation" value="" title="全部" checked=""
                                    >
                                    <input type="radio" name="TypeOfAccommodation" value="1" title="校内"
                                    >
                                    <input type="radio" name="TypeOfAccommodation" value="2" title="校外"
                                    >
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <span id="dorm">
                            <div class="layui-input-inline">
                                <div class="layui-inline">
                                    <div class="layui-input-inline">
                                        <select name="modules" lay-filter="dorm" lay-verify="required" lay-search=""
                                                id="area_search">
                                            <option value="">区</option>
                                        </select>
                                    </div>
                                </div>
                            </div>

                            <div class="layui-input-inline">
                                <div class="layui-inline">
                                    <div class="layui-input-inline">
                                        <select name="modules1" lay-filter="modules_2" lay-verify="required"
                                                lay-search=""
                                                id="floor_search">
                                            <option value="">楼层</option>
                                        </select>
                                    </div>
                                </div>
                            </div>

                            <div class="layui-inline" style="margin-right: -15px">
                                <div class="layui-inline">
                                    <div class="layui-input-inline">
                                        <input type="text" name="title" id="roomNo_search" lay-verify="title"
                                               autocomplete="off"
                                               placeholder="宿舍" class="layui-input">
                                    </div>
                                </div>
                            </div>
                        </span>

                        <div class="layui-inline" style="margin-right: -15px">
                            <div class="layui-inline">
                                <div class="layui-input-inline">
                                    <input type="text" name="title" id="studentNo_search" lay-verify="title"
                                           autocomplete="off"
                                           placeholder="学号" class="layui-input">
                                </div>

                            </div>
                        </div>

                        <div class="layui-inline" style="margin-right: -15px">
                            <div class="layui-inline" style="margin-right: -10px">
                                <div class="layui-input-inline">
                                    <input type="text" name="title" id="studentName_search" lay-verify="title"
                                           autocomplete="off"
                                           placeholder="姓名" class="layui-input" style="margin-right: 3px">
                                </div>
                                <a class="layui-btn" onclick="currentIndex = 1;student.list()"><i class="layui-icon">&#xe615;</i>搜索</a>
                            </div>
                        </div>
                    </div>

                </blockquote>
            </form>
            <div class="larry-separate"></div>
            <div class="layui-tab-content larry-personal-body clearfix mylog-info-box">
                <div class="layui-form">
                    <table class="layui-table">
                        <thead>
                        <tr>
                            <th>学号</th>
                            <th>姓名</th>
                            <th>性别</th>
                            <th>系</th>
                            <th>年级</th>
                            <th>住宿类型</th>
                            <th>专业</th>
                            <th>方向</th>
                            <th>班级</th>
                            <th>区</th>
                            <th>楼层</th>
                            <th>宿舍</th>
                            <th>操作</th>
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

<%@include file="layer.jsp" %>

<script type="text/javascript" src="${baseurl}/public/js/pdf/html2canvas.js"></script>
<script type="text/javascript">
    let student;
    let totalSize = 10;
    let currentIndex = 1;
    let pageSize = 10;
    layui.use(['jquery', 'layer', 'element', 'laypage', 'form', 'laytpl', 'tree'], function () {
        window.jQuery = window.$ = layui.jquery;
        window.layer = layui.layer;
        var element = layui.element(),
            form = layui.form(),
            laytpl = layui.laytpl;

        student = {
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
                            student.list();
                        }
                    }
                });
            },

            list: function () {
                let department_search = $("#department_search").val();
                let level_search = $("#level_search").val();
                let direction_search = $("#direction_search").val();
                let classes_search = $("#classes_search").val();
                let area_search = $("#area_search").val();
                let floor_search = $("#floor_search").val();
                let roomNo_search = $("#roomNo_search").val();
                let studentNo_search = $("#studentNo_search").val();
                let name = $("#studentName_search").val();
                let sex = $("input[name='sex']:checked").val();
                let TypeOfAccommodation = $("input[name='TypeOfAccommodation']:checked").val();

                $.ajax({
                    url: baseUrl + "student/list",
                    type: "post",
                    data: {
                        currentIndex: currentIndex,
                        pageSize: pageSize,
                        departmentId: department_search,
                        level: level_search,
                        directionId: direction_search,
                        classesId: classes_search,
                        areaId: area_search,
                        floorId: floor_search,
                        roomId: roomNo_search,
                        studentNo: studentNo_search,
                        name: name,
                        sex: sex,
                        TypeOfAccommodation: TypeOfAccommodation
                    },
                    success: function (data) {
                        if (data.result) {
                            currentIndex = data.page.currentIndex;
                            totalSize = data.page.totalSize;
                            student.page();
                            laytpl($("#list-tpl").text()).render(data, function (html) {
                                $("#list").html(html);
                            });
                            form.render();
                        }
                    }
                });
            },
            showDormAndHideDorm: function () {
                if ($("input[name='TypeOfAccommodation']:checked").val() === "1") {
                    $("#dorm").show();
                } else {
                    $("#dorm").hide();
                }
            },
            loadDirectionsByDepartmentId: function (id) {
                $.post(baseUrl + "/communication/queryDirectionByDepartmentId", {departmentId: id}, function (data) {
                    if (data.result) {
                        $("#direction_search").html(`<option value="">方向</option>`).append(loadOptionsHtml(data.data, "-"));

                        form.render();
                    }
                })
            }, loadClassByDepartmentId: function (id) {
                $.post(baseUrl + "/communication/queryClassByDepartmentId", {departmentId: id}, function (data) {
                    if (data.result) {
                        $("#classes_search").html(`<option value="">班级</option>`).append(loadOptionsHtml(data.data, "-"));

                        form.render();
                    }
                })
            },
            loadDepartmentOrDirectionArea: function (data, selectId) {
                let _html = "<option value=\"\">区</option>";
                for (let i = 0; i < data.length; ++i) {
                    if (selectId == data[i].id) {
                        _html += `<option  selected value="` + data[i].id + `">` + data[i].name + `</option>`;
                    } else {
                        _html += `<option value="` + data[i].id + `">` + data[i].name + `</option>`;
                    }
                }

                return _html;
            },
            loadDepartmentOrDirectionFloor: function (data, selectId) {
                let _html = "<option value=\"\">楼层</option>";
                for (let i = 0; i < data.length; ++i) {
                    if (selectId == data[i].id) {
                        _html += `<option  selected value="` + data[i].id + `">` + data[i].name + `</option>`;
                    } else {
                        _html += `<option value="` + data[i].id + `">` + data[i].name + `</option>`;
                    }
                }

                return _html;
            },
            preview: function (studentNo) {
                $.post(baseUrl + "/student/update", {studentNo: studentNo}, function (data) {
                    $("#phone").text("").append(data.student[0].student_contact_method);
                    $("#qq").text("").append(data.student[0].qq);
                    $("#email").text("").append(data.student[0].email);
                    $("#images").text("").attr("src", HEAD_IMAGE_PREFIX + data.student[0].head_image);
                    $("#studentNo").text("").append(data.student[0].no);
                    $("#studentName").text("").append(data.student[0].name);
                    $("#studentSex").text("").append(data.student[0].gender);
                    $("#famous_family").text("").append(data.student[0].famous_family);
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
                    $("#family_phone").text("").append(data.student[0].family_phone);
                    $("#family").html("")
                    for (var i = 0; i < data.family.length; i++) {
                        $("#family").append("<tr> <th>" + data.family[i].relationship + "：</th>" +
                            "<th  >政治面貌：" + data.family[i].political_status + "</th>" +
                            "<th colspan='2'>工作单位：" + data.family[i].work_place + "</th>" +
                            "<th >职务：" + data.family[i].staff + "</th>" +
                            "<th>联系电话：" + data.family[i].phone + "</th> </tr>");
                    }
                    $("#emergency_contact_name").text("").append(data.student[0].emergency_contact_name);
                    $("#emergency_contact_method").text("").append(data.student[0].emergency_contact_method);
                    $("#experience_div").html("")
                    for (var i = 0; i < data.experience.length; i++) {
                        $("#experience_div").append("<tr> <th>" + data.experience[i].start_time + "-" + data.experience[i].end_time + "：</th>" +
                            "<th  >" + data.experience[i].work_place + "</th>" +
                            "<th >" + data.experience[i].staff + "</th>");
                    }
                    $("#student_type").text("").append(data.student[0].student_type);
                    $("#sat_score").text("").append(data.student[0].sat_score);
                    $("#profession").text("").append(data.student[0].profession);
                    $("#direction").text("").append(data.student[0].direction);
                    $("#classes").text("").append(data.student[0].classes);
                    $("#student_status").text("").append(data.student[0].student_status);
                    $("#practice_learning_type").text("").append(data.student[0].practice_learning_type);
                    $("#payment_status_first_year").text("").append(data.student[0].payment_status_first_year);
                    $("#payment_status_second_year").text("").append(data.student[0].payment_status_second_year);
                    $("#payment_status_third_year").text("").append(data.student[0].payment_status_third_year);
                    $("#area").text("").append(data.student[0].area);
                    $("#floor").text("").append(data.student[0].floor);
                    $("#room").text("").append(data.student[0].room);
                    $("#hard_type").text("").append(data.student[0].hard_type);
                    $("#own_punishment").text("").append(data.student[0].own_punishment);

                });
                layer.open({
                    type: 1,
                    title: "学生信息",
                    area: ["100%", "100%"]
                    , content: $("#update")
                });

            },
            studentUpdate: function (studentName, studentNo) {
                $.ajax({
                    url: "${baseurl}/student/studentUpdate",
                    data: {studentNo: studentNo},
                    success: function (data) {
                        if (data.result) {

                            let studentList = data.students;
                            let familyList = data.students_family;
                            let professionList = data.professionList;
                            let directionList = data.directionList;
                            let classesList = data.classesList;
                            let experienceList = data.experienceList;

                            $("#updateStudentNo").val(studentList.no)
                            $("#updateStudentName").val(studentList.name);
                            $("input:radio[value='" + studentList.gender + "']").prop('checked', 'true');
                            $("#updateStudentNationalities").val(studentList.famous_family);
                            $("#updateStudentIdCard").val(studentList.idcard);
                            $("#updateStudentNativePlace").val(studentList.native_place);
                            $("#updateStudentBirthday").val(studentList.born);
                            $("input[type='radio'][name='isMarry'][value='" + studentList.is_marry + "']").attr("checked", "checked");
                            $("#updateStudentHeight").val(studentList.height);
                            $("#updateStudentWight").val(studentList.weight);
                            $("input:radio[value='" + studentList.health_status + "']").prop('checked', 'true');
                            $("input:radio[value=" + studentList.student_type + "]").prop('checked', 'true');

                            var count = $("#updateStudentBloodType option").length;
                            for (var i = 0; i < count; i++) {
                                if ($("#updateStudentBloodType").get(0).options[i].text == studentList.blood) {
                                    $("#updateStudentBloodType").get(0).options[i].selected = true;
                                }
                            }

                            var count1 = $("#updateStudentPoliticalOutlook option").length;
                            for (var i = 0; i < count1; i++) {
                                if ($("#updateStudentPoliticalOutlook").get(0).options[i].text === studentList.political_status) {
                                    $("#updateStudentPoliticalOutlook").get(0).options[i].selected = true;
                                }
                                if (studentList.political_status != "中共党员" && studentList.political_status != "预备党员" && studentList.political_status != "共青团员" && studentList.political_status != "积极分子" && studentList.political_status != "群众" && studentList.political_status != "") {
                                    $("#updateStudentPoliticalOutlook").get(0).options[count1 - 1].selected = true;
                                    $("#otherParty").show();
                                    $("#otherUpdateStudentPoliticalOutlook").val(studentList.political_status);
                                }
                            }

                            var count2 = $("#updateStudent_pre_school_education option").length;
                            for (var i = 0; i < count2; i++) {
                                if ($("#updateStudent_pre_school_education").get(0).options[i].text === studentList.pre_school_education) {
                                    $("#updateStudent_pre_school_education").get(0).options[i].selected = true;
                                }
                                if (studentList.pre_school_education != "高中" && studentList.pre_school_education != "三校生" && studentList.political_status != "") {
                                    $("#updateStudent_pre_school_education").get(0).options[count2 - 1].selected = true;
                                    $("#pre_school_education").show();
                                    $("#other_updateStudent_pre_school_education").val(studentList.pre_school_education);
                                }
                            }

                            $("input:radio[value='" + studentList.student_classify + "']").prop('checked', 'true');
                            $("#Identity_card_address").val(studentList.idcard_address);

                            $("#detailedAddresses").val(studentList.actual_address)
                            $("#update_name_of_the_source").val(studentList.origin_address)

                            $("#updateStudentZip_code").val(studentList.family_zip_code)
                            $("#updateStudentHome_phone").val(studentList.family_phone)

                            $("#family_information").append(``)

                            for (var j = 0; j < familyList.length; j++) {
                                $("#family_member_information").append(
                                    `<tr id="family_information1" class="family_information1">
                                        <th colspan="2" ><span class = "family_relationship"></span><span>
                               <div class="layui-input-inline" style="width: 60%">
                                   <input type="text" name="text" required lay-verify="required"
                                          placeholder="请输入内容" autocomplete="off" class="layui-input updateStudentParentsName"
                                          id="updateStudentParentsName">
                                </div>
                           </span></th>
                                        <th colspan="4">政治面貌：<span>
                               <div class="layui-input-inline" style="width: 30%">
                                 <select name="politicalOutlook1" lay-filter="politicalOutlook" id="updateStudentParent_political_status" class="updateStudentParent_political_status">
                                   <option value="">请选择</option>
                                   <option value="1" >中共党员</option>
                                   <option value="2">预备党员</option>
                                   <option value="3">共青团员</option>
                                   <option value="4">积极分子</option>
                                   <option value="5">群众</option>
                                   <option value="6">其他党派</option>
                                 </select>
                               </div>
                                <span id="otherParty1" class="otherParty1" style="display: none">其他党派:
                                     <div class="layui-input-inline">
                                       <div class="layui-input-inline">
                                         <input type="text" name="otherPartyName" required
                                                lay-verify="required" placeholder="请输入党派名称"
                                                autocomplete="off" class="layui-input other_updateStudentParent_political_status"
                                                id="other_updateStudentParent_political_status">
                                       </div>
                                     </div>
                               </span>
                               </span></th>
                                    </tr>
                               `)
                                /*let count = 0;
                                count = this($(".updateStudentParent_political_status option")).length;
                                alert(count)
                                for (var i = 0; i < count; i++) {
                                    if ($("#updateStudentParent_political_status").get(0).options[i].text == familyList[j].political_status) {
                                        $("#updateStudentParent_political_status").get(0).options[i].selected = true;
                                    }
                                    if (familyList[j].political_status!= "共青团员" && familyList[j].political_status!= "预备党员"&& familyList[j].political_status!= "中共党员"&& familyList[j].political_status!= "积极分子"&& familyList[j].political_status!= "群众" && familyList[j].political_status!= "") {
                                        $("#updateStudentParent_political_status").get(0).options[count - 1].selected = true;
                                        $("#otherParty1").show();
                                        $("#other_updateStudentParent_political_status").val(familyList[j].political_status);
                                    }
                                }*/
                                $("#family_member_information").append(`
                           <tr id="family_information2">
                                        <th colspan="2">工作单位：<span>
                               <div class="layui-input-inline" style="width: 60%">
                                   <input type="text" name="text" required lay-verify="required"
                                          placeholder="请输入内容" autocomplete="off" class="layui-input updateStudentParent_employer"
                                          id="updateStudentParent_employer">
                                </div>
                           </span></th>
                                        <th colspan="2">职务：<span>
                               <div class="layui-input-inline" style="width: 60%">
                                   <input type="text" name="text" required lay-verify="required"
                                          placeholder="请输入内容" autocomplete="off" class="layui-input updateStudentParent_duties"
                                          id="updateStudentParent_duties">
                                </div>
                           </span></th>
                                        <th colspan="2">联系电话：<span>
                               <div class="layui-input-inline" style="width: 60%">
                                   <input type="text" name="text" required lay-verify="required"
                                          placeholder="请输入内容" autocomplete="off" class="layui-input updateStudentParent_phone"
                                          id="updateStudentParent_phone">
                                </div>
                           </span></th>
                                    </tr>`)

                            }

                            let family_relationship = $(".family_relationship");//称谓
                            let updateStudentParentsName = $(".updateStudentParentsName");//家庭成员姓名

                            let updateStudentParent_employer = $(".updateStudentParent_employer");//工作单位
                            let updateStudentParent_duties = $(".updateStudentParent_duties");//职务
                            let updateStudentParent_phone = $(".updateStudentParent_phone");//联系电话
                            for (var i = 0; i < familyList.length; i++) {
                                $(family_relationship[i].append(familyList[i].relationship))
                                $(updateStudentParentsName[i]).val(familyList[i].name)

                                $(updateStudentParent_employer[i]).val(familyList[i].work_place);
                                $(updateStudentParent_duties[i]).val(familyList[i].work_place);
                                $(updateStudentParent_phone[i]).val(familyList[i].phone);

                            }


                            $("input[type='radio'][name='whetherToTransfer'][value='" + studentList.account_in + "']").attr("checked", "checked");
                            $("input[type='radio'][name='is_the_file_transferred'][value='" + studentList.file_in + "']").attr("checked", "checked");
                            $("input[type='radio'][name='birthplaceName'][value='" + studentList.area_origin_name + "']").attr("checked", "checked");
                            $("#Pre_school_name").val(studentList.pre_school_name);

                            $("#updateStudent_emergency_contact").val(studentList.emergency_contact_name);
                            $("#updateStudent_emergency_contact_phone").val(studentList.emergency_contact_method);

                            $("#Pre_enrollment_file_unit").val(studentList.pre_school_file_where_location);

                            let school_account_where_the_police_station_detailed = studentList.pre_school_account_where_station.replace("-", "");
                            $("#school_account_where_the_police_station_detailed").val(school_account_where_the_police_station_detailed);

                            $("#studentsProfessionList").html("").append(`<option value=""></option>` + loadOptionsHtml(professionList, studentList.origin_profession_id));
                            $("#studentsNowProfessional").html("").append(`<option value=""></option>` + loadOptionsHtml(professionList, studentList.profession_id));
                            $("#employment_direction").html("").append(`<option value=""></option>` + loadOptionsHtml(directionList, studentList.direction_id));
                            $("#student_class").html("").append(`<option value=""></option>` + loadOptionsHtml(classesList, studentList.classes_id));

                            for (let i = 0; i < experienceList.length; i++) {
                                $("#educational_experience").append(`<tr>
                                        <th colspan="2"><span>
                                            <div class="layui-input-inline" style="width: 30%;float: left">
                                                <input name="date" lay-verify="date" placeholder="yyyy-mm-dd"
                                                       autocomplete="off" class="layui-input educational_experience_start"
                                                       onclick="layui.laydate({elem: this})" type="text"
                                                       id="educational_experience_start">
                                            </div>
                                            <span style="float: left;margin-top: 0px"><p class="layui-input-inline" style="align-content:center">--至--</p></span>
                                             <div class="layui-input-inline" style="width: 30%;float: left">
                                                <input name="date" lay-verify="date" placeholder="yyyy-mm-dd"
                                                       autocomplete="off" class="layui-input educational_experience_end"
                                                       onclick="layui.laydate({elem: this})" type="text"
                                                       id="educational_experience_end">
                                            </div>
                                        </span></th>
                                        <th colspan="2"><span>
                                            <div class="layui-input-inline" style="width: 90%">
                                                <input type="text" name="text" required lay-verify="required"
                                                       placeholder="请输入学校名称" autocomplete="off" class="layui-input update_schoolName" id="update_schoolName">
                                             </div>
                                        </span></th>
                                        <th colspan="2"><span>
                                            <div class="layui-input-inline" style="width: 90%">
                                                <input type="text" name="text" required lay-verify="required"
                                                       placeholder="担任什么职务" autocomplete="off" class="layui-input update_duties" id="update_duties">
                                             </div>
                                        </span></th>
                                    </tr>`)

                            }

                            let updateSchoolName = $(".update_schoolName");
                            let educational_experience_start = $(".educational_experience_start");
                            let educational_experience_end = $(".educational_experience_end");
                            let update_duties = $(".update_duties");
                            for (let i = 0; i < experienceList.length; i++) {
                                $(updateSchoolName[i]).val(experienceList[i].work_place);
                                $(educational_experience_start[i]).val(experienceList[i].start_time);
                                $(educational_experience_end[i]).val(experienceList[i].end_time);
                                $(update_duties[i]).val(experienceList[i].staff);
                            }


                            $("input[type='radio'][name='student_type1'][value='" + studentList.student_type + "']").attr("checked", "checked");
                            $("#upadte_SAT_score").val(studentList.sat_score);


                            var count3 = $("#update_student_status option").length;
                            for (var i = 0; i < count3; i++) {
                                if ($("#update_student_status").get(0).options[i].text == studentList.student_status) {
                                    $("#update_student_status").get(0).options[i].selected = true;
                                }
                            }
                            var count4 = $("#update_payment_status option").length;
                            for (var i = 0; i < count4; i++) {
                                if ($("#update_payment_status").get(0).options[i].text == studentList.payment_status_first_year) {
                                    $("#update_payment_status").get(0).options[i].selected = true;
                                }
                            }
                            var count5 = $("#update_payment_status2 option").length;
                            for (var i = 0; i < count5; i++) {
                                if ($("#update_payment_status2").get(0).options[i].text == studentList.payment_status_second_year) {
                                    $("#update_payment_status2").get(0).options[i].selected = true;
                                }
                            }
                            var count6 = $("#update_payment_status3 option").length;
                            for (var i = 0; i < count6; i++) {
                                if ($("#update_payment_status3").get(0).options[i].text == studentList.payment_status_third_year) {
                                    $("#update_payment_status3").get(0).options[i].selected = true;
                                }
                            }
                            var count7 = $("#update_practical_type option").length;
                            for (var i = 0; i < count7; i++) {
                                if ($("#update_practical_type").get(0).options[i].text == studentList.practice_learning_type) {
                                    $("#update_practical_type").get(0).options[i].selected = true;
                                }
                                if (studentList.practice_learning_type != "合作企业" && studentList.practice_learning_type != "自主实习" && studentList.practice_learning_type != "创新创业" && studentList.practice_learning_type != "专升本" && studentList.practice_learning_type != "") {
                                    $("#update_practical_type").get(0).options[count7 - 1].selected = true;
                                    $("#show_other_practical_type").show();
                                    $("#other_practical_type").val(studentList.practice_learning_type);
                                }

                            }

                            $("#Amount_of_arrears").val(studentList.arrears_first_year);
                            $("#Amount_of_arrears2").val(studentList.arrears_second_year);
                            $("#Amount_of_arrears3").val(studentList.arrears_third_year);

                            if (studentList.arrears_first_year != null) {
                                $("#showAmount_of_arrears").show();
                            } else {
                                $("#showAmount_of_arrears").hide();
                            }

                            if (studentList.arrears_second_year != null) {
                                $("#showAmount_of_arrears2").show();
                            } else {
                                $("#showAmount_of_arrears2").hide();
                            }

                            if (studentList.arrears_third_year != null) {
                                $("#showAmount_of_arrears3").show();
                            } else {
                                $("#showAmount_of_arrears3").hide();
                            }

                            $("input[type='radio'][name='update_hard_type'][value='" + studentList.hard_type + "']").attr("checked", "checked");
                            form.render();

                            $("#update_award_or_honor").val(studentList.own_punishment);
                            student.queryAreaAndFloorAndRoomByRoomIdOfUpdate(studentList.room_id)
                            let dormsHtml = "";
                        }
                    }
                })
                layer.open({
                    type: 1,
                    title: "学生信息修改",
                    area: ["100%", "100%"],
                    content: $("#updateStudent")
                })
            },

            queryAreaAndFloorAndRoomByRoomIdOfUpdate: function (roomId) {
                $.post(baseUrl + "dorm/room/queryAreaAndFloorAndRoomByRoomId",
                    {
                        roomId: roomId
                    },
                    function (data) {
                        if (data.result) {
                            let dormsHtml = "";
                            dormsHtml += data.data.dorms.areaName + " # ";
                            dormsHtml += data.data.dorms.floorName + " # ";
                            dormsHtml += data.data.dorms.roomName + "宿舍";

                            $("#updateDorms").val(dormsHtml);
                        }
                    })
            },


            queryAreaAndFloorOfUpdate: function () {
                $.post(baseUrl + "dorm/room/showAreaAndFloorsToQuery", function (data) {
                    if (data.result) {
                        $("#queryAreas").html(student.loadDepartmentOrDirection(data.data.queryAreaOfRoom, "-"))
                        $("#queryFloors").html(student.loadDepartmentOrDirection(data.data.queryFloorOfRoom, "-"))
                    }
                    form.render();
                })
            },

            loadDepartmentOrDirection: function (data, selectId) {
                let _html = "<option value=\"\">直接选择或搜索选择</option>";
                for (let i = 0; i < data.length; ++i) {
                    if (selectId == data[i].id) {
                        _html += `<option  selected value="` + data[i].id + `">` + data[i].name + `</option>`;
                    } else {
                        _html += `<option value="` + data[i].id + `">` + data[i].name + `</option>`;
                    }
                }

                return _html;
            },
            updateStudentList:function () {
                alert($("#updateStudentNo").val());
                alert($("input[name='sex'][checked]").val());
                alert($("#updateStudentSex")).val()

            },

            showUpdateDorms: function () {
                $("#showUpdateDorms").show();
            },

            updateDetailedAddress: function () {
                $("#updateDetailedAddress").show()
            },
            showUpdate_name_of_the_source: function () {
                $("#showUpdate_name_of_the_source").show();
            },
            update_Pre_enrollment_file_unit: function () {
                $("#update_Pre_enrollment_file_unit").show();
            },
            school_account_where_the_police_station_detailed: function () {
                $("#show_Pre_school_account_where_the_police_station_detailed").show();
            }
        };


        function loadALlDepartments() {
            $.post(baseUrl + "/department/allDepartments", function (data) {
                if (data.result) {
                    $("#department_search").html(`<option value="" selected>系</option>`).append(loadOptionsHtml(data.data, "-"));
                }
            });
        }

        function loadAllLevels() {
            let date = new Date();
            let year = date.getFullYear();
            let differ = year - 2017;
            if (differ >= 0) {
                for (let i = differ; i >= 0; i--) {
                    $("#level_search").append(`<option value="` + year + `">` + (year + i) + `</option>`)
                }
            }
        }


        function loadAllDirections() {
            $.post(baseUrl + "/communication/queryDirectionByDepartment", function (data) {
                if (data.result) {
                    $("#direction_search").html(`<option value="">方向</option>`).append(loadOptionsHtml(data.data, "-"))
                }
            })
        }

        function loadAllClassess() {
            $.post(baseUrl + "/communication/queryClass", function (data) {
                if (data.result) {
                    $("#classes_search").html(`<option value="">班级</option>`).append(loadOptionsHtml(data.data, "-"));
                }
            });
        }

        function loadOptionsHtml(data, selectId) {
            let _html = "";
            for (let i = 0; i < data.length; ++i) {
                if (selectId == data[i].id) {
                    _html += `<option  selected value="` + data[i].id + `">` + data[i].name + `</option>`;
                } else {
                    _html += `<option value="` + data[i].id + `">` + data[i].name + `</option>`;
                }
            }

            return _html;
        }

        function queryAreaAndFloor() {
            $.post(baseUrl + "dorm/room/showAreaAndFloorsToQuery", function (data) {
                if (data.result) {
                    $("#area_search").html(student.loadDepartmentOrDirectionArea(data.data.queryAreaOfRoom, "-"))
                    $("#floor_search").html(student.loadDepartmentOrDirectionFloor(data.data.queryFloorOfRoom, "-"))
                }
                form.render();
            })
        }

        $(function () {
            student.list();
            student.showDormAndHideDorm();
            loadALlDepartments();
            loadAllDirections();
            loadAllLevels();
            loadAllClassess();
            student.queryAreaAndFloorOfUpdate()
            queryAreaAndFloor();
            form.render();

            form.on('select(department)', function (data) {

                $("#department_search").html(student.loadClassByDepartmentId(data.value));
                $("#direction_search").html(student.loadDirectionsByDepartmentId(data.value));
            });

            form.on('select(dorm)', function (data) {
                var id = data.value;

                $.post(baseUrl + "dorm/room/showAreaAndFloors", {areaId: data.value}, function (data) {
                    if (data.result) {
                        var queryAreaOfRoom = data.data.queryAreaOfRoom
                        var queryFloorOfRoom = data.data.queryFloorOfRoom

                        $("#area_search").html(student.loadDepartmentOrDirectionArea(queryAreaOfRoom, id))
                        $("#floor_search").html(student.loadDepartmentOrDirectionFloor(queryFloorOfRoom), "-")
                        form.render();
                    }
                })
            })

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


            //监听select选择
            form.on('select(pre_school_education)', function (data) {
                if (data.value === '3') {
                    $("#pre_school_education").show();
                } else {
                    $("#pre_school_education").hide();
                }
            })

            //监听缴费状态
            form.on('select(update_payment_status)', function (data) {
                if (data.value == 5) {
                    $("#showAmount_of_arrears").show();
                } else {
                    $("#showAmount_of_arrears").hide();
                }
            })
            form.on('select(update_payment_status2)', function (data) {
                if (data.value == 5) {
                    $("#showAmount_of_arrears2").show();
                } else {
                    $("#showAmount_of_arrears2").hide();
                }
            })
            form.on('select(update_payment_status3)', function (data) {
                if (data.value == 5) {
                    $("#showAmount_of_arrears3").show();
                } else {
                    $("#showAmount_of_arrears3").hide();
                }
            })

            //监听实践类型
            form.on('select(update_practical_type)', function (data) {
                if (data.value == 5) {
                    $("#show_other_practical_type").show();
                } else {
                    $("#show_other_practical_type").hide();
                }
            });

            //监听根据区id显示楼层
            form.on('select(modules_3)', function (data) {
                var id = data.value;

                $.post(baseUrl + "dorm/room/showAreaAndFloors", {areaId: data.value}, function (data) {
                    if (data.result) {
                        var queryAreaOfRoom = data.data.queryAreaOfRoom
                        var queryFloorOfRoom = data.data.queryFloorOfRoom

                        $("#queryAreas").html(student.loadDepartmentOrDirection(queryAreaOfRoom, id))
                        $("#queryFloors").html(student.loadDepartmentOrDirection(queryFloorOfRoom, "-"))
                        form.render();
                    }
                })
            })

            //监听根据楼层id显示宿舍
            form.on('select(modules_2)', function (data) {
                var id = data.value;

                $.post(baseUrl + "dorm/room/showFloorsAndRooms", {floorId: data.value}, function (data) {
                    if (data.result) {
                        var queryRoomList = data.data.queryRoomList

                        $("#queryRooms").html(student.loadDepartmentOrDirection(queryRoomList, "-"))
                        form.render();
                    }
                })
            })

            //监听学生政治面貌
            form.on('select(politicalOutlook)', function (data) {
                if (data.value === '6') {
                    $("#otherParty").show();
                } else {
                    $("#otherParty").hide();
                }
            });
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
