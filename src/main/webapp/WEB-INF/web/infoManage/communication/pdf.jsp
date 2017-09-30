<%@ page contentType="text/html; charset=UTF-8" %>

<script type="text/javascript">
    function printPDF(data) {
        let communicationData = data.data;
        let communicateContentHead = [];
        for (let i = 0; i < communicationData.length - 1; i++) {
            communicateContentHead.push([
                {
                    text: "时间：" + communicationData[i].time,
                    fontSize: 8,
                    border: [false, true, false, true],
                    margin: [0, 4, 0, 4]
                },
                {
                    text: "沟通老师：" + communicationData[i].teacherName,
                    fontSize: 8,
                    border: [false, true, false, true],
                    margin: [0, 4, 0, 4]
                },
                {
                    text: "沟通对象：" + communicationData[i].talkName,
                    fontSize: 8,
                    border: [false, true, false, true],
                    margin: [0, 4, 0, 4]
                },
                {
                    text: "沟通类型：" + communicationData[i].direction,
                    fontSize: 8,
                    border: [false, true, false, true],
                    margin: [0, 4, 0, 4]
                },
                {
                    text: "沟通方式：" + communicationData[i].communicationMode,
                    fontSize: 8,
                    border: [false, true, false, true],
                    margin: [0, 4, 0, 4]
                },
                {
                    text: "电话：" + communicationData[i].communicationPhone,
                    fontSize: 8,
                    border: [false, true, false, true],
                    margin: [0, 4, 0, 4]
                },
            ]);
            let communicationDataContent = communicationData[i].contents;
            let contentTimes = 0;
            for (let count = 0; count < communicationDataContent.length - 1; count += 2) {
                contentTimes++;
                communicateContentHead.push(
                    [
                        {
                            text: "Q" + contentTimes + "：",
                            alignment: 'center',
                            colSpan: 1,
                            margin: [0, 4, 0, 4],
                            border: [false, false, false, false],
                            style: "removeTheBorder"
                        },
                        {
                            text: communicationDataContent[count],
                            margin: [0, 4, 0, 4],
                            border: [false, false, false, false],
                            colSpan: 5,
                        }, {}, {}, {}, {}
                    ],
                    [
                        {
                            text: "A" + contentTimes + "：",
                            alignment: 'center',
                            border: [false, false, false, false],
                            margin: [0, 4, 0, 4],
                            colSpan: 1,
                            style: "removeTheBorder"
                        },
                        {
                            text: communicationDataContent[count + 1],
                            margin: [0, 4, 0, 4],
                            border: [false, false, false, false],
                            colSpan: 5,
                        }, {}, {}, {}, {}
                    ]
                )
            }
        }
        //图片格式转换
        var x = new ImageDataURL([baseUrl + "/images/public/logo_1.jpg"]);
        x.oncomplete = function () {
            let imgs = [];
            for (let key in this.imgdata) {
                if (this.imgdata[key] == this.emptyobj) {
                    imgs.push({text: '请上传头像', fontSize: 10, rowSpan: 3});
                    continue;
                }//不存在的圖片直接忽略
                imgs.push({image: this.imgdata[key], fit: [150, 120], rowSpan: 3,fillColor: '#ffffff',});//在的圖片直接忽略
            }

            console.log(imgs.d1)
            var content = {
                content: [
                    {
                        style: "coverStyle",
                        table: {
                            widths: [120, "*", "*", "*", 240],
                            body: [
                                [imgs,{},{},{},{}],
                                [{text: "\n\n\n\n\n\n\n\n\n\n\n\n"}, {text: ""}, {text: ""}, {text: ""}, {text: ""}],
                                [{text: ""}, {text: ""}, {text: ""}, {text: ""},
                                    {
                                        text: "西安欧亚学院高职学院学生成长报告",
                                        color: "#36B7AB",
                                        fontSize: 15,
                                    }],
                                [{text: ""}, {text: ""}, {text: ""}, {text: ""}, {text: "姓名：陈可东"}],
                                [{text: ""}, {text: ""}, {text: ""}, {text: ""}, {text: "籍贯："}],
                                [{text: ""}, {text: ""}, {text: ""}, {text: ""}, {text: "身份证号：42088119981209573X"}],
                                [{text: ""}, {text: ""}, {text: ""}, {text: ""}, {text: "专业：连锁经营管理"}],
                                [{text: ""}, {text: ""}, {text: ""}, {text: ""}, {text: "就业方向：中英国际"}],
                                [{text: ""}, {text: ""}, {text: ""}, {text: ""}, {text: "班级：中英1701"}],
                                [{text: "\n\n"}, {text: ""}, {text: ""}, {text: ""}, {text: ""}],
                                [{text: "\n\n\n\n\n\n\n\n\n\n\n\n",fillColor: '#009688'}, {text: "",fillColor: '#009688'}, {text: ""}, {text: ""}, {text: ""}],
                                [imgs,{},{},{},{}]
                            ]
                        },
                        layout: {
                            fillColor: function (i, node) { return (i % 2 === 0) ?  '#ffffff' : null; }
                        },
                        layout: 'noBorders',
                    },
                    {
                        style: "tableExample",
                        table: {
                            widths: [110, 80, 70, 75, 60, 90],
                            body: communicateContentHead,
                        },
//                        layout: 'noBorders',
                    },
                ],
                styles: {
                    coverStyle: {
                        margin: [20, 20, 20, 20]
                    },
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
                        fontSize: 8,
                        bold: false,
                        margin: [0, 15, 0, 15]
                    },
                    tableHeader: {
                        bold: true,
                        fontSize: 13,
                        color: "black"
                    },
                    removeTheBorder: {
                        border: "none",
                        margin: [0, 0, 0, 0]
                    }
                },
                defaultStyle: {
                    font: "微软雅黑"
                }
            };
            pdfmake(content);
        }
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
<script>
    function ImageDataURL(urls) {//urls必須是字符串或字符串數組
        this.completenum = 0;
        this.totalnum = 0;
        this.imgdata = new Array();
        this.emptyobj = new Object();
        this.oncomplete = function () {
        };
        this.getDataURL = function (url, index) {
            var c = document.createElement("canvas");
            var cxt = c.getContext("2d");
            var img = new Image();
            var dataurl;
            var p;
            p = this;
            img.src = url;
            img.onload = function () {
                var i;
                var maxwidth = 500;
                var scale = 1.0;
                if (img.width > maxwidth) {
                    scale = maxwidth / img.width;
                    c.width = maxwidth;
                    c.height = Math.floor(img.height * scale);
                } else {
                    c.width = img.width;
                    c.height = img.height;
                }
                cxt.drawImage(img, 0, 0, c.width, c.height);

                p.imgdata[index] = c.toDataURL('image/jpeg');
                for (i = 0; i < p.totalnum; ++i) {
                    if (p.imgdata[i] == null) break;
                }
                if (i == p.totalnum) {
                    p.oncomplete();
                }
            };
            img.onerror = function () {
                p.imgdata[index] = p.emptyobj;
                for (i = 0; i < p.totalnum; ++i) {
                    if (p.imgdata[i] == null) break;
                }
                if (i == p.totalnum) {
                    p.oncomplete();
                }
            };
        }
        if (urls instanceof Array) {
            this.totalnum = urls.length;
            this.imgdata = new Array(this.totalnum);
            for (key in urls) {
                this.getDataURL(urls[key], key);
            }
        } else {
            this.imgdata = new Array(1);
            this.totalnum = 1;
            this.getDataURL(urls, 0);
        }
    }
</script>