<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../../public/tag.jsp" %>
<html>
<head>
    <title>教师沟通反馈页面</title>
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
<section class="larry-grid">
    <div class="larry-personal">
        <div class="layui-tab">
            <form class="layui-form" action="">
                <blockquote class="layui-elem-quote mylog-info-tit">

                    <div class="layui-inline">
                        <div class="layui-input-inline" style="width: auto">
                            <select name="modules" lay-verify="required" lay-search="">
                                <option value="">专业</option>
                                <option value="1">layer</option>
                                <option value="2">form</option>
                                <option value="3">layim</option>
                                <option value="4">element</option>
                                <option value="5">laytpl</option>
                                <option value="6">upload</option>
                            </select>
                        </div>


                        <div class="layui-input-inline">
                            <select name="modules" lay-verify="required" lay-search="">
                                <option value="">年级</option>
                                <option value="1">layer</option>
                                <option value="2">form</option>
                                <option value="3">layim</option>
                                <option value="4">element</option>
                            </select>
                        </div>

                        <div class="layui-input-inline">
                            <select name="modules" lay-verify="required" lay-search="">
                                <option value="">班级</option>
                                <option value="1">layer</option>
                                <option value="2">form</option>
                                <option value="3">layim</option>
                                <option value="4">element</option>
                                <option value="5">laytpl</option>
                            </select>
                        </div>

                        <div class="layui-input-inline">
                            <div class="layui-input-inline" style="width: 200px">
                                <input name="password" lay-verify="pass" placeholder="请输入学生姓名" autocomplete="off"
                                       class="layui-input" type="text">
                            </div>
                        </div>
                        <button class="layui-btn"><i class="layui-icon">&#xe615;</i>查找</button>
                    </div>

                </blockquote>
                <div class="larry-separate"></div>
                <div class="layui-tab-content larry-personal-body clearfix mylog-info-box">
                    <a class="layui-btn"><i class="layui-icon">&#xe60a;</i>打印</a>
                    <div class="layui-form">
                        <table class="layui-table">
                            <thead>
                            <tr>
                                <th><input type="checkbox" name="" lay-skin="primary" lay-filter="allChoose">
                                </th>
                                <th>学号</th>
                                <th>姓名</th>
                                <th>沟通时间</th>
                                <th>沟通导师</th>
                                <th>沟通对象</th>
                                <th>沟通方向</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td><input type="checkbox" name="" lay-skin="primary"></td>
                                <td>15610903150627</td>
                                <td>张三</td>
                                <td>1989-10-14</td>
                                <td>张三</td>
                                <td>李四</td>
                                <td>

                                </td>
                                <td>
                                    <a class="layui-btn layui-btn-small"  onclick="addCommunication()"><i class="layui-icon">&#xe608;</i>添加</a>

                                    <a class="layui-btn layui-btn-normal layui-btn-small" onclick="upCommunication()"><i class="layui-icon">&#xe642;</i>编辑</a>

                                    <%--<a class="layui-btn layui-btn-small layui-btn-normal" onclick="seeCommunication()"><i class="layui-icon">&#xe60a;</i>预览--%>
                                        <a class="layui-btn  layui-btn-small" onclick="seeCommunication()"><i class="layui-icon">&#xe60a;</i>预览</a>
                                    </a>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div id="demo7"></div>
                </div>
            </form>
        </div>
    </div>
</section>

