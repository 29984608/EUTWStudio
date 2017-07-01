<%@ page contentType="text/html; charset=UTF-8" %>
<script id="list-tpl" type="text/html">
    {{# layui.each(d.data, function(index, item){ }}
    <tr>
        <th><input type="checkbox" value="{{item.no}}-{{item.name}}" class="no_checkbox" name="" lay-skin="primary"
        ></th>
        <td>{{ item.no}}</td>
        <td>{{ item.name}}</td>
        <td>{{ item.gender}}</td>
        <td>{{ item.direction}}</td>
        <td>{{ item.profession}}</td>
        <td>
            {{# if(item.classes === undefined){ }}
            未分配
            {{# }else{ }}
            {{ item.classes}}
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
            <button class="layui-btn layui-btn-mini  " onclick="communication.previewOrUpdate('{{ item.name}}','{{item.no}}','preview')">
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
                <input type="radio" name="name" lay-filter="talk" value="student" title="学生" checked>
                <input type="radio" name="name" lay-filter="talk" value="parent" title="家长">
            </div>
            <div class="layui-form-mid layui-word-aux" id="talkName"></div>
        </div>

        <div class="layui-form-item layui-form-pane">
            <label class="layui-form-label " style="font-size: 13px">沟通内容：</label>
        </div>

        <div id="content" style="margin-left: 5%">
            <div class="layui-form-item content_node">
                <label class="layui-form-label " style="font-size: 13px">Q&A</label>
                <div class="layui-input-block">
                    <textarea placeholder="请输入问题" class="layui-textarea add-contents"
                              style="width: 80%;min-height: 50px;height: 70px;font-size: 12px;"></textarea>
                    <textarea placeholder="请输入回答" class="layui-textarea add-contents"
                              style="width: 80%;min-height: 50px;height: 70px;font-size: 12px;margin-left: .9%"></textarea>
                    <div class="layui-btn-group" style="margin-left: .9%">
                        <a onclick="addTalkContent()" class="layui-btn layui-btn-small"><i
                                class="layui-icon">&#xe608;</i>添加一条 Q&A</a>

                    </div>
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

<div id="update" style="display: none">

    <div class="container">

        <h1 ><span id="who"></span>的沟通反馈记录</h1>

        <div id="timelineContainer" class="timelineContainer">

            <div class="timelineToggle"><p><a class="expandAll">+ 全部展开</a></p></div>

            <br class="clear">
            <div id="communication_container">
                <%--&lt;%&ndash;一次沟通&ndas
                h;%&gt;--%>
                <%--<div class="timelineMajor">--%>
                <%--<h2 class="timelineMajorMarker"><span>2016-6-6 12:12:12</span></h2>--%>
                <%--<dl class="timelineMinor">--%>
                <%--<dt id="19540517"><a>张老师 - 学业指导 - Acey</a></dt>--%>
                <%--&lt;%&ndash;QA 容器&ndash;%&gt;--%>
                <%--<dd class="timelineEvent" id="19540517EX" style="display:none;">--%>
                <%--&lt;%&ndash; 一次Q&A&ndash;%&gt;--%>
                <%--<dl class="timelineMinor">--%>
                <%--<dt id="1"><a style="font-size: 12px;color: peru">Q&A</a></dt>--%>
                <%--<dd class="timelineEvent" id="1EX" style="display:none;">--%>
                <%--<p style="font-size: 12px;"--%>
                <%--class=" contents">美国最高法院相传一致9-0决定在布朗诉托皮卡教育局案，打开大门，民权运动最终种族融合在美国社会的各个方面。推翻Plessy--%>
                <%--v.--%>
                <%--Ferguson（1896），法院裁定“隔离的教育设施是不平等的。</p>--%>
                <%--<p style="font-size: 12px;"--%>
                <%--class=" contents">美国最高法院相传一致9-0决定在布朗诉托皮卡教育局案，打开大门，民权运动最终种族融合在美国社会的各个方面。推翻Plessy--%>
                <%--v.--%>
                <%--Ferguson（1896），法院裁定“隔离的教育设施是不平等的。</p>--%>
                <%--<br class="clear">--%>
                <%--</dd>--%>
                <%--</dl>--%>
                <%--<dl class="timelineMinor">--%>
                <%--<dt id="2"><a style="font-size: 12px;color: peru">Q&A</a></dt>--%>
                <%--<div class="layui-btn-group" style="margin-bottom: 10px">--%>
                <%--<a onclick="addTalkContent()" class="layui-btn layui-btn-small"><i--%>
                <%--class="layui-icon">&#xe642;</i>修改 Q&A</a>--%>
                <%--<a onclick="deleteContent(this)" class="layui-btn layui-btn-small layui-btn-danger"><i--%>
                <%--class="layui-icon">&#xe640;</i>删除--%>
                <%--Q&A--%>
                <%--</a>--%>
                <%--</div>--%>

                <%--<dd class="timelineEvent " id="2EX" style="display:none;">--%>
                <%--<textarea style="min-height: 50px;height: 55px;font-size: 12px;"--%>
                <%--class="layui-textarea contents">美国最高法院相传一<br>致9-0决定在布朗诉托皮卡教育局案，打开大门，民权运动最终种族融合在美国社会的各个方面。推翻Plessy v.--%>
                <%--Ferguson（1896），法院裁定“隔离的教育设施是不平等的。</textarea>--%>
                <%--<textarea style="min-height: 50px;height: 55px;font-size: 12px;"--%>
                <%--class="layui-textarea contents">美国最高法院相传一致9-0决定在布朗诉托皮卡教育局案，打开大门，民权运动最终种族融合在美国社会的各个方面。推翻Plessy v.--%>
                <%--Ferguson（1896），法院裁定“隔离的教育设施是不平等的。</textarea>--%>
                <%--<br class="clear">--%>
                <%--</dd>--%>
                <%--</dl>--%>
                <%--</dd><!-- /.timelineEvent -->--%>
                <%--</dl><!-- /.timelineMinor -->--%>
                <%--</div><!-- /.timelineMajor -->--%>
            </div>


            <br class="clear">
        </div><!-- /#timelineContainer -->

    </div><!-- /.container -->

</div>

<script>
    layui.use(['jquery', 'layer', 'form'], function () {
        window.jQuery = window.$ = layui.jquery;
        window.layer = layui.layer;
        form = layui.form()
    });

    const content_html = `
    <div class="layui-form-item content_node">
                <label class="layui-form-label " style="font-size: 13px">Q&A</label>
                <div class="layui-input-block">
                    <textarea placeholder="请输入问题" class="layui-textarea add-contents"
                              style="width: 80%;min-height: 50px;height: 70px;font-size: 12px;"></textarea>
                    <textarea placeholder="请输入回答" class="layui-textarea add-contents"
                              style="width: 80%;min-height: 50px;height: 70px;font-size: 12px;margin-left: .9%"></textarea>
                    <div class="layui-btn-group" style="margin-left: .9%">
                        <a onclick="addTalkContent()" class="layui-btn layui-btn-small"><i class="layui-icon">&#xe608;</i>添加一条 Q&A</a>
                          <a onclick="deleteContent(this)" class="layui-btn layui-btn-small layui-btn-danger"><i
                                class="layui-icon">&#xe640;</i>删除本条
                            Q&A
                        </a>
                    </div>

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
        for (let i = 0; i < data.length; ++i) {
            let com = data[i];
            communication += `
            <div class="timelineMajor">
                <h2 class="timelineMajorMarker">
                <span>` + com.time + `</span></h2>
                <dl class="timelineMinor">
                    <dt id="id` + com.id + `">
                    <a>` + com.teacherName + ` - ` + com.direction + ` - ` + com.talkName + `</a></dt>
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
                    <a onclick="communication.updateContent(` + id + `,'` + qaId + `')" class="layui-btn layui-btn-small"><i
                            class="layui-icon">&#xe642;</i>修改 Q&A</a>
                </div>

                <dd class="timelineEvent" id="` + index + `EX" style="display:none;">
                     <textarea style="min-height: 50px;height: 70px;font-size: 12px;"
                               class="layui-textarea update-contents">` + contents[index] + `</textarea>
                    <textarea style="min-height: 50px;height: 70px;font-size: 12px;"
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
                           class=" contents">` + contents[index] + `</p>
                    <p style="font-size: 12px;"
                              class=" contents">` + contents[index + 1] + `</p>
                    <br class="clear">
                </dd>
            </dl>
         `;
        }
        return QA;
    }


</script>