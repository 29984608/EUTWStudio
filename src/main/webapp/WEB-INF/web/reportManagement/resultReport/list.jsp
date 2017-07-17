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
                    <a class="layui-btn" style="width: auto ;margin-bottom: 10px;" onclick="resultReport.list()"><i
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
                $.post(baseUrl + "/resultReport/preview", {studentNo: no}, function (data) {
                    if (data.result) {
                        resultReport.loadStudentInfo(data.student);
                        resultReport.loadResults(data.results);
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
                let originAddress = student.origin_address.split(ADDRESS_SPLIT_FLAG);
                $("#name").text(student.studentName);
                $("#gender").text(student.gender);
                $("#famous_family").text(student.famous_family);
                $("#address").text(originAddress[0] + originAddress[1]);
                $("#headImg").attr({src: HEAD_IMAGE_PREFIX + student.head_image});
                $("#no").text(student.no);
                $("#political").text(student.political_status);
                $("#idcard").text(student.idcard);
                $("#profession").text(student.professionName);
                $("#direction").text(student.directionName);
                $("#in_school").text(student.in_school);
            },
            loadResults: function (results) {
                $("#left_result").html("");
                $("#right_result").html("");
                let result_style, test_time, nature, course_name, credit, score, compulsory_score = 0, elective_score = 0;


                for (let i = 0; i < results.length; ++i) {
                    let testTime = results[i].testTime.split("-");
                    result_style = results[i].is_pass == 1 ? "" : `style="color:red"`;
                    test_time = testTime[0] + testTime[1];
                    nature = results[i].nature == 0 ? "选修" : "必修";
                    course_name = results[i].courseName;
                    credit = results[i].credit;
                    score = results[i].score;
                    let _html = `
                                 <tr  ` + result_style + `>
                                    <td>` + test_time + `</td>
                                    <td>` + nature + `</td>
                                    <td>` + course_name + `</td>
                                    <td>` + credit + `</td>
                                    <td>` + score + `</td>
                                </tr>`;
                    if (i < 25) {
                        $("#left_result").append(_html);
                    } else {
                        $("#right_result").append(_html);
                    }
                    if (nature === "选修" && results[i].is_pass == 1) elective_score += credit;
                    if (nature === "必修" && results[i].is_pass == 1) compulsory_score += credit;
                }
                $("#elective_score").text(elective_score);
                $("#compulsory_score").text(compulsory_score);
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


    function exportPDF() {
        pdf(document.getElementById("container"), $("#name").text(), "a3");
//        location.reload();
    }
</script>


</html>