<div id="addInfo" style="display: none;width: auto;margin-top: 20px">
    <form class="layui-form" action="">
        <div class="layui-form-item">
            <label class="layui-form-label" style="font-size: 16px">学生学号</label>
            <div class="layui-input-inline">
                <input name="password" required lay-verify="required" placeholder="请输入密码" autocomplete="off"
                       class="layui-input">
            </div>
        </div>


        <div class="layui-form-item">
            <label class="layui-form-label" style="font-size: 16px">学生姓名</label>
            <div class="layui-input-inline">
                <input name="password" required lay-verify="required" placeholder="请输入密码" autocomplete="off"
                       class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label" style="font-size: 16px">沟通时间</label>
            <div class="layui-input-inline">
                <input name="date" id="date" lay-verify="date" placeholder="yyyy-mm-dd" autocomplete="off"
                       class="layui-input" onclick="layui.laydate({elem: this})" type="text">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label" style="font-size: 16px">沟通项目</label>
            <div class="layui-input-inline">
                <select name="modules" lay-verify="required" lay-search="">
                    <option value="">专业</option>
                    <option value="1">layer</option>
                    <option value="2">form</option>
                    <option value="3">layim</option>
                    <option value="4">element</option>
                    <option value="5">laytpl</option>
                </select>
            </div>
        </div>


        <div class="layui-form-item" >
            <label class="layui-form-label" style="font-size: 16px;">沟通内容</label>
            <div class="layui-input-block" >
                <textarea placeholder="请录入相关沟通内容" class="layui-textarea" style="font-size: 16px;margin-left: -40px"></textarea>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
</div>

