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
</head>
<style>
    #preview li {
        float: left;
        font-size: 14px;
        margin: 3% 0 1% 3%;
        font-weight: 400;
    }
</style>
<body>
<section class="larry-grid layui-form">

    <div class="larry-personal">
        <div class="layui-tab">
            <blockquote class="layui-elem-quote mylog-info-tit">
                <div class="layui-inline">
                    <div class="layui-input-inline " style="width: auto ;margin-bottom: 10px;">
                        <select lay-filter="department" id="department_search">
                            <option value="">系</option>

                        </select>
                    </div>
                    <div class="layui-input-inline" style="width: auto;margin-bottom: 10px;">
                        <select lay-filter="profession" id="level_search">
                            <option value="">年级</option>


                        </select>
                    </div>

                    <div class="layui-input-inline" style="width: auto;margin-bottom: 10px;">
                        <select lay-filter="t_direction" id="direction_search">
                            <option value="">方向</option>


                        </select>
                    </div>

                    <div class="layui-input-inline" style="width: auto;margin-bottom: 10px;">
                        <select lay-filter="profession" id="classes_search">
                            <option value="">班级</option>


                        </select>
                    </div>

                    <div class="layui-input-inline" style="width: auto ;margin-bottom: 10px;">
                        <input type="text" name="no" id="no_search" lay-verify="title" autocomplete="off"
                               placeholder="学号" value="" class="layui-input">
                    </div>
                    <div class="layui-inline">
                        <div class="layui-input-inline" style="width: auto ;margin-bottom: 10px;">
                            <input type="text" name="title" id="name_search" lay-verify="title" autocomplete="off"
                                   placeholder="姓名" class="layui-input">
                        </div>
                    </div>
                    <a class="layui-btn" style="width: auto ;margin-bottom: 10px;"
                       onclick="currentIndex=1;resultReport.list()"><i
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
<script type="text/javascript" src="${baseurl}/public/js/pdf/jspdf.debug.js"></script>
<script type="text/javascript" src="${baseurl}/public/js/pdf/renderPDF.js"></script>
<script type="text/javascript" src="${baseurl}/public/common/layui/layui.js"></script>
<script type="text/javascript" src="${baseurl}/js/searchJs.js"></script>
<script type="text/javascript">
    let resultReport;
    let totalSize = 10;
    let currentIndex = 1;
    let pageSize = 10;
    let department;
    layui.use(['jquery', 'layer', 'element', 'laypage', 'form', 'laytpl'], function () {
        window.jQuery = window.$ = layui.jquery;
        window.layer = layui.layer;
        var element = layui.element(),
            form = layui.form(),
            laytpl = layui.laytpl;

        resultReport = {
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
                            resultReport.list();
                        }
                    }
                });
            },
            list: function () {
                let data = {
                    departmentId: $("#department_search").val(),
                    level: $("#level_search").val(),
                    directionId: $("#direction_search").val(),
                    classesId: $("#classes_search").val(),
                    studentNo: $("#no_search").val(),
                    name: $("#name_search").val(),
                    currentIndex: currentIndex,
                    pageSize: pageSize
                };
                $.ajax({
                    url: baseUrl + "/resultReport/list",
                    data: data,
                    type: "post",
                    success: function (data) {
                        if (data.result) {
                            currentIndex = data.page.currentIndex;
                            totalSize = data.page.totalSize;
                            resultReport.page();
                            laytpl($("#list-tpl").text()).render(data, function (html) {
                                $("#list").html(html);
                            });
                            form.render();
                        }
                    }
                });
            },
            preview: function (no) {
                $.post(baseUrl + "/newStudentRegister/student", {no: no}, function (data) {
                    if (data.result) {
                        resultReport.loadStudentInfo(data.data);
                        form.render();
                        layer.open({
                            type: 1,
                            title: "成绩单",
                            area: ["100%", "100%"]
                            , content: $("#preview")
                        });
                    } else {
                        layer.msg(data.msg);
                    }
                });
            },
            loadDepartmentOrDirection: function (data, selectId) {
                let _html = ""
                for (let i = 0; i < data.length; ++i) {
                    if (selectId == data[i].id) {
                        _html += `<option selected value="` + data[i].id + `">` + data[i].name + `</option>`;
                    } else {
                        _html += `<option value="` + data[i].id + `">` + data[i].name + `</option>`;
                    }
                }

                return _html;
            }, loadDirectionsByDepartmentId: function (id) {
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
            loadStudentInfo: function (student) {
                resultReport.showStudentBasicInfo(student.basicStudentInfo);
                resultReport.showStudentExperienceInfo(student.experience);
                resultReport.showStudentFamilyInfo(student.family);
            },
            showStudentBasicInfo: function (student) {
                let studentClassify = student.student_classify;
                if ("本科" == studentClassify) $("#student_classify").text("☑本科 ☐专升本 ☐专科");
                if ("专升本" == studentClassify) $("#student_classify").text("☐本科 ☑专升本 ☐专科");
                if ("专科" == studentClassify) $("#student_classify").text("☐本科 ☐专升本 ☑专科");

                $(".studentName").text(student.studentName == undefined ? "" : student.studentName);
                $("#professionName").text(student.professionName == undefined ? "" : student.professionName);
                $("#classesName").text(student.classesName == undefined ? "" : student.classesName);
                $("#no").text(student.no == undefined ? "" : student.no);
                $("#in_school").text(student.in_school == undefined ? "" : student.in_school);
                $("#gender").text(student.gender == undefined ? "" : student.gender);
                $("#born").text(student.born == undefined ? "" : student.born);
                $("#famous_family").text(student.famous_family == undefined ? "" : student.famous_family);
                $("#is_marry").text(student.is_marry == undefined ? "" : student.is_marry);
                $("#head_image").attr({src: HEAD_IMAGE_PREFIX + student.head_image});
                $("#origin_address").text(student.origin_address == undefined ? "" : student.origin_address);
                $("#political_status").text(student.political_status == undefined ? "" : student.political_status);
                $("#actual_address").text(student.actual_address == undefined ? "" : student.actual_address);
                $("#family_zip_code").text(student.family_zip_code == undefined ? "" : student.family_zip_code);
                $("#family_phone").text(student.family_phone == undefined ? "" : student.family_phone);
                $("#pre_school_work").text(student.pre_school_work == undefined ? "" : student.pre_school_work);
                $("#pre_school_staff").text(student.pre_school_staff == undefined ? "" : student.pre_school_staff);
                $("#health_status").text(student.health_status == undefined ? "" : student.health_status);
                $("#idcard").text(student.idcard == undefined ? "" : student.idcard);
                $("#own_experience").text(student.own_experience == undefined ? "" : student.own_experience);
                $("#own_punishment").text(student.own_punishment == undefined ? "" : student.own_punishment);

            },
            showStudentExperienceInfo: function (experiences) {
                $(".experience_node").remove();
                experiences.forEach(experience => {
                    $("#experience").after(`
                     <tr class="experience_node">
                        <td colspan="2">` + experience.start_time + `</td>
                        <td colspan="2">` + experience.end_time + `</td>
                        <td colspan="6">` + experience.work_place + `(` + experience.staff + `)</td>
                        <td colspan="1">` + experience.witness + `</td>
                    </tr>
                    `);
                })
            },
            showStudentFamilyInfo: function (familys) {
                $(".family_node").remove();
                familys.forEach(family => {
                    $("#family").after(`
                     <tr class="family_node">
                        <td colspan="1">` + family.relationship + `</td>
                        <td colspan="1">` + family.name + `</td>
                        <td colspan="1">` + family.political_status + `</td>
                        <td colspan="1">` + family.staff + `</td>
                        <td colspan="6">` + family.work_place + `</td>
                        <td colspan="1">` + family.phone + `</td>
                    </tr>
                    `);
                })
            },
            exportRegisterReport: function () {
                location.href = baseUrl + "/newStudentRegister/exportRegisterReport?no="+$("#no").text()+"";
            }
        };
        $(function () {
            loadALlDepartments();
            loadAllDirections();
            loadAllLevels();
            loadAllClassess();
            resultReport.list();
            form.render();

            form.on('select(department)', function (data) {

                $("#department_search").html(resultReport.loadClassByDepartmentId(data.value));
                $("#direction_search").html(resultReport.loadDirectionsByDepartmentId(data.value));
            });
        });
    })

</script>


</html>
