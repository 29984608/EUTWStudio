<%@ page contentType="text/html; charset=UTF-8" %>

<style>
    #dataView span {
        width: 150px;
        border: 1px solid #c7c7c7;
    }
    .layui-form-checkbox{
        margin-bottom: 10px;
    }
</style>

<div class="layui-form" id="dataView" style="display: none;margin-left: 100px">
    <form class="layui-form">
        <br>
        <h3>基本信息</h3>
        <div id="baseInfo">
            <input type="checkbox" value="no" name="no" title="学号">
            <input type="checkbox" value="name" name="name" title="姓名">
            <input type="checkbox" value="gender" name="gender" title="性别">
            <input type="checkbox" value="famousFamily" name="famousFamily" title="名族">
            <input type="checkbox" value="idcard" name="idcard" title="身份证号">
            <input type="checkbox" value="born" name="born" title="出生日期">
            <input type="checkbox" value="pre_school_education" name="pre_school_education" title="入学前文化程度">
            <input type="checkbox" value="is_marry" name="is_marry" title="婚否">
            <input type="checkbox" value="student_classify" name="student_classify" title="生源类别">
            <input type="checkbox" value="family_zip_code" name="family_zip_code" title="邮政编码">
            <input type="checkbox" value="account_in" name="account_in" title="户口是否转入">
            <input type="checkbox" value="area_origin_name" name="area_origin_name" title="城乡生源名称">
            <input type="checkbox" value="file_in" name="file_in" title="档案是否转入">
            <input type="checkbox" value="pre_school_name" name="pre_school_name" title="入学前学校名称或工作单位">
            <input type="checkbox" value="emergency_contact_name" name="emergency_contact_name" title="紧急联系人">
            <input type="checkbox" value="emergency_contact_method" name="emergency_contact_method" title="联系方式">
            <input type="checkbox" value="partyOrGroupOrganizationText" name="partyOrGroupOrganizationText"
                   title="入学前党派或团体组织">
            <input type="checkbox" value="Pre_admissionOrRewardText" name="Pre_admissionOrRewardText"
                   title="入学前受过何奖励或处分">
            <input type="checkbox" value="native_place" name="native_place" title="籍贯">
            <input type="checkbox" value="origin_address" name="origin_address" title="生源地所在名称">
            <input type="checkbox" value="pre_school_file_where_location" name="pre_school_file_where_location"
                   title="入学前档案所在单位">
            <input type="checkbox" value="pre_school_account_where_station" name="pre_school_account_where_station"
                   title="入学前户口所在派出所">
            <input type="checkbox" value="idcard_address" name="idcard_address" title="身份证地址">
            <input type="checkbox" value="actual_address" name="actual_address" title="家庭实际住址">
            <div onclick="dataOutput.selectAll(this)" style="float: right;">
                <input type="checkbox" value="全选" name="baseInfo" title="全选">
            </div>
        </div>
        <h3>学业状态</h3>
        <div id="academicStatus">
            <input type="checkbox" value="teacherId" name="teacherId" title="职业导师">
            <input type="checkbox" value="student_status" name="student_status" title="学籍状态">
            <input type="checkbox" value="student_type" name="student_type" title="学生类型">
            <input type="checkbox" value="sat_score" name="sat_score" title="高考成绩">
            <input type="checkbox" value="profession_id" name="profession_id" title="录取专业">
            <input type="checkbox" value="department_id" name="department_id" title="系">
            <input type="checkbox" value="origin_profession_id" name="origin_profession_id" title="现专业">
            <input type="checkbox" value="direction_id" name="direction_id" title="就业方向">
            <input type="checkbox" value="classes_id" name="classes_id" title="班级">
            <input type="checkbox" value="group" name="group" title="组别">
            <input type="checkbox" value="payment_status_first_year" name="payment_status_first_year" title="第一年缴费状态">
            <input type="checkbox" value="payment_status_second_year" name="payment_status_second_year" title="第二年缴费状态">
            <input type="checkbox" value="payment_status_third_year" name="payment_status_third_year" title="第三年缴费状态">
            <input type="checkbox" value="payment_status_forth_year" name="payment_status_forth_year" title="第四年缴费状态">
            <input type="checkbox" value="payment_status_fifth_year" name="payment_status_fifth_year" title="第五年缴费状态">
            <input type="checkbox" value="payment_status_sixth_year" name="payment_status_sixth_year" title="第六年缴费状态">
            <input type="checkbox" value="practice_learning_type" name="practice_learning_type" title="实践类型">
            <input type="checkbox" value="practice_learning_type" name="practice_learning_type" title="单位或项目">
            <input type="checkbox" value="units_or_projects_practical_type_contact" name="units_or_projects_practical_type_contact" title="联系人">
            <input type="checkbox" value="units_or_projects_practical_type_contact_phone" name="units_or_projects_practical_type_contact_phone" title="联系人电话">
            <div onclick="dataOutput.selectAll(this)" style="float: right;">
                <input type="checkbox" value="全选" name="baseInfo" title="全选">
            </div>
        </div>

        <h3>社区管理</h3>
        <div id="communityManagement">
            <input type="checkbox" value="community_teacher_id" name="community_teacher_id" title="社区辅导员">
            <input type="checkbox" value="political_status" name="political_status" title="政治面貌">
            <input type="checkbox" value="height" name="height" title="身高">
            <input type="checkbox" value="weight" name="weight" title="体重">
            <input type="checkbox" value="blood" name="blood" title="血型">
            <input type="checkbox" value="health_status" name="health_status" title="健康状况">
            <input type="checkbox" value="religionText" name="religionText" title="宗教信仰">
            <input type="checkbox" value="is_out" name="is_out" title="华侨、港澳台">
            <input type="checkbox" value="first_time_medical_insurance" name="first_time_medical_insurance" title="第一年医保时间">
            <input type="checkbox" value="first_medical_insurance" name="first_medical_insurance" title="第一年医保">
            <input type="checkbox" value="second_time_medical_insurance" name="second_time_medical_insurance" title="第二年医保时间">
            <input type="checkbox" value="second_medical_insurance" name="second_medical_insurance" title="第二年医保">
            <input type="checkbox" value="third_time_medical_insurance" name="third_time_medical_insurance" title="第三年医保时间">
            <input type="checkbox" value="third_medical_insurance" name="third_medical_insurance" title="第三年医保">
            <input type="checkbox" value="stay_type" name="stay_type" title="住宿类型">
            <input type="checkbox" value="write" name="write" title="宿舍信息">
            <input type="checkbox" value="off_school_stay_address" name="off_school_stay_address" title="校外住址信息">
            <input type="checkbox" value="updateOffCampusContactName" name="updateOffCampusContactName" title="联系人">
            <input type="checkbox" value="updateOffCampusContactPhone" name="updateOffCampusContactPhone" title="联系电话">
            <div onclick="dataOutput.selectAll(this)" style="float: right;">
                <input type="checkbox" value="全选" name="baseInfo" title="全选">
            </div>
        </div>

        <h3>其它信息</h3>
        <div id="other">
            <input type="checkbox" name="like[write]" title="家庭成员">
            <input type="checkbox" name="like[write]" title="教育经历">
            <input type="checkbox" name="like[write]" title="荣誉或获奖">
            <input type="checkbox" name="like[write]" title="违纪或处分">
            <input type="checkbox" name="like[write]" title="团学活动">
            <input type="checkbox" name="like[write]" title="奖学金或助学金">
            <div onclick="dataOutput.selectAll(this)" style="float: right;">
                <input type="checkbox" value="全选" name="baseInfo" title="全选">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block" style="margin-left: 0">
                <a class="layui-btn layui-btn-primary" onclick="dataOutput.submitData(searchData)">导出Excel</a>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