<div id="seeInfo" style="display: none">

    <div class="container">

        <h1>时间轴</h1>
        <%--<p class="lead">张三的沟通反馈记录</p>--%>

        <h2>张三的沟通反馈记录</h2>


        <div id="timelineContainer" class="timelineContainer">

            <div class="timelineToggle"><p><a class="expandAll">+ 全部展开</a></p></div>

            <br class="clear">

            <div class="timelineMajor">
                <h2 class="timelineMajorMarker"><span>1954</span></h2>
                <dl class="timelineMinor">
                    <dt id="19540517"><a>布朗诉教育委员会</a></dt>
                    <dd class="timelineEvent" id="19540517EX" style="display:none;">
                        <h3>1954年5月17日</h3>
                        <p>美国最高法院相传一致9-0决定在布朗诉托皮卡教育局案，打开大门，民权运动最终种族融合在美国社会的各个方面。推翻Plessy v. Ferguson（1896），法院裁定“隔离的教育设施是不平等的。</p>
                        <br class="clear">
                    </dd><!-- /.timelineEvent -->
                </dl><!-- /.timelineMinor -->
            </div><!-- /.timelineMajor -->

            <div class="timelineMajor">
                <h2 class="timelineMajorMarker"><span>1955</span></h2>
                <dl class="timelineMinor">
                    <dt id="19550828"><a>艾莫特·泰尔</a></dt>
                    <dd class="timelineEvent" id="19550828EX" style="display:none;">
                        <h3>1955年8月28日</h3>
                        <p>十四岁的非裔美国人埃米特被残忍杀害后，据说与白人妇女在访问亲戚在密西西比州。这是第一次，黑人和白人记者报道这次审判的集大成者”之一的第二十世纪最令人震惊的和持久的故事。”白被告，Roy Bryant和J.W. Milam，都被一个白人陪审团仅67分钟；后来他们详细描述为看杂志（付给他们4000美元）他们杀了为止。母亲坚持开放的棺材，和他残缺的身体，强大的图像引起强烈的反应，在全国和世界。</p>

                        <br class="clear">
                    </dd><!-- /.timelineEvent -->
                </dl><!-- /.timelineMinor -->


                <dl class="timelineMinor">
                    <dt id="19551201"><a>罗萨公园</a></dt>
                    <dd class="timelineEvent" id="19551201EX" style="display:none;">
                        <h3>December 1, 1955</h3>
                        <p>
                            The arrest of Rosa Parks, a 42-year-old African-American seamstress and civil rights activist who refused to give up her bus seat to a white passenger, sets off a long anticipated bus boycott by residents of Montgomery, Ala. The 13-month protest and ensuing litigation eventually make it to the U.S. Supreme Court, which declares that segregation on public buses is unconstitutional.<sup>4</sup> The Montgomery bus boycott brings the Rev. Dr. Martin Luther King Jr. and his nonviolent approach to social change to the forefront of the civil rights movement.</p>

                        <br class="clear">
                    </dd><!-- /.timelineEvent -->
                </dl><!-- /.timelineMinor -->
            </div><!-- /.timelineMajor -->

            <div class="timelineMajor">
                <h2 class="timelineMajorMarker"><span>1957</span></h2>
                <dl class="timelineMinor">
                    <dt id="19570904"><a>小石城</a></dt>
                    <dd class="timelineEvent" id="19570904EX" style="display:none;">
                        <h3>September 4, 1957</h3>


                        <p>
                            Three years removed from the Brown v. Board of Education decision, Arkansas Gov. Orval Faubus orders the National Guard to stop nine black students from attending the all-white Little Rock Central High School. President Dwight D. Eisenhower intervenes by federalizing the National Guard and deploying Army troops to protect the students, stripping the state of power. Media coverage of the physical and verbal harassment the black students were subjected to is reported and broadcast around the world. In the end, they successfully integrate Central High. <sup>5</sup></p>

                        <br class="clear">
                    </dd><!-- /.timelineEvent -->
                </dl><!-- /.timelineMinor -->
            </div><!-- /.timelineMajor -->

            <div class="timelineMajor">
                <h2 class="timelineMajorMarker"><span>1961</span></h2>
                <dl class="timelineMinor">
                    <dt id="19610504"><a>自由乘车运动</a></dt>
                    <dd class="timelineEvent" id="19610504EX" style="display:none;">
                        <h3>May 4, 1961</h3>

                        <p>
                            The first of many civil rights “Freedom Rides” leaves Washington, D.C., for New Orleans. The Freedom Riders want to test the validity of the Supreme Court’s decision to outlaw racial segregation in bus terminals and through interstate bus travel.<sup>6</sup> Angry white mobs – with the blessing of Alabama law enforcement – meet the convoy in Anniston and Birmingham, brutally beating the Freedom Riders and firebombing one of the buses.<sup>7</sup></p>
                        <br class="clear">
                    </dd><!-- /.timelineEvent -->
                </dl><!-- /.timelineMinor -->
            </div><!-- /.timelineMajor -->

            <div class="timelineMajor">
                <h2 class="timelineMajorMarker"><span>1963</span></h2>
                <dl class="timelineMinor">
                    <dt id="19630828"><a>“我有一个梦想”</a></dt>
                    <dd class="timelineEvent" id="19630828EX" style="display:none;">
                        <h3>August 28, 1963</h3>

                        <p>
                            In one of the largest gatherings in the nation’s capital and one of the first to be broadcast live on national television, at least 200,000 civil rights protesters stage a March on Washington concluding at the Lincoln Memorial. The march is dedicated to jobs and freedom and takes place 100 years after the&nbsp;Emancipation Proclamation. The highlight of the event is Martin Luther King Jr.’s historic “I Have a Dream” speech.</p>

                        <blockquote>
                            I have a dream that one day this nation will rise up and live out the true meaning of its creed: "We hold these truths to be self-evident: that all men are created equal."
                            <div class="attribution">&mdash;Martin Luthar King Jr.</div>
                        </blockquote>

                        <br class="clear">
                    </dd><!-- /.timelineEvent -->
                </dl><!-- /.timelineMinor -->

            </div><!-- /.timelineMajor -->

            <div class="timelineMajor">
                <h2 class="timelineMajorMarker"><span>1964</span></h2>

                <dl class="timelineMinor">
                    <dt id="19640702"><a>民权法案</a></dt>
                    <dd class="timelineEvent" id="19640702EX" style="display:none;">
                        <h3>July 2, 1964</h3>
                        <p>
                            President Lyndon B. Johnson signs the Civil Rights Act of 1964, mandating equal opportunity employment, and complete desegregation of schools and other public facilities. It also outlaws unequal voter registration requirements.<sup>13</sup> Although it would take years for these changes to take effect in communities around the country, the law is a monumental victory for the civil rights movement.</p>

                        <br class="clear">
                    </dd><!-- /.timelineEvent -->
                </dl><!-- /.timelineMinor -->

                <dl class="timelineMinor">
                    <dt id="19641014"><a>诺贝尔和平奖</a></dt>
                    <dd class="timelineEvent" id="19641014EX" style="display:none;">
                        <h3>October 14, 1964</h3>
                        <p>Martin Luther King Jr. is awarded the Nobel Peace Prize; at 35, he is the youngest recipient.</p>
                        <br class="clear">
                    </dd><!-- /.timelineEvent -->
                </dl><!-- /.timelineMinor -->

            </div><!-- /.timelineMajor -->
            <br class="clear">
        </div><!-- /#timelineContainer -->

    </div><!-- /.container -->

