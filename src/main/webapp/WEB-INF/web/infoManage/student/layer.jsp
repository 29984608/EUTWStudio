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
                    onclick="student.studentUpdate('{{ item.name}}','{{item.no}}','update')">
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
                    <img id="images" style="width: 100%" height="100%"/>
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
                    <tbody>
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
                        <th colspan="2">职业导师：<span></span></th>
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

<div id="updateStudent" style="display: none; background:#F8F8F8">
    <section class="larry-grid layui-form" style="height: auto">
        <div class="larry-personal">
            <div class="layui-tab layui-form" style="height: auto">

                <div class="larry-separate"></div>
                <div id="update1">
                    <div class="container" id="container1" style=" background: #fff">
                        <h1 style="text-align: center;margin-left: 30% ;color:#00ab9f ">西安欧亚学院高职学院学生档案修改页面</h1>
                        <div style="margin-top: 40px;">
                            <div style="width: 25%; height: 100%; float: left;border-right: 1px solid #00ab9f">
                                <div style="width:140px; height: 200px; margin:10px 50px;border: 2px solid #00ab9f">
                                    <img src="images/user/user.jpg" style="width: 100%" height="100%"/>
                                </div>
                                <div style="width:220px; height: 240px; margin:10px 30px;">
                                    <table class="layui-table lay-even " data-name="articleCatData">
                                        <tbody>
                                        <tr>
                                            <th>TEL：<span>15802953175</span></th>
                                        </tr>
                                        <tr>
                                            <th>QQ：<span>821453366</span></th>
                                        </tr>
                                        <tr>
                                            <th>E-mail：<span>821453366@qq.com</span></th>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div style="width: 75%; height: 100%; float: left;padding-left: 25px">
                                <h4 style="color: #00ab9f;font-weight: bold">基本信息</h4>
                                <table class="layui-table lay-even " data-name="articleCatData"
                                       style="border: 0px solid red">
                                    <tbody>
                                    <tr>
                                        <th colspan="3">学号：<span>
                                            <div class="layui-input-inline" style="width: 70%">
                                                <input type="text" name="text" required lay-verify="required"
                                                       placeholder="请输入内容" autocomplete="off" class="layui-input"
                                                       id="updateStudentNo">
                                             </div>
                                        </span></th>
                                        <th colspan="3">姓名：<span>
                                            <div class="layui-input-inline" style="width: 60%">
                                                <input type="text" name="text" required lay-verify="required"
                                                       placeholder="请输入内容" autocomplete="off" class="layui-input"
                                                       id="updateStudentName">
                                             </div>
                                        </span></th>

                                    </tr>

                                    <tr>
                                        <th colspan="3">性别：<span>
                                            <div class="layui-inline" pane="" id="updateStudentSex">
                                                  <label class="layui-form-label" style="width: auto"></label>
                                                <div class="layui-inline">
                                                    <input name="sex" value="男" title="男" checked=""
                                                           type="radio">
                                                    <input name="sex" value="女" title="女" type="radio">
                                                </div>
                                             </div>
                                        </span></th>
                                        <th colspan="3">民族：<span>
                                            <div class="layui-input-inline" style="width: 60%">
                                                <input type="text" name="text" required lay-verify="required"
                                                       placeholder="请输入内容" autocomplete="off" class="layui-input"
                                                       id="updateStudentNationalities">
                                             </div>
                                        </span></th>
                                    </tr>

                                    <tr>
                                        <th colspan="3">身份证号：<span>
                                            <div class="layui-input-inline" style="width: 60%">
                                                <input type="text" name="text" required lay-verify="required"
                                                       placeholder="请输入内容" autocomplete="off" class="layui-input"
                                                       id="updateStudentIdCard">
                                             </div>
                                        </span></th>
                                        <th colspan="3">籍贯：<span>
                                            <div class="layui-input-inline" style="width: 60%">
                                                <input type="text" name="text" required lay-verify="required"
                                                       placeholder="请输入内容" autocomplete="off" class="layui-input"
                                                       id="updateStudentNativePlace">
                                             </div>
                                        </span></th>

                                    </tr>

                                    <tr>
                                        <th colspan="3">出生日期：
                                            <div class="layui-input-inline" style="width: 60%">
                                                <input name="date" lay-verify="date" placeholder="yyyy-mm-dd"
                                                       autocomplete="off" class="layui-input"
                                                       onclick="layui.laydate({elem: this})" type="text"
                                                       id="updateStudentBirthday">
                                            </div>
                                        </th>
                                        <th colspan="3">婚否：
                                            <div class="layui-inline" pane="" id="isMarry">
                                                <label class="layui-form-label" style="width: auto"></label>
                                                <div class="layui-inline">
                                                    <input name="isMarry" value="是" title="是" checked=""
                                                           type="radio">
                                                    <input name="isMarry" value="否" title="否" type="radio">
                                                </div>
                                            </div>
                                        </th>
                                    </tr>

                                    <tr>
                                        <th colspan="1">身高：<span>
                                            <div class="layui-input-inline" style="width: 40%">
                                                <input type="text" name="text" required lay-verify="required"
                                                       placeholder="请输入内容" autocomplete="off" class="layui-input"
                                                       id="updateStudentHeight">
                                             </div>
                                        </span>
                                            <span>cm</span>
                                        </th>
                                        <th colspan="1">体重：<span>
                                            <div class="layui-input-inline" style="width: 40%">
                                                <input type="text" name="text" required lay-verify="required"
                                                       placeholder="请输入内容" autocomplete="off" class="layui-input"
                                                       id="updateStudentWight">
                                             </div>
                                        </span>
                                            <span>kg</span>
                                        </th>
                                        <th colspan="4">健康状况：<span>
                                            <div class="layui-input-inline" style="width: 60%">
                                                <div class="layui-inline" pane="" id="health">
                                                    <label class="layui-form-label" style="width: auto"></label>
                                                    <div class="layui-inline">
                                                       <input name="health" value="良好" title="良好" checked=""
                                                              type="radio">
                                                       <input name="health" value="其他" title="其他" type="radio">
                                                    </div>
                                                </div>
                                             </div>
                                        </span></th>
                                    </tr>

                                    <tr>
                                        <th colspan="2">学生类型:<span>
                                        <div class="layui-inline" pane="" id="updateStudentType">
                                            <label class="layui-form-label" style="width: auto"></label>
                                            <div class="layui-inline">
                                               <input name="student_type" value="高考录取" title="高考录取" checked=""
                                                      type="radio">
                                               <input name="student_type" value="自助招生" title="自助招生" type="radio">
                                            </div>
                                        </div>
                                    </span></th>
                                        <th colspan="4">血型：<span>
                                        <div class="layui-input-inline"
                                             >
                                          <select name="quiz1" lay-filter="updateStudentBloodType" id="updateStudentBloodType">
                                            <option value="">请选择血型</option>
                                            <option value="1">O型</option>
                                            <option value="2">A型</option>
                                            <option value="3">B型</option>
                                            <option value="4">AB型</option>
                                            <option value="5">RH阴性</option>
                                          </select>
                                        </div>
                                    </span></th>
                                    </tr>


                                    <tr>
                                        <th colspan="6">政治面貌：
                                            <span>
                                            <div class="layui-input-inline">
                                              <select name="politicalOutlook" lay-filter="politicalOutlook"
                                                      id="updateStudentPoliticalOutlook">
                                                <option value="">请选择</option>
                                                <option value="1">中共党员</option>
                                                <option value="2">预备党员</option>
                                                <option value="3">共青团员</option>
                                                <option value="4">积极分子</option>
                                                <option value="5">群众</option>
                                                <option value="6">其他党派</option>
                                              </select>
                                            </div>
                                            <span id="otherParty" style="display: none">
                                                  <div class="layui-input-inline">
                                                    <label class="layui-form-label" style="width: auto">其他党派: </label>
                                                    <div class="layui-input-inline">
                                                      <input type="text" name="otherPartyName" required
                                                             lay-verify="required" placeholder="请输入党派名称"
                                                             autocomplete="off" class="layui-input"
                                                             id="otherUpdateStudentPoliticalOutlook">
                                                    </div>
                                                  </div>
                                            </span>
                                        </span>
                                        </th>
                                    </tr>

                                    <tr>
                                        <th colspan="6">入学前文化程度：
                                            <span>
                                            <div class="layui-input-inline">
                                              <select name="pre_school_education" lay-filter="pre_school_education"
                                                      id="updateStudent_pre_school_education">
                                                <option value="">请选择</option>
                                                <option value="1">高中</option>
                                                <option value="2">三校生</option>
                                                <option value="3">其他</option>
                                              </select>
                                            </div>
                                            <span id="pre_school_education" style="display: none">
                                                  <div class="layui-input-inline">
                                                    <label class="layui-form-label" style="width: auto">其他: </label>
                                                    <div class="layui-input-inline">
                                                      <input type="text" name="otherPartyName" required
                                                             lay-verify="required" placeholder="请输入文化程度"
                                                             autocomplete="off" class="layui-input"
                                                             id="other_updateStudent_pre_school_education">
                                                    </div>
                                                  </div>
                                            </span>
                                        </span>
                                        </th>
                                    </tr>

                                    <tr>
                                        <th colspan="2">生源类别:<span>
                                        <div class="layui-inline" pane="" id="student_classify">
                                            <label class="layui-form-label" style="width: auto"></label>
                                            <div class="layui-inline">
                                               <input name="student_classify" value="统招专科" title="统招专科"
                                                      type="radio">
                                               <input name="student_classify" value="综合评价" title="综合评价" type="radio">
                                            </div>
                                        </div>
                                    </span></th>
                                        <th colspan="4"><span>
                                        <div class="layui-input-inline">
                                            <label class="layui-form-label" style="width: auto">身份证住址: </label>
                                            <div class="layui-input-inline">
                                              <input type="text" name="idcard_address" required
                                                     lay-verify="required" placeholder="请输入身份证住址"
                                                     autocomplete="off" class="layui-input" id="Identity_card_address">
                                            </div>
                                          </div>
                                    </span></th>
                                    </tr>

                                    <tr>
                                        <th colspan="6"><span style="font-weight: bold">家庭实际住址:</span>
                                            <form class="form-inline">
                                                <div id="distpicker3">
                                                    <div class="form-group">
                                                        <label class="sr-only" for="province3">Province</label>
                                                        <select class="form-control" id="province3" lay-ignore></select>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="sr-only" for="city3">City</label>
                                                        <select class="form-control" id="city3" lay-ignore></select>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="sr-only" for="district3">District</label>
                                                        <select class="form-control" id="district3" lay-ignore></select>
                                                    </div>
                                                </div>
                                                <br><br>
                                                <div class="layui-form-item">
                                                    <label class="layui-form-label" style="width: auto">详细地址</label>
                                                    <div class="layui-input-block">
                                                        <input type="text" name="detailedAddress" required
                                                               lay-verify="required" placeholder="请输入详细地址"
                                                               autocomplete="off" class="layui-input" id="detailedAddress">
                                                    </div>
                                                </div>
                                            </form>
                                        </th>
                                    </tr>

                                    <tr>
                                        <th colspan="6"><span style="font-weight: bold">生源所在地名称：</span>
                                            <form class="form-inline">
                                                <div id="distpicker">
                                                    <div class="form-group">
                                                        <select class="form-control" id="province1" lay-ignore></select>
                                                    </div>
                                                    <div class="form-group">
                                                        <select class="form-control" id="city1" lay-ignore></select>
                                                    </div>
                                                    <div class="form-group">
                                                        <select class="form-control" id="district1" lay-ignore></select>
                                                    </div>
                                                </div>
                                            </form>
                                        </th>
                                    </tr>


                                    <tr>
                                        <th colspan="6">邮编编码：<span class="layui-input-inline">
                                            <input type="text" name="text" required lay-verify="required"
                                                   placeholder="请输入内容" autocomplete="off" class="layui-input"
                                                   id="updateStudentZip_code" >
                                        </span></th>
                                    </tr>
                                    <tr>
                                        <th colspan="6">家庭电话：<span class="layui-input-inline">

                                            <input type="text" name="text" required lay-verify="required"
                                                   placeholder="请输入内容" autocomplete="off" class="layui-input"
                                                   id="updateStudentHome_phone">
                                        </span></th>
                                    </tr>
                                    <tr>
                                        <th colspan="2">父亲：<span>
                                            <div class="layui-input-inline" style="width: 60%">
                                                <input type="text" name="text" required lay-verify="required"
                                                       placeholder="请输入内容" autocomplete="off" class="layui-input"
                                                       id="updateStudentFather">
                                             </div>
                                        </span></th>
                                        <th colspan="4">政治面貌：<span>
                                            <div class="layui-input-inline" style="width: 30%">
                                              <select name="politicalOutlook1" lay-filter="politicalOutlook1"
                                                      id="updateStudentFather_political_status">
                                                <option value="">请选择</option>
                                                <option value="1" selected="">中共党员</option>
                                                <option value="2">预备党员</option>
                                                <option value="3">共青团员</option>
                                                <option value="4">积极分子</option>
                                                <option value="5">群众</option>
                                                <option value="6">其他党派</option>
                                              </select>
                                            </div>
                                            <span id="otherParty1" style="display: none">
                                                  <div class="layui-input-inline">
                                                    <label class="layui-form-label" style="width: auto">其他党派: </label>
                                                    <div class="layui-input-inline">
                                                      <input type="text" name="otherPartyName" required
                                                             lay-verify="required" placeholder="请输入党派名称"
                                                             autocomplete="off" class="layui-input"
                                                             id="other_updateStudentFather_political_status">
                                                    </div>
                                                  </div>
                                            </span>
                                        </span></th>

                                    </tr>

                                    <tr>
                                        <th colspan="2">工作单位：<span>
                                            <div class="layui-input-inline" style="width: 60%">
                                                <input type="text" name="text" required lay-verify="required"
                                                       placeholder="请输入内容" autocomplete="off" class="layui-input"
                                                       id="updateStudentFather_employer">
                                             </div>
                                        </span></th>
                                        <th colspan="2">职务：<span>
                                            <div class="layui-input-inline" style="width: 60%">
                                                <input type="text" name="text" required lay-verify="required"
                                                       placeholder="请输入内容" autocomplete="off" class="layui-input"
                                                       id="updateStudentFather_duties">
                                             </div>
                                        </span></th>
                                        <th colspan="2">联系电话：<span>
                                            <div class="layui-input-inline" style="width: 60%">
                                                <input type="text" name="text" required lay-verify="required"
                                                       placeholder="请输入内容" autocomplete="off" class="layui-input"
                                                       id="updateStudentFather_phone">
                                             </div>
                                        </span></th>
                                    </tr>
                                    <tr>
                                        <th colspan="2">母亲：<span>
                                            <div class="layui-input-inline" style="width: 60%">
                                                <input type="text" name="text" required lay-verify="required"
                                                       placeholder="请输入内容" autocomplete="off" class="layui-input"
                                                       id="updateStudentMather">
                                             </div>
                                        </span></th>
                                        <th colspan="4">政治面貌：<span>
                                            <div class="layui-input-inline" style="width: 30%">
                                              <select name="politicalOutlook2" lay-filter="politicalOutlook2"
                                                      id="updateStudentMather_political_status">
                                                <option value="">请选择</option>
                                                <option value="1" selected="">中共党员</option>
                                                <option value="2">预备党员</option>
                                                <option value="3">共青团员</option>
                                                <option value="4">积极分子</option>
                                                <option value="5">群众</option>
                                                <option value="6">其他党派</option>
                                              </select>
                                            </div>
                                            <span id="otherParty2" style="display: none">
                                                  <div class="layui-input-inline">
                                                    <label class="layui-form-label" style="width: auto">其他党派: </label>
                                                    <div class="layui-input-inline">
                                                      <input type="text" name="otherPartyName" required
                                                             lay-verify="required" placeholder="请输入党派名称"
                                                             autocomplete="off" class="layui-input"
                                                             id="other_updateStudentMather_political_status">
                                                    </div>
                                                  </div>
                                            </span>
                                        </span></th>

                                    </tr>
                                    <tr>
                                        <th colspan="2">工作单位：
                                            <span>
                                             <div class="layui-input-inline" style="width: 60%">
                                                <input type="text" name="text" required lay-verify="required"
                                                       placeholder="请输入内容" autocomplete="off" class="layui-input"
                                                       id="updateStudentMather_employee">
                                             </div>
                                        </span>
                                        </th>
                                        <th colspan="2">职务：<span>
                                            <div class="layui-input-inline" style="width: 60%">
                                                <input type="text" name="text" required lay-verify="required"
                                                       placeholder="请输入内容" autocomplete="off" class="layui-input"
                                                       id="updateStudentMather_duties">
                                             </div>
                                        </span></th>
                                        <th colspan="2">联系电话：<span>
                                            <div class="layui-input-inline" style="width: 60%">
                                                <input type="text" name="text" required lay-verify="required"
                                                       placeholder="请输入内容" autocomplete="off" class="layui-input"
                                                       id="updateStudentMather_phone">
                                             </div>
                                        </span></th>
                                    </tr>
                                    <tr>
                                        <th colspan="3">紧急联系人：<span>
                                            <div class="layui-input-inline" style="width: 60%">
                                                <input type="text" name="text" required lay-verify="required"
                                                       placeholder="请输入内容" autocomplete="off" class="layui-input"
                                                       id="updateStudent_emergency_contact">
                                             </div>
                                        </span></th>

                                        <th colspan="3">联系方式：<span>
                                            <div class="layui-input-inline" style="width: 60%">
                                                <input type="text" name="text" required lay-verify="required"
                                                       placeholder="请输入内容" autocomplete="off" class="layui-input"
                                                       id="updateStudent_emergency_contact_phone">
                                             </div>
                                        </span></th>
                                    </tr>

                                    <tr>
                                        <th colspan="3">户口是否转入：
                                            <span>
                                        <div class="layui-inline" pane="" id="whetherToTransfer">
                                            <label class="layui-form-label" style="width: auto"></label>
                                            <div class="layui-inline">
                                               <input name="whetherToTransfer" value="是" title="是" checked=""
                                                      type="radio">
                                               <input name="whetherToTransfer" value="否" title="否" type="radio">
                                            </div>
                                        </div>
                                    </span>
                                        </th>

                                        <th colspan="3">城乡生源名称：<span>
                                        <div class="layui-inline" pane="" id="birthplaceName">
                                            <label class="layui-form-label" style="width: auto"></label>
                                            <div class="layui-inline">
                                               <input name="birthplaceName" value="城镇" title="城镇" checked=""
                                                      type="radio">
                                               <input name="birthplaceName" value="农村" title="农村" type="radio">
                                            </div>
                                        </div>
                                    </span></th>
                                    </tr>

                                    <tr>
                                        <th colspan="6"><span style="font-weight: bold">入学前档案所在单位：</span>
                                            <form class="form-inline">
                                                <div id="distpicker1">
                                                    <div class="form-group">
                                                        <label class="sr-only" for="province2">Province</label>
                                                        <select class="form-control" id="province2" lay-ignore></select>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="sr-only" for="city2">City</label>
                                                        <select class="form-control" id="city2" lay-ignore></select>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="sr-only" for="district2">District</label>
                                                        <select class="form-control" id="district2" lay-ignore></select>
                                                    </div>
                                                </div>
                                                <br><br>
                                                <div class="layui-form-item">
                                                    <label class="layui-form-label" style="width: auto">详细地址</label>
                                                    <div class="layui-input-block">
                                                        <input type="text" name="detailedAddress" required
                                                               lay-verify="required" placeholder="请输入详细地址"
                                                               autocomplete="off" class="layui-input"
                                                               id="updateStudent_Pre-enrollment_file_unit_detailed">
                                                    </div>
                                                </div>
                                            </form>
                                        </th>
                                    </tr>

                                    <tr>
                                        <th colspan="3">档案是否转入：
                                            <span>
                                        <div class="layui-inline" pane="" id="is-the-file-transferred">
                                            <label class="layui-form-label" style="width: auto"></label>
                                            <div class="layui-inline">
                                               <input name="is-the-file-transferred" value="是" title="是" checked=""
                                                      type="radio">
                                               <input name="is-the-file-transferred" value="否" title="否" type="radio">
                                            </div>
                                        </div>
                                    </span>
                                        </th>

                                        <th colspan="3">
                                        <span>
                                            <div class="layui-form-item" style="margin-bottom: 0px">
                                                <label class="layui-form-label" style="width: auto">入学前学校名称:</label>
                                                <div class="layui-input-block">
                                                    <input type="text" name="detailedAddress" required
                                                           lay-verify="required" placeholder="请输入详细地址"
                                                           autocomplete="off" class="layui-input"
                                                           style="width: 80%;margin-bottom: 1%" id="Pre-school_name">
                                                </div>
                                            </div>
                                        </span>

                                        </th>
                                    </tr>

                                    <tr>
                                        <th colspan="6"><span style="font-weight: bold">入学前户口所在派出所：</span>
                                            <form class="form-inline">
                                                <div id="distpicker5">
                                                    <div class="form-group">
                                                        <label class="sr-only" for="province5">Province</label>
                                                        <select class="form-control" id="province5" lay-ignore></select>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="sr-only" for="city5">City</label>
                                                        <select class="form-control" id="city5" lay-ignore></select>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="sr-only" for="district5">District</label>
                                                        <select class="form-control" id="district5" lay-ignore></select>
                                                    </div>
                                                </div>
                                                <br><br>
                                                <div class="layui-form-item">
                                                    <label class="layui-form-label" style="width: auto">详细地址</label>
                                                    <div class="layui-input-block">
                                                        <input type="text" name="detailedAddress" required
                                                               lay-verify="required" placeholder="请输入详细地址"
                                                               autocomplete="off" class="layui-input"
                                                               id="Pre-school_account_where_the_police_station_detailed">
                                                    </div>
                                                </div>
                                            </form>
                                        </th>
                                    </tr>

                                    </tbody>
                                </table>
                                <h4 style="color: #00ab9f;font-weight: bold ;padding-top: 15px;">教育经历</h4>
                                <table class="layui-table lay-even " data-name="articleCatData"
                                       style="border: 0px solid red" id="updateStudent_Educational_experience">
                                    <tbody>
                                    <tr>
                                        <th><span>
                                            <div class="layui-input-inline" style="width: 90%">
                                                <input type="text" name="text" required lay-verify="required"
                                                       placeholder="请输入内容" autocomplete="off" class="layui-input">
                                             </div>
                                        </span></th>
                                        <th><span>
                                            <div class="layui-input-inline" style="width: 90%">
                                                <input type="text" name="text" required lay-verify="required"
                                                       placeholder="请输入内容" autocomplete="off" class="layui-input">
                                             </div>
                                        </span></th>
                                        <th><span>
                                            <div class="layui-input-inline" style="width: 90%">
                                                <input type="text" name="text" required lay-verify="required"
                                                       placeholder="请输入内容" autocomplete="off" class="layui-input">
                                             </div>
                                        </span></th>
                                    </tr>
                                    <tr>
                                        <th><span>
                                            <div class="layui-input-inline" style="width: 90%">
                                                <input type="text" name="text" required lay-verify="required"
                                                       placeholder="请输入内容" autocomplete="off" class="layui-input">
                                             </div>
                                        </span></th>
                                        <th><span>
                                            <div class="layui-input-inline" style="width: 90%">
                                                <input type="text" name="text" required lay-verify="required"
                                                       placeholder="请输入内容" autocomplete="off" class="layui-input">
                                             </div>
                                        </span></th>
                                        <th><span>
                                            <div class="layui-input-inline" style="width: 90%">
                                                <input type="text" name="text" required lay-verify="required"
                                                       placeholder="请输入内容" autocomplete="off" class="layui-input">
                                             </div>
                                        </span></th>
                                    </tr>
                                    <tr>
                                        <th><span>
                                            <div class="layui-input-inline" style="width: 90%">
                                                <input type="text" name="text" required lay-verify="required"
                                                       placeholder="请输入内容" autocomplete="off" class="layui-input">
                                             </div>
                                        </span></th>
                                        <th><span>
                                            <div class="layui-input-inline" style="width: 90%">
                                                <input type="text" name="text" required lay-verify="required"
                                                       placeholder="请输入内容" autocomplete="off" class="layui-input">
                                             </div>
                                        </span></th>
                                        <th><span>
                                            <div class="layui-input-inline" style="width: 90%">
                                                <input type="text" name="text" required lay-verify="required"
                                                       placeholder="请输入内容" autocomplete="off" class="layui-input">
                                             </div>
                                        </span></th>
                                    </tr>
                                    </tbody>
                                </table>
                                <h4 style="color: #00ab9f;font-weight: bold ;padding-top: 15px;">学业信息</h4>
                                <table class="layui-table lay-even " data-name="articleCatData"
                                       style="border: 0px solid red" id="updateStudent_Academic information">
                                    <tbody>
                                    <tr>
                                        <th colspan="2">学生类别：<span>
                                            <div class="layui-input-inline" style="width: 60%">
                                                <input type="text" name="text" required lay-verify="required"
                                                       placeholder="请输入内容" autocomplete="off" class="layui-input">
                                             </div>
                                        </span></th>
                                        <th colspan="2">高考成绩：<span>
                                            <div class="layui-input-inline" style="width: 60%">
                                                <input type="text" name="text" required lay-verify="required"
                                                       placeholder="请输入内容" autocomplete="off" class="layui-input">
                                             </div>
                                        </span></th>

                                    </tr>
                                    <tr>
                                        <th>录取专业：<span>
                                            <div class="layui-input-inline" style="width: 55%">
                                                <input type="text" name="text" required lay-verify="required"
                                                       placeholder="请输入内容" autocomplete="off" class="layui-input">
                                             </div>
                                        </span></th>
                                        <th>现专业：<span>
                                            <div class="layui-input-inline" style="width: 55%">
                                                <input type="text" name="text" required lay-verify="required"
                                                       placeholder="请输入内容" autocomplete="off" class="layui-input">
                                             </div>
                                        </span></th>
                                        <th>就业方向：<span>
                                            <div class="layui-input-inline" style="width: 55%">
                                                <input type="text" name="text" required lay-verify="required"
                                                       placeholder="请输入内容" autocomplete="off" class="layui-input">
                                             </div>
                                        </span></th>
                                        <th>班级：<span>
                                            <div class="layui-input-inline" style="width: 60%">
                                                <input type="text" name="text" required lay-verify="required"
                                                       placeholder="请输入内容" autocomplete="off" class="layui-input">
                                             </div>
                                        </span></th>
                                    </tr>
                                    <tr>
                                        <th colspan="2">职业导师：<span>
                                            <div class="layui-input-inline" style="width: 60%">
                                                <input type="text" name="text" required lay-verify="required"
                                                       placeholder="请输入内容" autocomplete="off" class="layui-input">
                                             </div>
                                        </span></th>
                                        <th colspan="2">社区辅导员：<span>
                                            <div class="layui-input-inline" style="width: 60%">
                                                <input type="text" name="text" required lay-verify="required"
                                                       placeholder="请输入内容" autocomplete="off" class="layui-input">
                                             </div>
                                        </span></th>
                                    </tr>
                                    <tr>
                                        <th colspan="2">学籍状态：<span>
                                            <div class="layui-input-inline" style="width: 60%">
                                                <input type="text" name="text" required lay-verify="required"
                                                       placeholder="请输入内容" autocomplete="off" class="layui-input">
                                             </div>
                                        </span></th>
                                        <th colspan="2">缴费状态：<span>
                                            <div class="layui-input-inline" style="width: 60%">
                                                <input type="text" name="text" required lay-verify="required"
                                                       placeholder="请输入内容" autocomplete="off" class="layui-input">
                                             </div>
                                        </span></th>
                                    </tr>

                                    <tr>
                                        <th colspan="2">实践类型：<span>
                                            <div class="layui-input-inline" style="width: 60%">
                                                <input type="text" name="text" required lay-verify="required"
                                                       placeholder="请输入内容" autocomplete="off" class="layui-input">
                                             </div>
                                        </span></th>
                                        <th colspan="2">宿舍位置：<span>
                                            <div class="layui-input-inline" style="width: 60%">
                                                <input type="text" name="text" required lay-verify="required"
                                                       placeholder="请输入内容" autocomplete="off" class="layui-input">
                                             </div>
                                        </span></th>
                                    </tr>
                                    <tr>
                                        <th colspan="4">困难类别：<span>
                                            <div class="layui-input-inline" style="width: 60%">
                                                <input type="text" name="text" required lay-verify="required"
                                                       placeholder="请输入内容" autocomplete="off" class="layui-input">
                                             </div>
                                        </span></th>
                                    </tr>
                                    </tbody>
                                </table>
                                <h4 style="color: #00ab9f;font-weight: bold ;padding-top: 15px;">获奖或荣誉</h4>
                                <table class="layui-table lay-even " data-name="articleCatData"
                                       style="border: 0px solid red" id="updateStudent_Award_or_honor">
                                    <tbody>
                                    <tr>
                                        <th>
                                            <div>
                                                <div class="layui-input-inline" style="width: 98%">
                                                    <input type="text" name="text" required lay-verify="required"
                                                           placeholder="请输入内容" autocomplete="off" class="layui-input">
                                                </div>
                                            </div>
                                            <br>
                                            <div>
                                                <div class="layui-input-inline" style="width: 98%">
                                                    <input type="text" name="text" required lay-verify="required"
                                                           placeholder="请输入内容" autocomplete="off" class="layui-input">
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
            </div>
        </div>
    </section>
</div>
<%--省市区联动--%>
<script src="${baseurl}/js/city/distpicker.js"></script>
<script src="${baseurl}/js/city/main.js"></script>
<script src="${baseurl}/js/city/distpicker.data.js"></script>
<script type="text/javascript">
    $("#distpicker").distpicker({
        autoSelect: false
    });
    $("#distpicker1").distpicker({
        autoSelect: false
    });
    $("#distpicker3").distpicker({
        autoSelect: false
    });

</script>