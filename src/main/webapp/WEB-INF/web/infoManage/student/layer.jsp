<%@ page contentType="text/html; charset=UTF-8" %>

<script id="list-tpl" type="text/html">
    {{# layui.each(d.student, function(index,item){ }}
    <tr>
        <td>
            {{# if(item.no === undefined){ }}
            未分配
            {{# }else{ }}
            {{ item.no}}
            {{#}}}
        </td>

        <td>
            {{# if(item.name === undefined){ }}
            未分配
            {{# }else{ }}
            {{ item.name}}
            {{#}}}
        </td>
        <td>
            {{# if(item.gender === undefined){ }}
            未分配
            {{# }else{ }}
            {{ item.gender}}
            {{#}}}
        </td>
        <td>
            {{# if(item.department === undefined){ }}
            未分配
            {{# }else{ }}
            {{ item.department}}
            {{#}}}
        </td>
        <td>
            {{# if(item.level === undefined){ }}
            未分配
            {{# }else{ }}
            {{ item.level}}
            {{#}}}
        </td>
        <td>
            {{# if(item.stay_type === "1"){ }}
            校内
            {{# }else{ }}
            校外
            {{#}}}
        </td>
        <td>
            {{# if(item.profession === undefined){ }}
            未分配
            {{# }else{ }}
            {{ item.profession}}
            {{#}}}
        </td>
        <td>
            {{# if(item.direction === undefined){ }}
            未分配
            {{# }else{ }}
            {{ item.direction}}
            {{#}}}
        </td>

        <td>
            {{# if(item.classes === undefined){ }}
            未分配
            {{# }else{ }}
            {{ item.classes}}
            {{#}}}
        </td>

        <td>
            {{# if(item.area === undefined){ }}
            未分配
            {{# }else{ }}
            {{ item.area}}
            {{#}}}
        </td>

        <td>
            {{# if(item.floor === undefined){ }}
            未分配
            {{# }else{ }}
            {{ item.floor}}
            {{#}}}
        </td>

        <td>
            {{# if(item.room === undefined){ }}
            未分配
            {{# }else{ }}
            {{ item.room}}
            {{#}}}
        </td>

        <td>

            <%--<shiro:hasPermission name="communication:update">--%>
            <button class="layui-btn layui-btn-mini layui-btn-normal"
                    onclick="communication.previewOrUpdate('{{ item.name}}','{{item.no}}','update')">
                <i class="layui-icon">&#xe642;</i>修改
            </button>
            <%--</shiro:hasPermission>--%>
            <%--<shiro:hasPermission name="communication:delete">--%>
            <button class="layui-btn layui-btn-mini  " onclick="student.preview('{{item.no}}')">
                <i class="layui-icon">&#xe60a;</i>预览
            </button>
            <%--</shiro:hasPermission>--%>
        </td>
    </tr>
    {{# }); }}

</script>

<div id="update" style="display: none; background:#F8F8F8">
    <div class="container" id="container" style=" background: #fff">
        <h1 style="text-align: center;margin-left: -30px;margin-top: 40px; ;color:#00ab9f ">西安欧亚学院高职学院学生档案</h1>
        <div style="margin-top: 40px;">
            <div style="width: 25%; height: 100%; float: left;border-right: 1px solid #00ab9f">
                <div style="width:140px; height: 200px; margin:10px 50px;border: 2px solid #00ab9f">
                    <img  id="images" style="width: 100%" height="100%"/>
                </div>
                <div style="width:220px; height: 240px; margin:10px 30px;">
                    <table class="layui-table lay-even " data-name="articleCatData">
                        <tbody>
                        <tr>
                            <th>TEL：<span id="phone"></span></th>
                        </tr>
                        <tr>
                            <th>QQ：<span id="qq"></span></th>
                        </tr>
                        <tr>
                            <th>E-mail：<span id="email"></span></th>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <div style="width: 75%; height: 100%; float: left;padding-left: 25px">
                <h4 style="color: #00ab9f;font-weight: bold">基本信息</h4>
                <table class="layui-table lay-even " data-name="articleCatData"
                       style="border: 0px solid red">
                    <tbody >
                    <tr>
                        <th colspan="2">学号：<span id="studentNo"></span></th>
                        <th>姓名：<span id="studentName"></span></th>
                        <th>性别：<span id="studentSex"></span></th>
                        <th>民族：<span id="famous_family"></span></th>
                        <th>身份证号：<span id="idcard"></span></th>
                    </tr>
                    <tr>
                        <th colspan="3">籍贯：<span id="native_place"></span></th>
                        <th colspan="3">出生日期：<span id="born"></span></th>
                    </tr>
                    <tr>
                        <th colspan="3">政治面貌：<span id="political_status"></span></th>
                        <th colspan="3">血型：<span id="blood"></span></th>
                    </tr>
                    <tr>
                        <th colspan="2">身高：<span id="height"></span>cm</th>
                        <th>体重：<span id="weight"></span>kg</th>
                        <th colspan="2">健康状况：<span id="health_status"></span></th>
                        <th>婚否：<span id="is_marry"></span></th>
                    </tr>
                    <tr>
                        <th colspan="6">邮编编码：<span id="family_zip_code"></span></th>
                    </tr>
                    <tr>
                        <th colspan="6">家庭电话：<span id="family_phone"></span></th>
                    </tr>
                    <tbody id="family">

                    </tbody>
                    <tr>
                        <th colspan="3">紧急联系人：<span id="emergency_contact_name"></span></th>

                        <th colspan="3">联系方式：<span id="emergency_contact_method"></span></th>
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
                        <th colspan="2">学生类别：<span id="student_type"></span></th>
                        <th colspan="2">高考成绩：<span id="sat_score"></span></th>

                    </tr>
                    <tr>
                        <th>录取专业：<span id=""></span></th>
                        <th>现专业：<span id="profession"></span></th>
                        <th>就业方向：<span id="direction"></span></th>
                        <th>班级：<span id="classes"></span></th>
                    </tr>
                    <tr>
                        <th colspan="2">职业导师：<span ></span></th>
                        <th colspan="2">社区辅导员：<span></span></th>
                    </tr>
                    <tr>
                        <th colspan="2">学籍状态：<span id="student_status"></span></th>
                        <th colspan="2">实践类型：<span id="practice_learning_type"></span></th>
                    </tr>

                    <tr>
                        <th colspan="4">缴费状态：
                            第一年：(<span id="payment_status_first_year"></span>)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            第二年：(<span id="payment_status_second_year"></span>)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            第三年：(<span id="payment_status_third_year"></span>)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                        </th>

                    </tr>
                    <tr>
                        <th colspan="2">宿舍位置：<span id="area"></span>&nbsp;-&nbsp;<span id="floor"></span>&nbsp;-&nbsp;<span id="room"></span>房间</th>
                        <th colspan="2">困难类别：<span id="hard_type"></span></th>
                    </tr>
                    </tbody>
                </table>
                <h4 style="color: #00ab9f;font-weight: bold ;padding-top: 15px;">获奖或荣誉</h4>
                <table class="layui-table lay-even " data-name="articleCatData"
                       style="border: 0px solid red">
                    <tbody>
                    <tr>
                        <th id="own_punishment">
                        </th>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