</div>

<div id="upInfo" style="display: none">
    <div class="container">

        <h1>时间轴</h1>
        <%--<p class="lead">张三的沟通反馈记录</p>--%>

        <h2>张三的沟通反馈记录</h2>


        <div id="timelineContainer" class="timelineContainer">

            <div class="timelineToggle">
                <p>
                    <a class="expandAll">展开 点击修改</a>
                </p>
            </div>

            <br class="clear">

            <div class="timelineMajor">
                <h2 class="timelineMajorMarker"><span>1954</span></h2>
                <dl class="timelineMinor">
                    <dt id="19740517"><a>布朗诉教育委员会</a></dt>
                    <dd class="timelineEvent" id="19740517EX" style="display:none;">
                        <h3>1954年5月17日</h3>
                        <div class="layui-form-item layui-form-text">
                            <div class="layui-input-block" style="margin: auto">
                                <textarea placeholder="请输入内容" class="layui-textarea" style="font-size: 16px;padding-left: 0px">美国最高法院相传一致9-0决定在布朗诉托皮卡教育局案，打开大门，民权运动最终种族融合在美国社会的各个方面。推翻Plessy v. Ferguson（1896），法院裁定“隔离的教育设施是不平等的。
                                </textarea>
                            </div>
                        </div>
                        <p><a class="layui-btn layui-btn-normal">提交修改内容</a>
                        </p>
                        <br class="clear">
                    </dd><!-- /.timelineEvent -->
                </dl><!-- /.timelineMinor -->
            </div><!-- /.timelineMajor -->

            <div class="timelineMajor">
                <h2 class="timelineMajorMarker"><span>1955</span></h2>
                <dl class="timelineMinor">
                    <dt id="19750828"><a>艾莫特·泰尔</a></dt>
                    <dd class="timelineEvent" id="19750828EX" style="display:none;">
                        <h3>1955年8月28日</h3>
                        <p>十四岁的非裔美国人埃米特被残忍杀害后，据说与白人妇女在访问亲戚在密西西比州。这是第一次，黑人和白人记者报道这次审判的集大成者”之一的第二十世纪最令人震惊的和持久的故事。”白被告，Roy Bryant和J.W. Milam，都被一个白人陪审团仅67分钟；后来他们详细描述为看杂志（付给他们4000美元）他们杀了为止。母亲坚持开放的棺材，和他残缺的身体，强大的图像引起强烈的反应，在全国和世界。</p>

                        <br class="clear">
                    </dd><!-- /.timelineEvent -->
                </dl><!-- /.timelineMinor -->


                <dl class="timelineMinor">
                    <dt id="19751201"><a>罗萨公园</a></dt>
                    <dd class="timelineEvent" id="19751201EX" style="display:none;">
                        <h3>December 1, 1955</h3>
                        <p>
                            The arrest of Rosa Parks, a 42-year-old African-American seamstress and civil rights activist who refused to give up her bus seat to a white passenger, sets off a long anticipated bus boycott by residents of Montgomery, Ala. The 13-month protest and ensuing litigation eventually make it to the U.S. Supreme Court, which declares that segregation on public buses is unconstitutional.<sup>4</sup> The Montgomery bus boycott brings the Rev. Dr. Martin Luther King Jr. and his nonviolent approach to social change to the forefront of the civil rights movement.</p>

                        <br class="clear">
                    </dd><!-- /.timelineEvent -->
                </dl><!-- /.timelineMinor -->
            </div><!-- /.timelineMajor -->

            <div class="timelineMajor">
                <h2 class="timelineMajorMarker"><span>1957</span></h2>
                <dl class="timelineMinor">
                    <dt id="19770904"><a>小石城</a></dt>
                    <dd class="timelineEvent" id="19770904EX" style="display:none;">
                        <h3>September 4, 1957</h3>
                        <p>
                            Three years removed from the Brown v. Board of Education decision, Arkansas Gov. Orval Faubus orders the National Guard to stop nine black students from attending the all-white Little Rock Central High School. President Dwight D. Eisenhower intervenes by federalizing the National Guard and deploying Army troops to protect the students, stripping the state of power. Media coverage of the physical and verbal harassment the black students were subjected to is reported and broadcast around the world. In the end, they successfully integrate Central High. <sup>5</sup></p>

                        <br class="clear">
                    </dd><!-- /.timelineEvent -->
                </dl><!-- /.timelineMinor -->
            </div><!-- /.timelineMajor -->

            <div class="timelineMajor">
                <h2 class="timelineMajorMarker"><span>1961</span></h2>
                <dl class="timelineMinor">
                    <dt id="19710504"><a>自由乘车运动</a></dt>
                    <dd class="timelineEvent" id="19710504EX" style="display:none;">
                        <h3>May 4, 1961</h3>

                        <p>
                            The first of many civil rights “Freedom Rides” leaves Washington, D.C., for New Orleans. The Freedom Riders want to test the validity of the Supreme Court’s decision to outlaw racial segregation in bus terminals and through interstate bus travel.<sup>6</sup> Angry white mobs – with the blessing of Alabama law enforcement – meet the convoy in Anniston and Birmingham, brutally beating the Freedom Riders and firebombing one of the buses.<sup>7</sup></p>
                        <br class="clear">
                    </dd><!-- /.timelineEvent -->
                </dl><!-- /.timelineMinor -->
            </div><!-- /.timelineMajor -->

            <div class="timelineMajor">
                <h2 class="timelineMajorMarker"><span>1963</span></h2>
                <dl class="timelineMinor">
                    <dt id="19730828"><a>“我有一个梦想”</a></dt>
                    <dd class="timelineEvent" id="19730828EX" style="display:none;">
                        <h3>August 28, 1963</h3>

                        <p>
                            In one of the largest gatherings in the nation’s capital and one of the first to be broadcast live on national television, at least 200,000 civil rights protesters stage a March on Washington concluding at the Lincoln Memorial. The march is dedicated to jobs and freedom and takes place 100 years after the&nbsp;Emancipation Proclamation. The highlight of the event is Martin Luther King Jr.’s historic “I Have a Dream” speech.</p>

                        <blockquote>
                            I have a dream that one day this nation will rise up and live out the true meaning of its creed: "We hold these truths to be self-evident: that all men are created equal."
                            <div class="attribution">&mdash;Martin Luthar King Jr.</div>
                        </blockquote>

                        <br class="clear">
                    </dd><!-- /.timelineEvent -->
                </dl><!-- /.timelineMinor -->

            </div><!-- /.timelineMajor -->

            <div class="timelineMajor">
                <h2 class="timelineMajorMarker"><span>1964</span></h2>

                <dl class="timelineMinor">
                    <dt id="19740702"><a>民权法案</a></dt>
                    <dd class="timelineEvent" id="19740702EX" style="display:none;">
                        <h3>July 2, 1964</h3>
                        <p>
                            President Lyndon B. Johnson signs the Civil Rights Act of 1964, mandating equal opportunity employment, and complete desegregation of schools and other public facilities. It also outlaws unequal voter registration requirements.<sup>13</sup> Although it would take years for these changes to take effect in communities around the country, the law is a monumental victory for the civil rights movement.</p>

                        <br class="clear">
                    </dd><!-- /.timelineEvent -->
                </dl><!-- /.timelineMinor -->

                <dl class="timelineMinor">
                    <dt id="19741014"><a>诺贝尔和平奖</a></dt>
                    <dd class="timelineEvent" id="19741014EX" style="display:none;">
                        <h3>October 14, 1964</h3>
                        <p>Martin Luther King Jr. is awarded the Nobel Peace Prize; at 35, he is the youngest recipient.</p>
                        <br class="clear">
                    </dd><!-- /.timelineEvent -->
                </dl><!-- /.timelineMinor -->

            </div><!-- /.timelineMajor -->
            <br class="clear">
        </div><!-- /#timelineContainer -->

    </div><!-- /.container -->