</div>

<script>
    let searchData;
    let studentDate;
    layui.use(['jquery', 'layer', 'element', 'laypage', 'form', 'laytpl', 'tree'], function () {
        window.jQuery = window.$ = layui.jquery;
        window.layer = layui.layer;
        let element = layui.element(),
            form = layui.form(),
            laytpl = layui.laytpl;

        dataOutput = {
            showDataOutput: function (data) {
                searchData = data;
                layer.open({
                    type: 1,
                    title: "数据导出",
                    area: ["100%", "100%"],
                    content: $("#dataView")
                })
            },

            submitData: function (searchData) {
                let no = $("input[name='no']:checked").val();
                let name = $("input[name='name']:checked").val();
                let gender = $("input[name='gender']:checked").val();
                let famousFamily = $("input[name='famousFamily']:checked").val();
                let idcard = $("input[name='idcard']:checked").val();
                let born = $("input[name='born']:checked").val();
                let pre_school_education = $("input[name='pre_school_education']:checked").val();
                let is_marry = $("input[name='is_marry']:checked").val();
                let student_classify = $("input[name='student_classify']:checked").val();
                let family_zip_code = $("input[name='family_zip_code']:checked").val();
                let account_in = $("input[name='account_in']:checked").val();
                let area_origin_name = $("input[name='area_origin_name']:checked").val();
                let file_in = $("input[name='file_in']:checked").val();
                let pre_school_name = $("input[name='pre_school_name']:checked").val();
                let emergency_contact_name = $("input[name='emergency_contact_name']:checked").val();
                let emergency_contact_method = $("input[name='emergency_contact_method']:checked").val();
                let partyOrGroupOrganizationText = $("input[name='partyOrGroupOrganizationText']:checked").val();
                let Pre_admissionOrRewardText = $("input[name='Pre_admissionOrRewardText']:checked").val();
                let native_place = $("input[name='native_place']:checked").val();
                let origin_address = $("input[name='origin_address']:checked").val();
                let pre_school_file_where_location = $("input[name='pre_school_file_where_location']:checked").val();
                let pre_school_account_where_station = $("input[name='pre_school_account_where_station']:checked").val();
                let idcard_address = $("input[name='idcard_address']:checked").val();
                let actual_address = $("input[name='actual_address']:checked").val();
                let teacherId = $("input[name='teacherId']:checked").val();
                let student_status = $("input[name='student_status']:checked").val();
                let student_type = $("input[name='student_type']:checked").val();
                let sat_score = $("input[name='sat_score']:checked").val();
                let profession_id = $("input[name='profession_id']:checked").val();
                let department_id = $("input[name='department_id']:checked").val();
                let origin_profession_id = $("input[name='origin_profession_id']:checked").val();
                let direction_id = $("input[name='direction_id']:checked").val();
                let classes_id = $("input[name='classes_id']:checked").val();
                let group = $("input[name='group']:checked").val();
                let payment_status_first_year = $("input[name='payment_status_first_year']:checked").val();
                let payment_status_second_year = $("input[name='payment_status_second_year']:checked").val();
                let payment_status_third_year = $("input[name='payment_status_third_year']:checked").val();
                let payment_status_forth_year = $("input[name='payment_status_forth_year']:checked").val();
                let payment_status_fifth_year = $("input[name='payment_status_fifth_year']:checked").val();
                let payment_status_sixth_year = $("input[name='payment_status_sixth_year']:checked").val();
                let practice_learning_type = $("input[name='practice_learning_type']:checked").val();
                let units_or_projects_practical_type_contact = $("input[name='units_or_projects_practical_type_contact']:checked").val();
                let units_or_projects_practical_type_contact_phone = $("input[name='units_or_projects_practical_type_contact_phone']:checked").val();
                let community_teacher_id = $("input[name='community_teacher_id']").val();
                let political_status = $("input[name='political_status']").val();
                let height = $("input[name='height']").val();
                let weight = $("input[name='weight']").val();
                let blood = $("input[name='blood']").val();
                let health_status = $("input[name='health_status']").val();
                let religionText = $("input[name='religionText']").val();
                let is_out = $("input[name='is_out']").val();
                let first_time_medical_insurance = $("input[name='first_time_medical_insurance']").val();
                let first_medical_insurance = $("input[name='first_medical_insurance']").val();
                let second_time_medical_insurance = $("input[name='second_time_medical_insurance']").val();
                let second_medical_insurance = $("input[name='second_medical_insurance']").val();
                let third_time_medical_insurance = $("input[name='third_time_medical_insurance']").val();
                let third_medical_insurance = $("input[name='third_medical_insurance']").val();
                let stay_type = $("input[name='stay_type']").val();
                let write = $("input[name='write']").val();
                let off_school_stay_address = $("input[name='off_school_stay_address']").val();
                let updateOffCampusContactName = $("input[name='updateOffCampusContactName']").val();
                let updateOffCampusContactPhone = $("input[name='updateOffCampusContactPhone']").val();
                studentDate = {
                    no: no,
                    name: name,
                    gender: gender,
                    famousFamily: famousFamily,
                    idcard: idcard,
                    born: born,
                    pre_school_education: pre_school_education,
                    is_marry: is_marry,
                    student_classify: student_classify,
                    family_zip_code: family_zip_code,
                    account_in: account_in,
                    area_origin_name: area_origin_name,
                    file_in: file_in,
                    pre_school_name: pre_school_name,
                    emergency_contact_name: emergency_contact_name,
                    emergency_contact_method: emergency_contact_method,
                    partyOrGroupOrganizationText: partyOrGroupOrganizationText,
                    Pre_admissionOrRewardText: Pre_admissionOrRewardText,
                    native_place: native_place,
                    origin_address: origin_address,
                    pre_school_file_where_location: pre_school_file_where_location,
                    pre_school_account_where_station: pre_school_account_where_station,
                    idcard_address: idcard_address,
                    actual_address: actual_address,
                    teacherId:teacherId,
                    student_status:student_status,
                    student_type:student_type,
                    sat_score:sat_score,
                    profession_id:profession_id,
                    department_id:department_id,
                    origin_profession_id:origin_profession_id,
                    direction_id:direction_id,
                    classes_id:classes_id,
                    group:group,
                    payment_status_first_year:payment_status_first_year,
                    payment_status_second_year:payment_status_second_year,
                    payment_status_third_year:payment_status_third_year,
                    payment_status_forth_year:payment_status_forth_year,
                    payment_status_fifth_year:payment_status_fifth_year,
                    payment_status_sixth_year:payment_status_sixth_year,
                    practice_learning_type:practice_learning_type,
                    units_or_projects_practical_type_contact:units_or_projects_practical_type_contact,
                    units_or_projects_practical_type_contact_phone:units_or_projects_practical_type_contact_phone,
                    community_teacher_id:community_teacher_id,
                    political_status:political_status,
                    height:height,
                    weight:weight,
                    blood:blood,
                    health_status:health_status,
                    religionText:religionText,
                    is_out:is_out,
                    first_time_medical_insurance:first_time_medical_insurance,
                    first_medical_insurance:first_medical_insurance,
                    second_time_medical_insurance:second_time_medical_insurance,
                    second_medical_insurance:second_medical_insurance,
                    third_time_medical_insurance:third_time_medical_insurance,
                    third_medical_insurance:third_medical_insurance,
                    stay_type:stay_type,
                    write:write,
                    off_school_stay_address:off_school_stay_address,
                    updateOffCampusContactName:updateOffCampusContactName,
                    updateOffCampusContactPhone:updateOffCampusContactPhone,
                }
                let data = Object.assign(studentDate,searchData);
                $.ajax({
                    url:baseUrl + "/dataOutput/list",
                    type:"post",
                    data:data,
                    success:function (data) {
                        alert(222)
                    }
                })
            },
            //信息全部选中
            selectAll: function (data) {
                if ($(data).find("input[name='baseInfo']:checked").val() !== undefined){
                    $(data).parent().find("input[type='checkbox']").prop("checked",true);
                }else {
                    $(data).parent().find("input[type='checkbox']").prop("checked",false);
                }
                form.render();
            },
        }
    })
</script>

