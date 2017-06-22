
<script>
    layui.config({
        base: '${baseurl}/public/js/lib/' //layui自定义layui组件目录
    }).extend({
        larry: 'larry',
        navtab: 'navtab',
        elemnts: 'elements',
        common: 'common'
    });
    layui.use(['elements', 'jquery', 'layer', 'larry', 'navtab', 'form', 'common'], function () {
        var $ = layui.jquery,
            layer = layui.layer,
            device = layui.device(),
            elements = layui.elements(),
            larry = layui.larry(),
            form = layui.form(),
            common = layui.common;
        navtab = layui.navtab({
            elem: '#larry-tab'
        });
    });


</script>