</div>

<script type="text/javascript" src="${baseurl}/public/css/timeAsix/inc/colorbox.js"></script>
<script type="text/javascript" src="${baseurl}/public/css/timeAsix/js/timeliner.min.js"></script>
<script>
    $(document).ready(function() {
        $.timeliner({
            startOpen:['#19550828EX', '#19630828EX']
        });
        $.timeliner({
            timelineContainer: '#timelineContainer_2'
        });
        // Colorbox Modal
        $(".CBmodal").colorbox({inline:true, initialWidth:100, maxWidth:682, initialHeight:100, transition:"elastic",speed:750});
    });
</script>
<script>
    layui.use('form', function () {
        var $ = layui.jquery, form = layui.form();

        //全选
        form.on('checkbox(allChoose)', function (data) {
            var child = $(data.elem).parents('table').find('tbody input[type="checkbox"]');
            child.each(function (index, item) {
                item.checked = data.elem.checked;
            });
            form.render('checkbox');
        });

    });

    //分页
    layui.use(['laypage', 'layer'], function () {
        var laypage = layui.laypage
            , layer = layui.layer;

        laypage({
            cont: 'demo7'
            , pages: 100 //总页数
            , groups: 5 //连续显示分页数
        });
    });
</script>

<script>
    $(document).ready(function () {

    })
    
    function seeCommunication() {
        layer.open({
            type: 1,
            title: '沟通反馈记录详细信息',
            area: ['100%', '100%'],
            skin: 'yourclass',
            content: $('#seeInfo'),
        });
    }

    function addCommunication() {

        layer.open({
            type: 1,
            title: '添加沟通反馈记录',
            area: ['100%', '100%'],
            skin: 'yourclass',
            content: $('#addInfo'),
        });
    }

   function upCommunication() {
        layer.open({
            type: 1,
            title: '添加沟通反馈记录',
            area: ['100%', '100%'],
            skin: 'yourclass',
            content: $('#upInfo'),
        });
    }
