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

<div id="update" style="display: none;margin-top: 40px;">
    <div class="container" id="container" style=" background: #fff">
        <h1 style="text-align: center;margin-left: -30px ;color:#00ab9f ">西安欧亚学院高职学院学生档案</h1>
        <div style="margin-top: 40px;">
            <div style="width: 25%; height: 130%; float: left;border-right: 1px solid #00ab9f">
                <div style="width:140px; height: 200px; margin:10px 50px;border: 2px solid #00ab9f">
                    <img src="images/user/huan.jpg" style="width: 100%" height="100%"/>
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
                        <th colspan="2">学号：<span>15610409147856</span></th>
                        <th>姓名：<span>毛良伟</span></th>
                        <th>性别：<span>男</span></th>
                        <th>民族：<span>汉族</span></th>
                        <th>身份证号：<span>610424187451235362</span></th>
                    </tr>
                    <tr>
                        <th colspan="3">籍贯：<span>陕西西安</span></th>
                        <th colspan="3">出生日期：<span>1996-03-26</span></th>
                    </tr>
                    <tr>
                        <th colspan="3">政治面貌：<span>共青团员</span></th>
                        <th colspan="3">血型：<span>O型</span></th>
                    </tr>
                    <tr>
                        <th colspan="2">身高：<span>175cm</span></th>
                        <th>体重：<span>62kg</span></th>
                        <th colspan="2">健康状况：<span>良好</span></th>
                        <th>婚否：<span>未婚</span></th>
                    </tr>
                    <tr>
                        <th colspan="6">邮编编码：<span>713366</span></th>
                    </tr>
                    <tr>
                        <th colspan="6">家庭电话：<span>029-35350123</span></th>
                    </tr>
                    <tr>
                        <th>父亲：</th>
                        <th>政治面貌：<span>共产党员</span></th>
                        <th colspan="2">工作单位：<span>陕西省西安</span></th>
                        <th>职务：<span>汉族</span></th>
                        <th>联系电话：<span>15802953456</span></th>
                    </tr>
                    <tr>
                        <th>母亲：</th>
                        <th>政治面貌：<span>共产党员</span></th>
                        <th colspan="2">工作单位：<span>陕西省西安</span></th>
                        <th>职务：<span>汉族</span></th>
                        <th>联系电话：<span>13802953456</span></th>
                    </tr>
                    <tr>
                        <th colspan="3">紧急联系人：<span>张老师</span></th>

                        <th colspan="3">联系方式：<span>13542153654</span></th>
                    </tr>
                    </tbody>
                </table>
                <h4 style="color: #00ab9f;font-weight: bold ;padding-top: 15px;">教育经历</h4>
                <table class="layui-table lay-even " data-name="articleCatData"
                       style="border: 0px solid red">
                    <tbody>
                    <tr>
                        <th><span>2001年06月30日- 2004年09月30日</span></th>
                        <th><span>西安市天鹅小学</span></th>
                        <th><span>班长</span></th>
                    </tr>
                    <tr>
                        <th><span>2004年06月30日- 2009年09月30日</span></th>
                        <th><span>西安市铁一中附小</span></th>
                        <th><span>班长</span></th>
                    </tr>
                    <tr>
                        <th><span>2009年06月30日- 2016年09月30日</span></th>
                        <th><span>西安市铁一中</span></th>
                        <th><span>班长</span></th>
                    </tr>
                    </tbody>
                </table>
                <h4 style="color: #00ab9f;font-weight: bold ;padding-top: 15px;">学业信息</h4>
                <table class="layui-table lay-even " data-name="articleCatData"
                       style="border: 0px solid red">
                    <tbody>
                    <tr>
                        <th colspan="2">学生类别：<span>普通高考</span></th>
                        <th colspan="2">高考成绩：<span>592分</span></th>

                    </tr>
                    <tr>
                        <th>录取专业：<span>通信工程</span></th>
                        <th>现专业：<span>软件工程</span></th>
                        <th>就业方向：<span>中软国际订单</span></th>
                        <th>班级：<span>软件1503班</span></th>
                    </tr>
                    <tr>
                        <th colspan="2">职业导师：<span>张老师</span></th>
                        <th colspan="2">社区辅导员：<span>孙老师</span></th>
                    </tr>
                    <tr>
                        <th colspan="2">学籍状态：<span>在读</span></th>
                        <th colspan="2">缴费状态：<span>全额已付</span></th>
                    </tr>

                    <tr>
                        <th colspan="2">实践类型：<span>未实践</span></th>
                        <th colspan="2">宿舍位置：<span>北区：626</span></th>
                    </tr>
                    <tr>
                        <th colspan="4">困难类别：<span>贫困</span></th>
                    </tr>
                    </tbody>
                </table>
                <h4 style="color: #00ab9f;font-weight: bold ;padding-top: 15px;">获奖或荣誉</h4>
                <table class="layui-table lay-even " data-name="articleCatData"
                       style="border: 0px solid red">
                    <tbody>
                    <tr>
                        <th ><div>2017年07月19日 获得陕西蓝桥杯二等奖</div>
                            <div>2017年07月19日 获得陕西蓝桥杯二等奖</div>
                        </th>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

