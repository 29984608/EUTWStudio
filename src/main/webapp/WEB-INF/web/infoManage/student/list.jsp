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
                                    <select name="modules" lay-filter="department" lay-search=""
                                            id="department_search">
                                        <option value="">系</option>
                                    </select>
                                </div>
                            </div>
                        </div>

                        <div class="layui-input-inline">
                            <div class="layui-inline">
                                <div class="layui-input-inline">
                                    <select name="modules1" lay-filter="modules_2" lay-search=""
                                            id="level_search">
                                        <option value="">年级</option>
                                    </select>
                                </div>
                            </div>
                        </div>

                        <div class="layui-input-inline">
                            <div class="layui-inline">
                                <div class="layui-input-inline">
                                    <select name="modules1" lay-filter="modules_2" lay-search=""
                                            id="profession_search">
                                        <option value="">专业</option>
                                    </select>
                                </div>
                            </div>
                        </div>

                        <div class="layui-input-inline">
                            <div class="layui-inline">
                                <div class="layui-input-inline">
                                    <select name="modules" lay-filter="modules_3" lay-search=""
                                            id="direction_search">
                                        <option value="">方向</option>
                                    </select>
                                </div>
                            </div>
                        </div>

                        <div class="layui-input-inline">
                            <div class="layui-inline">
                                <div class="layui-input-inline">
                                    <select name="modules1" lay-filter="modules_2" lay-search=""
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
                                <div>
                                    <label class="layui-form-label" style="font-size: 13px">性别</label>
                                    <div class="layui-input-inline" id="sexQuery" style="width: 20%;">
                                        <input type="radio" name="sexQuery" value="" title="全部" checked="">
                                        <input type="radio" name="sexQuery" value="M" title="男">
                                        <input type="radio" name="sexQuery" value="F" title="女">
                                    </div>
                                </div>
                                <div>
                                    <label class="layui-form-label" style="font-size: 13px">住宿类型</label>
                                    <div class="layui-input-inline" id="TypeOfAccommodation"
                                         onclick="student.showDormAndHideDorm()" style="width: 30%">

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
                    </div>

                    <div class="layui-form-item">
                        <span id="dorm">
                            <div class="layui-input-inline">
                                <div class="layui-inline">
                                    <div class="layui-input-inline">
                                        <select name="modules" lay-filter="dorm" lay-search=""
                                                id="area_search">
                                            <option value="">区</option>
                                        </select>
                                    </div>
                                </div>
                            </div>

                            <div class="layui-input-inline">
                                <div class="layui-inline">
                                    <div class="layui-input-inline">
                                        <select name="modules1" lay-filter="modules_2"
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
                                        <input type="text" name="title" id="roomNo_search"
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
                            <th>专业</th>
                            <th>方向</th>
                            <th>班级</th>
                            <th>住宿类型</th>
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
    var studentInfo;
    var teacherInfo;
    var experienceInfo;
    var familyInfo;
    let imgName;
    let famousFamily;
    let departmentList;
    let addStudentFamilyInfoIndex;
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
                let sex = $("input[name='sexQuery']:checked").val();
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
                    $("#student_contact_method").text("").append(data.student[0].student_contact_method );
                    $("#actual_address").text("").append(data.student[0].actual_address );
                    $("#family").html("")
                    for (var i = 0; i < data.family.length; i++) {
                        $("#family").append("<tr> <th colspan='1'>" + data.family[i].relationship + "：" + data.family[i].name + "</th>" +
                            "<th colspan='2'>政治面貌：<br>" + data.family[i].political_status + "</th>" +
                            "<th colspan='3'>工作单位：<br>" + data.family[i].work_place + "</th>" +
                            "<th colspan='1' style='width: 70px'>职务：<br>" + data.family[i].staff + "</th>" +
                            "<th colspan='1'>联系电话：<br>" + data.family[i].phone + "</th> </tr>");
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

                            studentInfo = data.students;
                            teacherInfo = data.teacherList;
                            experienceInfo = data.experienceList;
                            familyInfo = data.students_family;
                            famousFamily = data.famousFamily;
                            departmentList = data.departmentList;
                            let studentList = data.students;
                            let familyList = data.students_family;
                            let professionList = data.professionList;
                            let directionList = data.directionList;
                            let classesList = data.classesList;
                            let experienceList = data.experienceList;
                            let teacherList = data.teacherList;
                            let famousFamilyList = data.famousFamilyList;

                            $("#studentPhone").val(studentList.student_contact_method);
                            $("#studentQQ").val(studentList.qq);
                            $("#studentEmail").val(studentList.email);

                            $("#imagesToUpdate").text("").attr("src", HEAD_IMAGE_PREFIX + studentList.head_image);
                            $("#updateStudentNo").val(studentList.no)
                            $("#updateStudentName").val(studentList.name);
                            $("input:radio[value='" + studentList.gender + "'][name='sexOfUpdate']").prop('checked', 'true');
                            if (famousFamily != null) {
                                $("#updateStudentNationalities").html("").append(loadOptionsHtmlOfFamousFamilyList(famousFamilyList, studentList.famous_family));

                            }
                            $("#updateStudentIdCard").val(studentList.idcard);
                            $("#updateStudentNativePlace").val(studentList.native_place);
                            $("#updateStudentBirthday").val(studentList.born);
                            $("input[type='radio'][name='isMarry'][value='" + studentList.is_marry + "']").attr("checked", 'true');
                            $("input[type='radio'][name='accommodation_type'][value='" + studentList.stay_type + "']").attr("checked", 'true');
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
                            $("input:radio[value='" + studentList.is_out + "']").prop('checked', 'true');
                            $("#Identity_card_address").val(studentList.idcard_address);

                            $("#detailedAddresses").val(studentList.actual_address)
                            $("#update_name_of_the_source").val(studentList.origin_address)

                            $("#updateStudentZip_code").val(studentList.family_zip_code)
                            $("#updateStudentHome_phone").val(studentList.family_phone)

                            $("#family_information").append(``)

                            student.familyFnformation(familyList);


                            $("input[type='radio'][name='whetherToTransfer'][value='" + studentList.account_in + "']").attr("checked", "checked");
                            $("input[type='radio'][name='is_the_file_transferred'][value='" + studentList.file_in + "']").attr("checked", "checked");
                            $("input[type='radio'][name='birthplaceName'][value='" + studentList.area_origin_name + "']").attr("checked", "checked");
                            $("#Pre_school_name").val(studentList.pre_school_name);

                            $("#updateStudent_emergency_contact").val(studentList.emergency_contact_name);
                            $("#updateStudent_emergency_contact_phone").val(studentList.emergency_contact_method);

                            $("#Pre_enrollment_file_unit").val(studentList.pre_school_file_where_location);
                            let school_account_where_the_police_station_detailed = []
                            if (studentList.pre_school_account_where_station != null) {
                                school_account_where_the_police_station_detailed = studentList.pre_school_account_where_station.replace("-", "");
                            }
                            $("#school_account_where_the_police_station_detailed").val(studentList.pre_school_account_where_station);

                            $("#studentsProfessionList").html("").append(`<option value=""></option>` + loadOptionsHtml(professionList, studentList.origin_profession_id));
                            $("#studentsNowProfessional").html("").append(`<option value=""></option>` + loadOptionsHtml(professionList, studentList.profession_id));
                            $("#employment_direction").html("").append(`<option value=""></option>` + loadOptionsHtml(directionList, studentList.direction_id));
                            $("#student_department").html("").append(`<option value=""></option>` + loadOptionsHtml(departmentList, studentList.department_id));
                            let oneDepartmentId = studentList.department_id;
                            var oneShowClasses = [];
                            classesList.forEach(item => {
                                if (oneDepartmentId == item.department_id) {
                                    oneShowClasses.push(item);
                                }
                            })
                            $("#student_class").html("").append(`<option value=""></option>` + loadOptionsHtml(oneShowClasses, studentList.classes_id));
                            form.render();
                            //监听系,从而动态获取相应的班级
                            form.on('select(student_departments)', function (data) {
                                let department_id = data.value;
                                $.post(baseUrl + "/student/showAutoClassByDepartment", {departmentId: department_id}, function (resultData) {
                                    $("#student_class").html(loadOptionsHtmlOfClass(resultData.data));
                                    form.render();
                                })
                            })

                            student.educationalExperience(experienceList);

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

                            //职业导师
                            $("#update_career_mentor").html("").append(`<option value=""></option>` + loadOptionsHtmlToTeacher(teacherList, studentList.teacher_id))
                            //社区辅导员
                            $("#update_community_counselor").html("").append(`<option value=""></option>` + loadOptionsHtmlToTeacher(teacherList, studentList.community_teacher_id))

                            $("#Amount_of_arrears").val(studentList.arrears_first_year);
                            $("#Amount_of_arrears2").val(studentList.arrears_second_year);
                            $("#Amount_of_arrears3").val(studentList.arrears_third_year);

                            if (studentList.arrears_first_year != null && studentList.arrears_first_year != '0') {
                                $("#showAmount_of_arrears").show();
                            } else {
                                $("#showAmount_of_arrears").hide();
                            }

                            if (studentList.arrears_second_year != null && studentList.arrears_second_year != '0') {
                                $("#showAmount_of_arrears2").show();
                            } else {
                                $("#showAmount_of_arrears2").hide();
                            }

                            if (studentList.arrears_third_year != null && studentList.arrears_third_year != '0') {
                                $("#showAmount_of_arrears3").show();
                            } else {
                                $("#showAmount_of_arrears3").hide();
                            }

                            $("input[type='radio'][name='update_hard_type'][value='" + studentList.hard_type + "']").attr("checked", "checked");
                            form.render();

                            $("#update_award_or_honor").val(studentList.own_punishment);
                            student.queryAreaAndFloorAndRoomByRoomIdOfUpdate(studentList.room_id)
                            //如果住宿类型为校外,则隐藏宿舍信息,否则显示
                            //1表示校内,2表示校外
                            if (studentList.stay_type == "2") {
                                $("#dorms").hide();
                            } else {
                                $("#dorms").show();
                            }
                        }
                    }
                })
                layer.open({
                    type: 1,
                    title: "学生信息修改",
                    area: ["100%", "100%"],
                    closeBtn: 1,
                    content: $("#updateStudent"),
                    cancel: function () {
                        location.reload();
                    }
                })
                form.render();
            },
            familyFnformation: function (familyList) {
                $("#family_member_information").html("");
                for (var j = 0; j < familyList.length; j++) {
                    let politicalStatus = familyList[j].political_status;
                    let isOther = student.isOther(politicalStatus);
                    let isShow = isOther ? "display" : "none";
                    $("#family_member_information").append(
                        `<tr id="family_information1" class="family_information1" style="float: left;">
                                        <th colspan="1"><span class = "family_relationship"></span><span>
                               ：<div class="layui-input-inline" style="width: 60%">
                                   <input type="text" name="text"
                                          placeholder="请输入成员姓名" autocomplete="off" class="layui-input updateStudentParentsName"
                                          id="updateStudentParentsName">
                                </div>
                           </span></th>
                            <th colspan="2">联系方式：<span>
                               <div class="layui-input-inline" style="width: 60%">
                                   <input type="text" name="text"
                                          placeholder="请输入内容" autocomplete="off" class="layui-input updateStudentParent_phone"
                                          id="updateStudentParent_phone">
                                </div>
                           </span></th>
                            <th colspan="2">工作单位：<span>
                               <div class="layui-input-inline" style="width: 60%">
                                   <input type="text" name="text"
                                          placeholder="请输入内容" autocomplete="off" class="layui-input updateStudentParent_employer"
                                          id="updateStudentParent_employer">
                                </div>
                           </span></th>
                                    </tr>
                                    <tr>

                        </tr>
                               `)

                    $("#family_member_information").append(`
                           <tr id="family_information2" style="float: left;margin-bottom: 20px">
                           <th colspan="5"><span>
                            <div class="political">
                               政治面貌： <div class="layui-input-inline" >
                                 <select name="politicalOutlook1" lay-filter="politicalOutlookParent"  class="updateStudentParent_political_status">
                                   <option value="">请选择</option>
                                   <option value="1" ` + (politicalStatus === "中共党员" ? "selected" : "") + `>中共党员</option>
                                   <option value="2" ` + (politicalStatus === "预备党员" ? "selected" : "") + `>预备党员</option>
                                   <option value="3" ` + (politicalStatus === "共青团员" ? "selected" : "") + `>共青团员</option>
                                   <option value="4" ` + (politicalStatus === "积极分子" ? "selected" : "") + `>积极分子</option>
                                   <option value="5" ` + (politicalStatus === "群众" ? "selected" : "") + `>群众</option>
                                   <option value="6" ` + (isOther ? "selected" : "") + `>其他党派</option>
                                 </select>
                               </div>
                                <span  class="otherParty1" style="display: ` + isShow + `">其他党派:
                                       <div class="layui-input-inline">
                                         <input type="text" name="otherPartyName"  value="` + politicalStatus + `"
                                                placeholder="请输入党派名称"
                                                autocomplete="off" class="layui-input other_updateStudentParent_political_status"
                                                id="other_updateStudentParent_political_status">
                                       </div>
                               </span>
                           </div>
                               </span></th>
                                        <th colspan="1">职务：<span>
                               <div class="layui-input-inline" style="width: 60%">
                                   <input type="text" name="text"
                                          placeholder="请输入内容" autocomplete="off" class="layui-input updateStudentParent_duties"
                                          id="updateStudentParent_duties">
                                </div>
                           </span></th>

                                    </tr>`)

                    $("#family_member_information").append(` <button  class="layui-btn layui-btn-danger delStudentFamily" onclick="student.delStudentFamily(` + (familyList[j].id) + `)"　 style="margin-bottom: 10px;float: right;" value="` + familyList[j].id + `"><i class="layui-icon">&#xe640;</i>删除</button>`)

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
                    $(updateStudentParent_duties[i]).val(familyList[i].staff);
                    $(updateStudentParent_phone[i]).val(familyList[i].phone);


                }
                for (var i = 0; i <= familyList.length; i++) {
                    $(updateStudentParent_phone[i]).formatInput({
                        formatArr: [3, 4, 4],
                        delimiter: '-'
                    });
                }
            },
            educationalExperience: function (experienceList) {
                $("#educational_experience").html("")
                for (let i = 0; i < experienceList.length; i++) {
                    $("#educational_experience").append(`<tr style="float: left;margin-bottom: 20px">
                                        <th colspan="2"><span>
                                            <div class="layui-input-inline" style="width: 30%;float: left">
                                                <input name="date" lay-verify="date" placeholder="yyyy-mm-dd"
                                                       autocomplete="off" class="layui-input educational_experience_start"
                                                       onclick="layui.laydate({elem: this})" type="text"
                                                       id="educational_experience_start">
                                            </div>
                                            <span style="float: left;margin-top: 8px"><p class="layui-input-inline" style="align-content:center;">--至--</p></span>
                                             <div class="layui-input-inline" style="width: 30%;float: left">
                                                <input name="date" lay-verify="date" placeholder="yyyy-mm-dd"
                                                       autocomplete="off" class="layui-input educational_experience_end"
                                                       onclick="layui.laydate({elem: this})" type="text"
                                                       id="educational_experience_end">
                                            </div>
                                        </span></th>
                                        <th colspan="2"><span>
                                            <div class="layui-input-inline" style="width: 90%">
                                                <input type="text" name="text"
                                                       placeholder="请输入学校名称" autocomplete="off" class="layui-input update_schoolName" id="update_schoolName">
                                             </div>
                                        </span></th>
                                        <th colspan="2"><span>
                                            <div class="layui-input-inline" style="width: 90%">
                                                <input type="text" name="text"
                                                       placeholder="担任什么职务" autocomplete="off" class="layui-input update_duties" id="update_duties">
                                             </div>
                                        </span></th>
                                    </tr>`)
                    $("#educational_experience").append(` <button class="layui-btn  layui-btn-danger" onclick="student.delExperience(` + experienceList[i].id + `)" style="margin-bottom: 10px;float: right;"><i class="layui-icon">&#xe640;</i> 删除</button>`)

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

            },

            delStudentFamily: function (familyId) {
                layer.confirm('该操作将直接删除，无需更新！是否删除？', {icon: 3, title: '提示'}, function (index) {
                    layer.close(index);
                    let studentNo = studentInfo.no;
                    $.post(baseUrl + "/student/delStudentFamily",
                        {familyId: familyId, studentNo: studentNo},
                        function (data) {
                            console.log(data.data);
                            if (data.result) {
                                layer.msg("删除成功!");
                                student.familyFnformation(data.data);
                            }
                        })
                })
            },
            addStudentFamilyInfo: function () {
                addStudentFamilyInfoIndex = layer.open({
                    type: 1,
                    title: "添加学生家庭信息",
                    area: ["100%", "100%"],
                    content: $("#addStudentFamily")

                });

            },
            addFamilyByUpdate: function () {
                let studentNo = studentInfo.no;
                let family_relationship = $("#family_relationship").val();
                let family_name = $("#family_name").val();
                let family_work_place = $("#family_work_place").val();
                let family_staff = $("#family_staff").val();
                let family_phone_add = $("#family_phone_add").val();
                if ($("#family_political_status").find("option:selected").text() == "其他党派") {
                    var family_political_status = $("#other_family_political_status").val();
                } else {
                    var family_political_status = $("#family_political_status").find("option:selected").text();
                }
                layer.confirm('该操作将直接添加，无需更新！是否添加？', {icon: 3, title: '提示'}, function (index) {
                    let studentNo = studentInfo.no;
                    $.post(baseUrl + "/student/addFamilyByUpdate",
                        {
                            no: studentNo,
                            relationship: family_relationship,
                            name: family_name,
                            work_place: family_work_place,
                            staff: family_staff,
                            phone: family_phone_add,
                            political_status: family_political_status,
                            studentNo: studentNo
                        },
                        function (data) {
                            if (data.result) {
                                layer.msg(data.msg, {icon: 1});
                                layer.close(addStudentFamilyInfoIndex);
                                student.familyFnformation(data.data);
                            }
                        }
                    )
                })
            },
            addExperienceInfo: function () {
                layer.open({
                    type: 1,
                    title: "添加学生教育经历",
                    area: ["40%", "60%"],
                    content: $("#addExperienceInfo")
                })
            },
            delExperience: function (experienceId) {
                layer.confirm('该操作直接删除，无需更新。确定删除？', {icon: 3, title: '提示'}, function (index) {
                    layer.close(index);
                    let studentNo = studentInfo.no;
                    $.post(baseUrl + "/student/delExperience",
                        {experienceId: experienceId, studentNo: studentNo},
                        function (data) {
                            if (data.result) {
                                layer.msg("删除成功!");
                                student.educationalExperience(data.data);
                            }
                        })
                })
            },
            addExperienceByUpdate: function () {
                let startDateExperience = $("#startDateExperience").val();
                let endDateExperience = $("#endDateExperience").val();
                let placeExperience = $("#placeExperience").val();
                let staffExperience = $("#staffExperience").val();
                let studentNo = studentInfo.no;


                layer.confirm('确定添加？', {icon: 3, title: '提示'}, function (index) {
                    layer.close(index);
                    $.post(baseUrl + "/student/addExperienceByUpdate",
                        {
                            start_time: startDateExperience,
                            end_time: endDateExperience,
                            work_place: placeExperience,
                            staff: staffExperience,
                            no: studentNo
                        },
                        function (data) {
                            layer.msg(data.msg);
                        }
                    )
                })

                Closepage();
            },

            isOther: function (political) {
                if (political != "中共党员" && political != "预备党员" && political != "共青团员" && political != "积极分子" && political != "群众")
                    return true;

                return false;
            },
            showAreaInfo() {
                let stay_type = $('#update_accommodation_type input[name="accommodation_type"]:checked ').val();
                if (stay_type === '2') {
                    $("#dorms").hide();
                } else {
                    $("#dorms").show();
                }
            },

            showSAT_score() {
                let student_type = $("#updateStudentType input[name='student_type']:checked").val();
                if (student_type === "高考录取") {
                    $("#show_SAT_score").show();
                } else {
                    $("#show_SAT_score").hide();
                }
            },

            queryAreaAndFloorAndRoomByRoomIdOfUpdate: function (roomId) {
                $.post(baseUrl + "dorm/room/queryAreaAndFloorAndRoomByRoomId",
                    {
                        roomId: roomId
                    },
                    function (data) {
                        if (data.result) {
                            if (data.data.dorms != null) {
                                let dormsHtml = "";
                                dormsHtml += data.data.dorms.areaName + " # ";
                                dormsHtml += data.data.dorms.floorName + " # ";
                                dormsHtml += data.data.dorms.roomName + "宿舍";

                                $("#updateDorms").val(dormsHtml);
                            }

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

            updateStudentList: function () {

                let phone = $("#studentPhone").val();
                let qq = $("#studentQQ").val();
                let email = $("#studentEmail").val();

                var no = $("#updateStudentNo").val()
                var name = $("#updateStudentName").val();
                var is_marry = $('#isMarry input[name="isMarry"]:checked ').val()
                var height = $("#updateStudentHeight").val();
                var born = $("#updateStudentBirthday").val();
                var weight = $("#updateStudentWight").val();
                var famous_family = $("#updateStudentNationalities").val();
                var health_status = $('#health input[name="health"]:checked ').val();
                var student_type = $('#updateStudentType input[name="student_type"]:checked').val();
                var stay_type = $('#update_accommodation_type input[name="accommodation_type"]:checked ').val();
                var is_out = $('#update_isOut input[name="isOut"]:checked ').val();
                var blood = $("#updateStudentBloodType").find("option:selected").text()
                if ($("#updateStudentPoliticalOutlook").find("option:selected").text() == "其他党派") {
                    var political_status = $("#otherUpdateStudentPoliticalOutlook").val()
                } else {
                    var political_status = $("#updateStudentPoliticalOutlook").find("option:selected").text()
                }

                if ($("#updateStudent_pre_school_education").find("option:selected").text() == "其他") {
                    var pre_school_education = $("#other_updateStudent_pre_school_education").val()
                } else {
                    var pre_school_education = $("#updateStudent_pre_school_education").find("option:selected").text()
                }

                var student_classify = $("#student_classify input[name='student_classify']:checked").val()
                //籍贯
                if ($("#province9").find("option:selected").text() == "—— 省 ——" || $("#city9").find("option:selected").text() == "—— 市 ——" || $("#district9").find("option:selected").text() == "—— 区/县 ——") {
                    var idcard_address = $("#updateStudentNativePlace").val();
                } else {
                    let detailedAddresses = "";
                    detailedAddresses += $("#province9").find("option:selected").text() + "-";
                    detailedAddresses += $("#city9").find("option:selected").text() + "-";
                    detailedAddresses += $("#district9").find("option:selected").text();
                    var native_place = detailedAddresses;
                }
                //身份证住址
                if ($("#province0").find("option:selected").text() == "—— 省 ——" || $("#city0").find("option:selected").text() == "—— 市 ——" || $("#district0").find("option:selected").text() == "—— 区/县 ——") {
                    var idcard_address = $("#Identity_card_address").val();
                } else {
                    let detailedAddresses = "";
                    detailedAddresses += $("#province0").find("option:selected").text() + "-";
                    detailedAddresses += $("#city0").find("option:selected").text() + "-";
                    detailedAddresses += $("#district0").find("option:selected").text();
                    var idcard_address = detailedAddresses;
                }
                //家庭实际住址
                $("#province3").find("option:selected").text()
                $("#city3").find("option:selected").text()
                $("#district3").find("option:selected").text()
                if ($("#province3").find("option:selected").text() == "—— 省 ——" || $("#city3").find("option:selected").text() == "—— 市 ——" || $("#district3").find("option:selected").text() == "—— 区/县 ——" || $("#detailedAddress").val() == "") {
                    var actual_address = $("#detailedAddresses").val()
                } else {
                    var detailedAddresses = "";
                    detailedAddresses += $("#province3").find("option:selected").text() + "-";
                    detailedAddresses += $("#city3").find("option:selected").text() + "-";
                    detailedAddresses += $("#district3").find("option:selected").text() + "-";
                    detailedAddresses += $("#detailedAddress").val();
                    var actual_address = detailedAddresses;
                }

                if ($("#province1").find("option:selected").text() == "—— 省 ——" || $("#city1").find("option:selected").text() == "—— 市 ——" || $("#district1").find("option:selected").text() == "—— 区/县 ——") {
                    var origin_address = $("#update_name_of_the_source").val()
                } else {
                    var detailedAddresses = "";
                    detailedAddresses += $("#province1").find("option:selected").text() + "-";
                    detailedAddresses += $("#city1").find("option:selected").text() + "-";
                    detailedAddresses += $("#district1").find("option:selected").text();
                    var origin_address = detailedAddresses;
                }

                var family_zip_code = $("#updateStudentZip_code").val();
                var family_phone = $("#updateStudentHome_phone").val();
                var emergency_contact_name = $("#updateStudent_emergency_contact").val();
                var emergency_contact_method = $("#updateStudent_emergency_contact_phone").val();
                var account_in = $("#whetherToTransfer input[name='whetherToTransfer']:checked").val()
                var area_origin_name = $("#birthplaceName input[name='birthplaceName']:checked").val()

                //入学前档案所在单位
                if ($("#province2").find("option:selected").text() == "—— 省 ——" || $("#city2").find("option:selected").text() == "—— 市 ——" || $("#district2").find("option:selected").text() == "—— 区/县 ——" || $("#updateStudent_Pre_enrollment_file_unit_detailed").val() == "") {
                    var pre_school_file_where_location = $("#Pre_enrollment_file_unit").val()
                } else {
                    var detailedAddresses = "";
                    detailedAddresses += $("#province2").find("option:selected").text() + "-";
                    detailedAddresses += $("#city2").find("option:selected").text() + "-";
                    detailedAddresses += $("#district2").find("option:selected").text() + "-";
                    detailedAddresses += $("#updateStudent_Pre_enrollment_file_unit_detailed").val();
                    var pre_school_file_where_location = detailedAddresses;
                }

                var file_in = $("#is_the_file_transferred input[name='is_the_file_transferred']:checked").val();
                var pre_school_name = $("#Pre_school_name").val();

                //入学前户口所在派出所
                if ($("#province5").find("option:selected").text() == "—— 省 ——" || $("#city5").find("option:selected").text() == "—— 市 ——" || $("#district5").find("option:selected").text() == "—— 区/县 ——" || $("#Pre_school_account_where_the_police_station_detailed").val() == "") {
                    var pre_school_account_where_station = $("#Pre_enrollment_file_unit").val()
                } else {
                    var detailedAddresses = "";
                    detailedAddresses += $("#province5").find("option:selected").text() + "-";
                    detailedAddresses += $("#city5").find("option:selected").text() + "-";
                    detailedAddresses += $("#district5").find("option:selected").text() + "-";
                    detailedAddresses += $("#Pre_school_account_where_the_police_station_detailed").val();
                    var pre_school_account_where_station = detailedAddresses;
                }

                //家庭成员信息
                var updateStudentParentsName = $(".updateStudentParentsName");
                var updateStudentParent_political_status = $(".updateStudentParent_political_status");
                var other_updateStudentParent_political_status = $(".other_updateStudentParent_political_status");
                var updateStudentParent_employer = $(".updateStudentParent_employer");
                var updateStudentParent_duties = $(".updateStudentParent_duties");
                var updateStudentParent_phone = $(".updateStudentParent_phone");

                var updateStudentParentsNameList = [];
                var updateStudentParent_political_statusList = [];
                var updateStudentParent_employerList = [];
                var updateStudentParent_dutiesList = [];
                var updateStudentParent_phoneList = [];
                var updateStudentParentIds = [];

                for (let i = 0; i < familyInfo.length; i++) {
                    updateStudentParentsNameList.push($(updateStudentParentsName [i]).val())
                    if ($(updateStudentParent_political_status [i]).find("option:selected").text() == "其他党派") {
                        updateStudentParent_political_statusList.push($(other_updateStudentParent_political_status [i]).val())
                    } else {
                        updateStudentParent_political_statusList.push($(updateStudentParent_political_status [i]).find("option:selected").text())
                    }
                    updateStudentParent_employerList.push($(updateStudentParent_employer [i]).val())
                    updateStudentParent_dutiesList.push($(updateStudentParent_duties [i]).val())
                    updateStudentParent_phoneList.push($(updateStudentParent_phone [i]).val())
                    updateStudentParentIds.push(familyInfo[i].id);
                }

                var familyInfoCount = familyInfo.length;

                //教育经历
                //开始时间
                var educational_experience_start = $(".educational_experience_start");
                //结束时间
                var educational_experience_end = $(".educational_experience_end");
                //学校名称
                var update_schoolName = $(".update_schoolName");
                //职务
                var update_duties = $(".update_duties");
                var educational_experience_start_list = [];
                var educational_experience_end_list = [];
                var update_schoolName_list = [];
                var update_duties_start_list = [];
                var experienceIds = [];
                for (let i = 0; i < experienceInfo.length; i++) {
                    educational_experience_start_list.push($(educational_experience_start[i]).val())
                    educational_experience_end_list.push($(educational_experience_end[i]).val())
                    update_schoolName_list.push($(update_schoolName[i]).val())
                    update_duties_start_list.push($(update_duties[i]).val())
                    experienceIds.push(experienceInfo[i].id)
                }
                $("#educational_experience").val();

                //学业信息
                $("#updateStudentType1 input[name='student_type1']:checked").val();
                //录取专业
                var origin_profession_id = $("#studentsProfessionList").val();
                //现专业
                var profession_id = $("#studentsNowProfessional").val();
                //就业方向
                var direction_id = $("#employment_direction").val();
                //系
                var department_id = $("#student_department").val();
                //班级
                var classes_id = $("#student_class").val();
                //职业导师
                var teacher_id = $("#update_career_mentor").val()
                var community_teacher_id = $("#update_community_counselor").val()

                var student_status = $("#update_student_status").find('option:selected').text()

                var hard_type = $("#update_hard_type input[name='update_hard_type']:checked").val();

                //缴费状态
                if ($("#update_payment_status").find('option:selected').text() == "欠费") {
                    var payment_status_first_year = $("#update_payment_status").find('option:selected').text()
                    var arrears_first_year = $("#Amount_of_arrears").val()
                } else {
                    var payment_status_first_year = $("#update_payment_status").find('option:selected').text()
                    var arrears_first_year = '0'
                }

                if ($("#update_payment_status2").find('option:selected').text() == "欠费") {
                    var payment_status_second_year = $("#update_payment_status2").find('option:selected').text()
                    var arrears_second_year = $("#Amount_of_arrears2").val()
                } else {
                    var payment_status_second_year = $("#update_payment_status2").find('option:selected').text()
                    var arrears_second_year = '0'
                }

                if ($("#update_payment_status3").find('option:selected').text() == "欠费") {
                    var payment_status_third_year = $("#update_payment_status3").find('option:selected').text()
                    var arrears_third_year = $("#Amount_of_arrears3").val()
                } else {
                    var payment_status_third_year = $("#update_payment_status3").find('option:selected').text()
                    var arrears_third_year = '0'
                }

                //实践类型
                if ($("#update_practical_type").find('option:selected').text() == "其他") {
                    var practice_learning_type = $("#other_practical_type").val()
                } else {
                    var practice_learning_type = $("#update_practical_type").find('option:selected').text()
                }

                //宿舍信息
                if ($("#queryAreas").val() != "" || $("#queryFloors").val() != "" || $("#queryRooms").val() != "") {
                    var area_id = $("#queryAreas").val()
                    var floor_id = $("#queryFloors").val()
                    var room_id = $("#queryRooms").val()
                } else {
                    var area_id = studentInfo.area_id;
                    var floor_id = studentInfo.floor_id;
                    var room_id = studentInfo.room_id;
                }
                var sat_score = $("#upadte_SAT_score").val();
//                var native_place = $("#updateStudentNativePlace").val();

                //获奖或荣誉
                var own_punishment = $("#update_award_or_honor").val();


                layer.confirm('确定修改？', {icon: 3, title: '提示'}, function (index) {
                    layer.close(index);
                    $.post(baseUrl + "/student/updateStudentAjax",
                        {
                            qq: qq,
                            student_contact_method: phone,
                            email: email,
                            no: no,
                            is_marry: is_marry,
                            height: height,
                            weight: weight,
                            head_image: imgName,
                            health_status: health_status,
                            student_type: student_type,
                            born: born,
                            name: name,
                            blood: blood,
                            stay_type: stay_type,
                            famous_family: famous_family,
                            department_id: department_id,
                            native_place: native_place,
                            political_status: political_status,
                            pre_school_education: pre_school_education,
                            student_classify: student_classify,
                            idcard_address: idcard_address,
                            is_out: is_out,
                            actual_address: actual_address,
                            origin_address: origin_address,
                            family_zip_code: family_zip_code,
                            family_phone: family_phone,
                            sat_score: sat_score,
                            emergency_contact_name: emergency_contact_name,
                            emergency_contact_method: emergency_contact_method,
                            account_in: account_in,
                            area_origin_name: area_origin_name,
                            pre_school_file_where_location: pre_school_file_where_location,
                            file_in: file_in,
                            pre_school_name: pre_school_name,
                            pre_school_account_where_station: pre_school_account_where_station,
                            student_status: student_status,//学籍状态
                            hard_type: hard_type,//困难生类别
                            //缴费状态
                            payment_status_first_year: payment_status_first_year,
                            arrears_first_year: arrears_first_year,
                            payment_status_second_year: payment_status_second_year,
                            arrears_second_year: arrears_second_year,
                            payment_status_third_year: payment_status_third_year,
                            arrears_third_year: arrears_third_year,

                            practice_learning_type: practice_learning_type,
                            area_id: area_id,
                            floor_id: floor_id,
                            room_id: room_id,

                            //获奖或荣誉
                            own_punishment: own_punishment,
                            //家庭信息
                            familyInfoCount: familyInfoCount,
                            updateStudentParentsNameList: updateStudentParentsNameList,
                            updateStudentParent_political_statusList: updateStudentParent_political_statusList,
                            updateStudentParent_employerList: updateStudentParent_employerList,
                            updateStudentParent_dutiesList: updateStudentParent_dutiesList,
                            updateStudentParent_phoneList: updateStudentParent_phoneList,
                            updateStudentParentIds: updateStudentParentIds,
                            //教育经历
                            educational_experience_start_list: educational_experience_start_list,
                            educational_experience_end_list: educational_experience_end_list,
                            update_schoolName_list: update_schoolName_list,
                            update_duties_start_list: update_duties_start_list,
                            experienceIds: experienceIds,

                            // 录取专业  现专业  就业方向  班级
                            origin_profession_id: origin_profession_id,
                            profession_id: profession_id,
                            direction_id: direction_id,
                            classes_id: classes_id,

                            //教师信息
                            teacher_id: teacher_id,
                            community_teacher_id: community_teacher_id,


                        },

                        function (data) {
                            if (data.result) {
                                layer.msg(data.msg);
                            }
                        }
                    )
                })
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
            },

            updateCardAddress: function () {
                $("#updateCardAddress").show();
            },

            updateNativeAddress:function () {
                $("#updateNativeAddress").show();
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
            $("#level_search").html(`<option value="" selected>年级</option>`);
            let levels = getSearchLevels().reverse();
            levels.forEach(level => {
                $("#level_search").append(`<option value="` + level + `" >` + level + `</option>`);
            });
        }

        function Closepage() {
            if (window.opener && !window.opener.closed) {
                window.parent.opener.location.reload();
            }
            window.close();
            return false;
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

        function loadOptionsHtmlOfFamousFamilyList(data, selectId) {
            let _html = "";
            for (let i = 0; i < data.length; ++i) {
                if (selectId == data[i].para_no) {
                    _html += `<option  selected value="` + data[i].para_no + `">` + data[i].para_dispname + `</option>`;
                } else {
                    _html += `<option value="` + data[i].para_no + `">` + data[i].para_dispname + `</option>`;
                }
            }

            return _html;
        }

        function loadOptionsHtmlOfClass(data) {
            let _html = "";
            for (let i = 0; i < data.length; ++i) {
                _html += `<option value="` + data[i].id + `">` + data[i].name + `</option>`;
            }

            return _html;
        }

        function loadOptionsHtmlToTeacher(data, selectId) {
            let _html = "";
            for (let i = 0; i < data.length; ++i) {
                if (selectId == data[i].no) {
                    _html += `<option  selected value="` + data[i].no + `">` + data[i].name + `</option>`;
                } else {
                    _html += `<option value="` + data[i].no + `">` + data[i].name + `</option>`;
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

        //实时监听qq输入动态生成qq邮箱
        function monitorQQOfEmail() {
            $("#studentQQ").bind('input propertychange', function () {
                $("#studentEmail").val($(this).val() + "@qq.com");
            })
        }


        $(function () {
            student.list();
            student.showDormAndHideDorm();
            loadALlDepartments();
            loadAllDirections();
            loadAllLevels();
            loadAllClassess();
            monitorQQOfEmail();
            student.queryAreaAndFloorOfUpdate()
            queryAreaAndFloor();
            form.render();

            $("#studentPhone").formatInput({
                formatArr: [3, 4, 4],
                delimiter: '-'
            });
            $("#updateStudentHome_phone").formatInput({
                formatArr: [3, 4, 4],
                delimiter: '-'
            });
            $("#updateStudent_emergency_contact_phone").formatInput({
                formatArr: [3, 4, 4],
                delimiter: '-'
            });


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
            //监听学生家人政治面貌
            form.on('select(politicalOutlookParent)', function (data) {
                let political = $(data.elem).parents(".political").find(".otherParty1");
                console.log(data.elem);
                if (data.value === '6') {
                    $(political).show();
                } else {
                    $(political).hide();
                }

                form.render();
            });
            //监听学生家人政治面貌在进行添加时
            form.on('select(family_political_status)', function (data) {
                if (data.value === '6') {
                    $("#show_other_family_political_status").show();
                } else {
                    $("#show_other_family_political_status").hide();
                }
            });
            //监听系,从而动态获取相应的班级
            form.on('select(student_departments)', function (data) {
                let department_id = data.value;
                $.post(baseUrl + "/student/showAutoClassByDepartment", {departmentId: department_id}, function (resultData) {
                    $(".student_class").html(loadOptionsHtmlOfClass(resultData.data));
                })
            })

            //图片上传
            layui.use('upload', function () {
                layui.upload({
                    url: '${baseurl}/student/updateImage' //上传接口
                    , success: function (res) { //上传成功后的回调
                        if (res.result) {
                            $("#imagesToUpdate").text("").attr("src", HEAD_IMAGE_PREFIX + res.data);
                            imgName = res.data;
                        }
                    }
                });
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
