<%@ page contentType="text/html; charset=UTF-8" %>


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



    function showCommunicationContents(data, type) {
        let communication = ""
        for (let i = 0; i < data.length-1; ++i) {
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

            loadPreviewQA(com.contents);
            communication += `</dd></dl></div>`;

        }

        $("#communication_container").html(communication);
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