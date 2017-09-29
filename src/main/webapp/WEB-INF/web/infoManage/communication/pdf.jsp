<%@ page contentType="text/html; charset=UTF-8" %>

<script type="text/javascript">
    function printPDF(data) {
        alert(123);
        var content = {
            content: [
                {
                    text: "西安欧亚学院张三的成长报告",
                    fontSize: 22,
                    style: "subheader",
                    color: "#36B7AB",
                    alignment: "center"
                },
                {
                    style: "tableExample",
                    table: {
                        widths: [110,70,70,60,60,100],
                        body: [
                            [
                                {
                                    text: "时间：2017-09-29 18:52:47",
                                    fontSize: 8,
                                    margin: [0, 4, 0, 4]
                                },
                                {
                                    text: "沟通老师： ****",
                                    fontSize: 8,
                                    margin: [0, 4, 0, 4]
                                },
                                {
                                    text: "沟通对象：吕俊杰 ",
                                    fontSize: 8,
                                    margin: [0, 4, 0, 4]
                                },
                                {
                                    text: "沟通方式：面谈",
                                    fontSize: 8,
                                    margin: [0, 4, 0, 4]
                                },
                                {
                                    text:"沟通方式：面谈",
                                    fontSize:8,
                                    margin: [0, 4, 0, 4]
                                },
                                {
                                    text:"电话：15291194274",
                                    fontSize:8,
                                    margin: [0, 4, 0, 4]
                                },
                            ]
                        ],
                    },
                },
                {
                    style: "tableExample",
                    table:{
                        width:["*"],
                        body:[
                            [
                                {
                                    text:"Q1",
                                },
                                {
                                    text: "作为本地区应用技术大学商科教育领航者，西安欧亚学院以商科为载体，利用先进的教育理念，改变了传统的商科的知识结构，教学环境、教学模式、教学内容、考核方式",
                                }
                            ]
                        ]
                    },
                },
                {
                    text: "一、欧亚商科在于所有与市场相关联的经济、管理学科之间没有知识壁垒，是附属、服务于市场经济需求的复合型商科。二、在信息时代，欧亚商科遵循商业文明的规律，利用新电子商务、新金融、新物流等手段服务于教育。三、欧亚商科关注社会发展变迁、面向未来，培养有自我价值观念的终身学习者。四、欧亚商科遵循学生的认知规律，探索教与学的新范式。追求教育的新境界，在商科领域注重培养学生的批判性思维、表达与思考能力、终身学习能力，使之既适合行业需要，又适应社会快速发展需要",
                    style: "tableExample",
                },

            ],
            styles: {
                header: {
                    fontSize: 18,
                    bold: true,
                    margin: [0, 0, 0, 10]
                },
                subheader: {
                    fontSize: 16,
                    bold: true,
                    margin: [0, 10, 0, 5]
                },
                tableExample: {
                    fontSize: 10,
                    margin: [0, 5, 0, 15]
                },
                tableHeader: {
                    bold: true,
                    fontSize: 13,
                    color: "black"
                }
            },
            defaultStyle: {
                font: "微软雅黑"
            }
        };
        pdfmake(content);
    }
</script>


<script>
    function pdfmake(content) {
        var dd = content;

        pdfMake.fonts = {
            Roboto: {
                normal: 'Roboto-Regular.ttf',
                bold: 'Roboto-Medium.ttf',
                italics: 'Roboto-Italic.ttf',
                bolditalics: 'Roboto-Italic.ttf'
            },
            微软雅黑: {
                normal: '微软雅黑.ttf',
                bold: '微软雅黑.ttf',
                italics: '微软雅黑.ttf',
                bolditalics: '微软雅黑.ttf',
            }
        };
        pdfMake.createPdf(dd).download(function () {
        });
    }
</script>