</script>

<script>
    layui.use('layer', function () { //独立版的layer无需执行这一句
        var $ = layui.jquery, layer = layui.layer; //独立版的layer无需执行这一句

        //触发事件
        var active = {

            notice: function () {
                //示范一个公告层
                layer.open({
                    type: 1
                    ,
                    title: false //不显示标题栏
                    ,
                    closeBtn: false
                    ,
                    area: '300px;'
                    ,
                    shade: 0.8
                    ,
                    id: 'LAY_layuipro' //设定一个id，防止重复弹出
                    ,
                    btn: ['火速围观', '残忍拒绝']
                    ,
                    moveType: 1 //拖拽模式，0或者1
                    ,
                    content: '<div style="padding: 50px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;">你知道吗？亲！<br>layer ≠ layui<br><br>layer只是作为Layui的一个弹层模块，由于其用户基数较大，所以常常会有人以为layui是layerui<br><br>layer虽然已被 Layui 收编为内置的弹层模块，但仍然会作为一个独立组件全力维护、升级。<br><br>我们此后的征途是星辰大海 ^_^</div>'
                    ,
                    success: function (layero) {
                        var btn = layero.find('.layui-layer-btn');
                        btn.css('text-align', 'center');
                        btn.find('.layui-layer-btn0').attr({
                            href: 'http://www.layui.com/'
                            , target: '_blank'
                        });
                    }
                });
            }
            , offset: function (othis) {
                var type = othis.data('type')
                    , text = othis.text();

                layer.open({
                    type: 1
                    , offset: type //具体配置参考：http://www.layui.com/doc/modules/layer.html#offset
                    , id: 'LAY_demo' + type //防止重复弹出
                    , content: '<div style="padding: 20px 100px;">' + text + '</div>'
                    , btn: '关闭全部'
                    , btnAlign: 'c' //按钮居中
                    , shade: 0 //不显示遮罩
                    , yes: function () {
                        layer.closeAll();
                    }
                });
            }
        };

        $('.site-demo-button .layui-btn').on('click', function () {
            var othis = $(this), method = othis.data('method');
            active[method] ? active[method].call(this, othis) : '';
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
            ,stuNo:function (value) {
                if (value.length<14){
                    return '请输入正确格式的学号';
                }
            }
        });

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


    });
</script>
</body>
</html>
