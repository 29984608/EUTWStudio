<%@ page contentType="text/html; charset=UTF-8" %>
<script id="list-tpl" type="text/html">
    {{# layui.each(d.students, function(index, item){ }}
    <tr>
        <td>{{ item.no}}</td>
        <td>{{ item.name}}</td>
        <td>{{ item.gender === "M" ? "男" : "女"}}</td>
        <td>
            {{# if(item.department === undefined){ }}
            未分配
            {{# }else{ }}
            {{ item.department}}
            {{#}}}
        </td>
        <td>{{ item.level}}</td>
        <td>
            {{# if(item.direction === undefined){ }}
            未分配
            {{# }else{ }}
            {{ item.direction}}
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
            <button class="layui-btn layui-btn-mini "
                    onclick="communication.add('{{item.no}}')">
                <i class="layui-icon">&#xe61f;</i>添加反馈
            </button>
            <%--<shiro:hasPermission name="communication:update">--%>
            <button class="layui-btn layui-btn-mini layui-btn-normal"
                    onclick="communication.previewOrUpdate('{{ item.name}}','{{item.no}}','update')">
                <i class="layui-icon">&#xe642;</i>修改
            </button>
            <%--</shiro:hasPermission>--%>
            <%--<shiro:hasPermission name="communication:delete">--%>
            <button class="layui-btn layui-btn-mini  "
                    onclick="communication.previewOrUpdate('{{ item.name}}','{{item.no}}','preview')">
                <i class="layui-icon">&#xe60a;</i>预览
            </button>
            <%--</shiro:hasPermission>--%>
        </td>
    </tr>
    {{# }); }}

</script>
<div id="add" style="display: none;width: auto;margin-top: 20px">
    <form class="layui-form layui-form-pane" id="add_form" style="padding: 30px">
        <input type="hidden" name="no" class="no">
        <div class="layui-form-item layui-form-pane">

            <label class="layui-form-label " style="font-size: 13px">学生学号</label>
            <div class="layui-input-inline">
                <input name="no" disabled value="" autocomplete="off"
                       class="layui-input no">
            </div>
            <label class="layui-form-label layui-form-pane" style="font-size: 13px">学生姓名</label>
            <div class="layui-input-inline">
                <input id="studentName" disabled value="" autocomplete="off"
                       class="layui-input">
            </div>

        </div>

        <div class="layui-form-item layui-form-pane">
            <label class="layui-form-label " style="font-size: 13px">沟通项目</label>
            <div class="layui-input-inline">
                <select name="modules" id="direction" lay-verify="required" lay-search="">
                    <option value="学业指导">学业指导</option>
                    <option value="质量跟踪">质量跟踪</option>
                    <option value="生活服务">生活服务</option>
                    <option value="行为养成">行为养成</option>
                </select>
            </div>

            <label class="layui-form-label " style="font-size: 13px">沟通对象</label>
            <div class="layui-input-inline">
                <input type="radio" name="name" id="student_radio" lay-filter="talk" value="student" title="学生" checked>
                <input type="radio" name="name" lay-filter="talk" value="parent" title="家长">
            </div>
        </div>

        <div class="layui-form-item layui-form-pane">
            <label class="layui-form-label " style="font-size: 13px">沟通内容：</label>
        </div>

        <div id="content">
            <div class="layui-form-item content_node">

                <label class="layui-form-label " style="font-size: 13px">Q</label>
                <textarea placeholder="请输入问题" class="layui-textarea add-contents textarea"
                          style="width: 80%;min-height: 50px;height: 70px;font-size: 12px;"></textarea>
                <label class="layui-form-label " style="font-size: 13px">A</label>
                <textarea placeholder="请输入回答" class="layui-textarea add-contents textarea"
                          style="width: 80%;min-height: 50px;height: 70px;font-size: 12px;margin-left: .9%"></textarea>
                <div class="layui-btn-group" style="margin-left: .9%">
                    <a onclick="addTalkContent()" class="layui-btn layui-btn-small"><i
                            class="layui-icon">&#xe608;</i>添加一条 Q&A</a>

                </div>
            </div>
        </div>

        <div class="layui-form-item sub" style="margin:30px 0 0 20%">
            <div class="layui-input-block">
                <a class="layui-btn" onclick="communication.addAjax()">立即提交</a>
            </div>
        </div>
    </form>
</div>

<div id="update" style="display: none;background: #fff;">
    <a class="layui-btn" onclick="printPdf()" id="printPDF" style="float: right"><i class="layui-icon">&#xe630;</i>导出 PDF</a>
    <div class="container" id="container" style="padding: 35px 15px 35px 60px;width: 750px">

        <h2 style="text-align: center;margin-left: -30px">西安欧亚学院高职学院<span id="who"></span>学生沟通反馈记录</h2>
        <div style="margin:40px 0">

            <table  class="layui-table lay-even " data-name="articleCatData">
                <thead>
                <tr >
                    <th style="font-size: 12px">姓名</th>
                    <th style="font-size: 12px">性别</th>
                    <th style="font-size: 12px">籍贯</th>
                    <th style="font-size: 12px">身份证号码</th>
                    <th style="font-size: 12px">专业</th>
                    <th style="font-size: 12px">就业方向</th>
                    <th style="font-size: 12px">政治面貌</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <th  style="font-size: 12px" id="name"></th>
                    <th  style="font-size: 12px" id="gender"></th>
                    <th  style="font-size: 12px" id="native_place"></th>
                    <th  style="font-size: 12px" id="idcard"></th>
                    <th  style="font-size: 12px" id="profession"></th>
                    <th  style="font-size: 12px" id="direction2"></th>
                    <th  style="font-size: 12px" id="political_status"></th>
                </tr>
                </tbody>
            </table>
        </div>

        <div id="timelineContainer" class="timelineContainer">

            <div class="timelineToggle"><p><a class="expandAll ">+ 全部展开</a></p></div>

            <br class="clear">
            <div id="communication_container">

            </div>


            <br class="clear">
        </div>
    </div>

</div>

<script>
    layui.use(['jquery', 'layer', 'form'], function () {
        window.jQuery = window.$ = layui.jquery;
        window.layer = layui.layer;
        form = layui.form()
    });

    const content_html = `
    <div class="layui-form-item content_node">
    <label class="layui-form-label " style="font-size: 13px">Q</label>
                    <textarea placeholder="请输入问题" class="layui-textarea add-contents"
                              style="width: 80%;min-height: 50px;height: 70px;font-size: 12px;"></textarea>
                    <label class="layui-form-label " style="font-size: 13px">A</label>
                    <textarea placeholder="请输入回答" class="layui-textarea add-contents"
                              style="width: 80%;min-height: 50px;height: 70px;font-size: 12px;margin-left: .9%"></textarea>

                    <div class="layui-btn-group" style="margin-left: .9%">
                        <a onclick="addTalkContent()" class="layui-btn layui-btn-small"><i class="layui-icon">&#xe608;</i>添加一条 Q&A</a>
                          <a onclick="deleteContent(this)" class="layui-btn layui-btn-small layui-btn-danger"><i
                                class="layui-icon">&#xe640;</i>删除本条
                            Q&A
                        </a>
                    </div>

            </div>`;


    function addTalkContent() {
        $("#content").append(content_html);
    }

    function deleteContent(t) {
        layer.confirm('确定删除？', {icon: 3, title: '提示'}, function (index) {
            layer.close(index);
            $(t).parents(".content_node").remove();
            layer.msg("删除成功");
        })
    };


    function showCommunicationContents(data, type) {
        let communication = ""
        for (let i = 0; i < data.length - 1; ++i) {
            let com = data[i];
            communication += `
            <div class="timelineMajor">
                <h2 class="timelineMajorMarker">
                <span>` + com.time + `</span></h2>
                <dl class="timelineMinor">
                    <dt id="id` + com.id + `">
                    <a id='exportPDFName'>` + com.teacherName + ` - ` + com.direction + ` - ` + com.talkName + `</a></dt>
                    <%--QA 容器--%>
                    <dd class="timelineEvent" id="id` + com.id + `EX" style="display:none;">
                `;

            communication += type === "preview" ? loadPreviewQA(com.contents) : loadEditQA(com.contents, com.id);
            communication += `</dd></dl></div>`;

        }

        $("#communication_container").html(communication);
    }
    function loadEditQA(contents, id) {
        let QA = "";
        for (let index = 0; index < contents.length; index += 2) {
            let qaId = "q" + id + "a" + index;
            QA += `
             <dl class="timelineMinor" id="` + qaId + `">
                <dt id="` + index + `"><a style="font-size: 12px;color: peru">Q&A</a></dt>
                <div class="layui-btn-group" style="margin-bottom: 10px">
                    <a onclick="communication.updateContent(` + id + `,'` + id + `')" class="layui-btn layui-btn-small"><i
                            class="layui-icon">&#xe642;</i>修改 Q&A</a>
                </div>

                <dd class="timelineEvent" id="` + index + `EX" style="display:none;">
                     <textarea style="min-height: 50px;height: 70px;font-size: 12px;width: 500px"
                               class="layui-textarea update-contents">` + contents[index] + `</textarea>
                    <textarea style="min-height: 50px;height: 70px;font-size: 12px;width: 500px"
                              class="layui-textarea update-contents">` + contents[index + 1] + `</textarea>
                    <br class="clear">
                </dd>
            </dl>
            `;
        }
        return QA;
    }

    function loadPreviewQA(contents) {
        let QA = "";
        for (let index = 0; index < contents.length; index += 2) {
            QA += `
             <dl class="timelineMinor">
                <dt id="` + index + `"><a style="font-size: 12px;color: peru">Q&A</a></dt>
                <dd class="timelineEvent" id="` + index + `EX" style="display:none;">
               <p style="font-size: 12px;"
                           class=" contents"> <a style="font-size: 12px;color: peru">Q：</a> ` + contents[index] + `</p>
                   <p style="font-size: 12px;"
                              class=" contents"> <a style="font-size: 12px;color: peru">A：</a> ` + contents[index + 1] + `</p>
                    <br class="clear">
                </dd>
            </dl>
         `;
        }
        return QA;
    }


</script>