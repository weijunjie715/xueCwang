<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/include/common.jsp"%>
<html>
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />

    <script>DD_belatedPNG.fix('*');</script>
    <style type="text/css">
        .ui-sortable .panel-header {
            cursor: move
        }

        /* 菜单按钮样式 */
        .radiusNew {
            width: 16.66666667%;
            height: 50px;
            font-size: 25px;
            vertical-align: middle;
        }
        .maskWraper {
            float: left;
        }
        .aboutClass {
            float: left;
        }
        /* 星星评分大小 */
        .size-S img{width:16px;height:16px}
        .mainBody {
            margin-left: 10%;
            margin-right: 10%;
        }

    </style>
    <title>课程详情</title>

</head>
<body ontouchstart>
<c:import url="backLoli.jsp"></c:import>
<div class="sideBox">

</div>
<div class="containBox">
    <div class="containBox-bg"></div>
    <header class="navbar-wrapper">
        <div class="navbar navbar-black navbar-fixed-top">
            <div class="container cl">
                <a class="logo navbar-logo hidden-xs" href="/toIndex">C语言学习网</a>
                <span class="logo navbar-slogan hidden-xs">简单 &middot; 免费 &middot; 适合初学者</span>
                <a aria-hidden="false" class="nav-toggle Hui-iconfont visible-xs JS-nav-toggle" href="javascript:;">&#xe667;</a>
                <input type="hidden" value="${userInfo.suId}" id="userHiddenId">
                <nav class="nav navbar-nav nav-collapse" role="navigation" id="Hui-navbar">
                    <ul class="cl" style="float:right!important;_display:inline">
                        <c:if test="${not empty userInfo}">
                            <li>
                                <a href="#" >${userInfo.suName}</a>
                            </li>
                        </c:if>

                        <li class="dropDown dropDown_hover">
                            <a href="javascript:;" class="dropDown_A">控制台 <i class="Hui-iconfont">&#xe6d5;</i></a>
                            <ul class="dropDown-menu menu radius box-shadow">
                                <c:if test="${empty userInfo}">
                                    <li>
                                        <a href="/toRegister" >注册</a>
                                    </li>
                                    <li>
                                        <a href="javascritp:;" onClick="modaldemo()">登陆</a>
                                    </li>
                                </c:if>
                                <c:if test="${not empty userInfo}">
                                    <c:import url="userChoose.jsp"></c:import>
                                </c:if>

                            </ul>
                        </li>

                        <li>
                            <a href="http://h-ui.net/aboutHui.shtml" >技术支持</a>
                        </li>
                    </ul>
                </nav>
                <nav class="navbar-userbar hidden-xs"></nav>
            </div>
        </div>
    </header>
    <div class="wap-container">
        <div id="slider-1" class="bg-fff box-shadow radius">

        </div>

        <div class="panel-body">
            <div class="btn-group banner" style="text-align:center;">
                <c:import url="butArray.jsp"></c:import>
            </div>
            <div id="clazzs">
                <div id="aboutUs" class="mainBody">
                    <h1>学C网，致力于C语言专业教育</h1>
                    <div class="para" label-module="para">C语言诞生于美国的<a target="_blank" href="https://baike.baidu.com/item/%E8%B4%9D%E5%B0%94/1064241" data-lemmaid="1064241">贝尔</a>实验室，由D.M.Ritchie以<a target="_blank" href="https://baike.baidu.com/item/B%E8%AF%AD%E8%A8%80/1845842" data-lemmaid="1845842">B语言</a>为基础发展而来，在它的主体设计完成后，Thompson和Ritchie用它完全重写了UNIX，且随着UNIX的发展，c语言也得到了不断的完善。为了利于C语言的全面推广，许多专家学者和硬件厂商联合组成了C语言标准委员会，并在之后的1989年，诞生了第一个完备的C标准，简称“C89”，也就是“ANSI c”，截至2020年，最新的C语言标准为2017年发布的 “C17”。<sup class="sup--normal" data-sup="5" data-ctrmap=":5,">
                        [5]</sup><a class="sup-anchor" name="ref_[5]_1219">&nbsp;</a>
                    </div>
                    <div class="para" label-module="para">C语言之所以命名为C，是因为 C语言源自<a target="_blank" href="https://baike.baidu.com/item/Ken%20Thompson">Ken Thompson</a>发明的<a target="_blank" href="https://baike.baidu.com/item/B%E8%AF%AD%E8%A8%80">B语言</a>，而 B语言则源自BCPL语言。</div>
                    <div class="para" label-module="para">1967年，<a target="_blank" href="https://baike.baidu.com/item/%E5%89%91%E6%A1%A5%E5%A4%A7%E5%AD%A6">剑桥大学</a>的Martin Richards对CPL语言进行了简化，于是产生了BCPL（Basic Combined Programming Language）语言。</div>
                    <div class="para" label-module="para">20世纪60年代，美国<a target="_blank" href="https://baike.baidu.com/item/AT%26T">AT&amp;T</a>公司<a target="_blank" href="https://baike.baidu.com/item/%E8%B4%9D%E5%B0%94%E5%AE%9E%E9%AA%8C%E5%AE%A4">贝尔实验室</a>（AT&amp;T Bell Laboratory）的研究员<a target="_blank" href="https://baike.baidu.com/item/Ken%20Thompson">Ken Thompson</a>闲来无事，手痒难耐，想玩一个他自己编的，模拟在太阳系航行的电子游戏——Space Travel。他背着老板，找到了台空闲的机器——<a target="_blank" href="https://baike.baidu.com/item/PDP-7">PDP-7</a>。但这台机器没有操作系统，而游戏必须使用操作系统的一些功能，于是他着手为PDP-7开发操作系统。后来，这个操作系统被命名为——<a target="_blank" href="https://baike.baidu.com/item/UNIX">UNIX</a>。</div>
                    <div class="para" label-module="para">1970年，美国贝尔实验室的 Ken Thompson，以<a target="_blank" href="https://baike.baidu.com/item/BCPL">BCPL</a>语言为基础，设计出很简单且很接近硬件的B语言（取BCPL的首字母）。并且他用B语言写了第一个UNIX操作系统。</div>
                    <div class="para" label-module="para">1971年，同样<a target="_blank" href="https://baike.baidu.com/item/%E9%85%B7%E7%88%B1/1371" data-lemmaid="1371">酷爱</a>Space Travel的<a target="_blank" href="https://baike.baidu.com/item/Dennis%20M.Ritchie">Dennis M.Ritchie</a>为了能早点儿玩上游戏，加入了Thompson的开发项目，合作开发UNIX。他的主要工作是改造B语言，使其更成熟。<sup class="sup--normal" data-sup="6" data-ctrmap=":6,">
                        [6]</sup><a class="sup-anchor" name="ref_[6]_1219">&nbsp;</a>
                        <a name="ref_6"></a><a name="ref_6"></a><a name="ref_6"></a></div>
                    <div class="para" label-module="para">1972年，美国<a target="_blank" href="https://baike.baidu.com/item/%E8%B4%9D%E5%B0%94%E5%AE%9E%E9%AA%8C%E5%AE%A4">贝尔实验室</a>的 D.M.Ritchie 在B语言的基础上最终设计出了一种新的<a target="_blank" href="https://baike.baidu.com/item/%E8%AF%AD%E8%A8%80/2291095" data-lemmaid="2291095">语言</a>，他取了BCPL的第二个字母作为这种语言的名字，这就是C语言。</div>
                    <div class="para" label-module="para">1973年初，C语言的主体完成。Thompson和Ritchie迫不及待地开始用它完全重写了<a target="_blank" href="https://baike.baidu.com/item/UNIX">UNIX</a>。此时，编程的乐趣使他们已经完全忘记了那个"Space Travel"，一门心思地投入到了UNIX和C语言的开发中。随着UNIX的发展，C语言自身也在不断地完善。直到2020年，各种版本的UNIX内核和周边工具仍然使用C语言作为最主要的开发语言，其中还有不少继承Thompson和Ritchie之手的代码。<sup class="sup--normal" data-sup="6" data-ctrmap=":6,">
                        [6]</sup><a class="sup-anchor" name="ref_[6]_1219">&nbsp;</a>
                        <a name="ref_6"></a><a name="ref_6"></a><a name="ref_6"></a></div>
                    <div class="para" label-module="para">在开发中，他们还考虑把<a target="_blank" href="https://baike.baidu.com/item/UNIX">UNIX</a>移植到其他类型的计算机上使用。C语言强大的移植性（Portability）在此显现。机器语言和<a target="_blank" href="https://baike.baidu.com/item/%E6%B1%87%E7%BC%96%E8%AF%AD%E8%A8%80/61826" data-lemmaid="61826">汇编语言</a>都不具有移植性，为<a target="_blank" href="https://baike.baidu.com/item/x86">x86</a>开发的程序，不可能在Alpha、<a target="_blank" href="https://baike.baidu.com/item/SPARC">SPARC</a>和<a target="_blank" href="https://baike.baidu.com/item/ARM/7518299" data-lemmaid="7518299">ARM</a>等机器上运行。而C语言程序则可以使用在任意架构的<a target="_blank" href="https://baike.baidu.com/item/%E5%A4%84%E7%90%86%E5%99%A8">处理器</a>上，只要那种架构的处理器具有对应的C语言<a target="_blank" href="https://baike.baidu.com/item/%E7%BC%96%E8%AF%91%E5%99%A8">编译器</a>和库，然后将C源代码<a target="_blank" href="https://baike.baidu.com/item/%E7%BC%96%E8%AF%91">编译</a>、<a target="_blank" href="https://baike.baidu.com/item/%E8%BF%9E%E6%8E%A5/8248019" data-lemmaid="8248019">连接</a>成目标<a target="_blank" href="https://baike.baidu.com/item/%E4%BA%8C%E8%BF%9B%E5%88%B6%E6%96%87%E4%BB%B6">二进制文件</a>之后即可运行。<sup class="sup--normal" data-sup="6" data-ctrmap=":6,">
                        [6]</sup><a class="sup-anchor" name="ref_[6]_1219">&nbsp;</a>
                        <a name="ref_6"></a><a name="ref_6"></a><a name="ref_6"></a></div>
                    <div class="para" label-module="para">1977年，<a target="_blank" href="https://baike.baidu.com/item/Dennis%20M.Ritchie">Dennis M.Ritchie</a>发表了不依赖于具体机器系统的C语言编译文本《可移植的C语言编译程序》。</div>
                    <div class="para" label-module="para">C语言继续发展，在1982年，很多有识之士和<a target="_blank" href="https://baike.baidu.com/item/%E7%BE%8E%E5%9B%BD%E5%9B%BD%E5%AE%B6%E6%A0%87%E5%87%86%E5%8D%8F%E4%BC%9A">美国国家标准协会</a>为了使这个语言健康地发展下去，决定成立C标准委员会，建立C语言的标准。委员会由硬件厂商、编译器及其他软件工具生产商、软件设计师、顾问、学术界人士、C语言作者和应用程序员组成。1989年，<a target="_blank" href="https://baike.baidu.com/item/ANSI/14955" data-lemmaid="14955">ANSI</a>发布了第一个完整的C语言标准——ANSI X3.159—1989，简称“C89”，不过人们也习惯称其为“<a target="_blank" href="https://baike.baidu.com/item/ANSI%20C">ANSI C</a>”。C89在1990年被<a target="_blank" href="https://baike.baidu.com/item/%E5%9B%BD%E9%99%85%E6%A0%87%E5%87%86%E7%BB%84%E7%BB%87">国际标准组织</a>ISO(International Standard Organization)一字不改地采纳，ISO官方给予的名称为：ISO/IEC 9899，所以ISO/IEC9899: 1990也通常被简称为“C90”。1999年，在做了一些必要的修正和完善后，ISO发布了新的C语言标准，命名为ISO/IEC 9899：1999，简称“<a target="_blank" href="https://baike.baidu.com/item/C99">C99</a>”。<sup class="sup--normal" data-sup="6" data-ctrmap=":6,">
                        [6]</sup><a class="sup-anchor" name="ref_[6]_1219">&nbsp;</a>
                        <a name="ref_6"></a><a name="ref_6"></a><a name="ref_6"></a>在2011年12月8日，ISO又正式发布了新的标准，称为ISO/IEC9899: 2011，简称为“<a target="_blank" href="https://baike.baidu.com/item/C11">C11</a>”。</div><div class="anchor-list ">
                    <a name="3" class="lemma-anchor para-title"></a>
                    <a name="sub1219_3" class="lemma-anchor "></a>
                    <a name="语言特点" class="lemma-anchor "></a>
                </div><div class="para-title level-2" label-module="para-title">
                    <h2 class="title-text"><span class="title-prefix">c语言</span>语言特点</h2>
                    <a class="edit-icon j-edit-link" data-edit-dl="3" href="javascript:;" style="display: block;"><em class="cmn-icon wiki-lemma-icons wiki-lemma-icons_edit-lemma"></em>编辑</a>
                </div>
                    <div class="anchor-list ">
                        <a name="3_1" class="lemma-anchor para-title"></a>
                        <a name="sub1219_3_1" class="lemma-anchor "></a>
                        <a name="主要特点" class="lemma-anchor "></a>
                        <a name="3-1" class="lemma-anchor "></a>
                    </div><div class="para-title level-3" label-module="para-title">
                    <h3 class="title-text"><span class="title-prefix">c语言</span>主要特点</h3>
                </div>
                    <div class="para" label-module="para">C语言是一种结构化语言，它有着清晰的层次，可按照模块的方式对程序进行编写，十分有利于程序的调试，且c语言的处理和表现能力都非常的强大，依靠非常全面的运算符和多样的<a target="_blank" href="https://baike.baidu.com/item/%E6%95%B0%E6%8D%AE%E7%B1%BB%E5%9E%8B/10997964" data-lemmaid="10997964">数据类型</a>，可以轻易完成各种数据结构的构建，通过指针类型更可对内存直接寻址以及对硬件进行直接操作，因此既能够用于开发系统程序，也可用于开发应用软件。通过对C语言进行研究分析，总结出其主要特点如下：</div>
                    <div class="para" label-module="para">（1）简洁的语言</div>
                    <div class="para" label-module="para">C语言包含的各种<a target="_blank" href="https://baike.baidu.com/item/%E6%8E%A7%E5%88%B6%E8%AF%AD%E5%8F%A5/10507605" data-lemmaid="10507605">控制语句</a>仅有9种，关键字也只有32 个，程序的编写要求不严格且以小写字母为主，对许多不必要的部分进行了精简。实际上，语句构成与硬件有关联的较少，且C语言本身不提供与硬件相关的输入输出、文件管理等功能，如需此类功能，需要通过配合编译系统所支持的各类库进行编程，故c语言拥有非常简洁的编译系统。<sup class="sup--normal" data-sup="5" data-ctrmap=":5,">
                        [5]</sup><a class="sup-anchor" name="ref_[5]_1219">&nbsp;</a>
                    </div>
                    <div class="para" label-module="para">（2）具有结构化的控制语句</div>
                    <div class="para" label-module="para">C语言是一种结构化的语言，提供的控制语句具有结构化特征，如for语句、if⋯else语句和switch语句等。可以用于实现函数的逻辑控制，方便面向过程的程序设计。<sup class="sup--normal" data-sup="5" data-ctrmap=":5,">
                        [5]</sup><a class="sup-anchor" name="ref_[5]_1219">&nbsp;</a>
                    </div>
                    <div class="para" label-module="para">（3）丰富的数据类型</div>
                    <div class="para" label-module="para">C语言包含的数据类型广泛，不仅包含有传统的字符型、整型、浮点型、数组类型等数据类型，还具有其他编程语言所不具备的数据类型，其中以指针类型数据使用最为灵活，可以通过编程对各种数据结构进行计算。<sup class="sup--normal" data-sup="5" data-ctrmap=":5,">
                        [5]</sup><a class="sup-anchor" name="ref_[5]_1219">&nbsp;</a>
                    </div>
                    <div class="para" label-module="para">（4）丰富的运算符</div>
                    <div class="para" label-module="para">C语言包含34个<a target="_blank" href="https://baike.baidu.com/item/%E8%BF%90%E7%AE%97%E7%AC%A6/7752795" data-lemmaid="7752795">运算符</a>，它将赋值、括号等均是作运算符来操作，使C程序的表达式类型和运算符类型均非常丰富。<sup class="sup--normal" data-sup="5" data-ctrmap=":5,">
                        [5]</sup><a class="sup-anchor" name="ref_[5]_1219">&nbsp;</a>
                    </div>
                    <div class="para" label-module="para">（5）可对<a target="_blank" href="https://baike.baidu.com/item/%E7%89%A9%E7%90%86%E5%9C%B0%E5%9D%80/2901583" data-lemmaid="2901583">物理地址</a>进行直接操作</div>
                    <div class="para" label-module="para">C语言允许对<a target="_blank" href="https://baike.baidu.com/item/%E7%A1%AC%E4%BB%B6/479446" data-lemmaid="479446">硬件</a>内存地址进行直接读写，以此可以实现汇编语言的主要功能，并可直接操作硬件。C语言不但具备高级语言所具有的良好特性，又包含了许多低级语言的优势，故在系统软件编程领域有着广泛的应用。<sup class="sup--normal" data-sup="5" data-ctrmap=":5,">
                        [5]</sup><a class="sup-anchor" name="ref_[5]_1219">&nbsp;</a>
                    </div>
                    <div class="para" label-module="para">（6）代码具有较好的可移植性</div>
                    <div class="para" label-module="para">C语言是面向过程的编程语言，用户只需要关注所被解决问题的本身，而不需要花费过多的精力去了解相关硬件，且针对不同的硬件环境，在用C语言实现相同功能时的代码基本一致，不需或仅需进行少量改动便可完成移植，这就意味着，对于一台计算机编写的C程序可以在另一台计算机上轻松地运行，从而极大的减少了程序移植的工作强度。<sup class="sup--normal" data-sup="5" data-ctrmap=":5,">
                        [5]</sup><a class="sup-anchor" name="ref_[5]_1219">&nbsp;</a>
                    </div>
                    <div class="para" label-module="para">（7）可生成高质量、目标代码执行效率高的程序</div>
                    <div class="para" label-module="para">与其他高级语言相比，C语言可以生成高质量和高效率的目标代码，故通常应用于对<a target="_blank" href="https://baike.baidu.com/item/%E4%BB%A3%E7%A0%81%E8%B4%A8%E9%87%8F/8863758" data-lemmaid="8863758">代码质量</a>和执行效率要求较高的<a target="_blank" href="https://baike.baidu.com/item/%E5%B5%8C%E5%85%A5%E5%BC%8F%E7%B3%BB%E7%BB%9F/186978" data-lemmaid="186978">嵌入式系统</a>程序的编写。<sup class="sup--normal" data-sup="5" data-ctrmap=":5,">
                        [5]</sup><a class="sup-anchor" name="ref_[5]_1219">&nbsp;</a>
                    </div><div class="anchor-list ">
                    <a name="3_2" class="lemma-anchor para-title"></a>
                    <a name="sub1219_3_2" class="lemma-anchor "></a>
                    <a name="特有特点" class="lemma-anchor "></a>
                    <a name="3-2" class="lemma-anchor "></a>
                </div><div class="para-title level-3" label-module="para-title">
                    <h3 class="title-text"><span class="title-prefix">c语言</span>特有特点</h3>
                </div>
                    <div class="para" label-module="para">C语言是普适性最强的一种计算机程序编辑语言，它不仅可以发挥出高级编程语言的功用，还具有汇编语言的优点，因此相对于其它编程语言，它具有自己独特的特点。具体体现在以下三个方面：</div>
                    <div class="para" label-module="para">其一，广泛性。C 语言的运算范围的大小直接决定了其优劣性。C 语言中包含了34种运算符，因此运算范围要超出许多其它语言，此外其运算结果的表达形式也十分丰富。此外，C 语言包含了字符型、<a target="_blank" href="https://baike.baidu.com/item/%E6%8C%87%E9%92%88/2878304" data-lemmaid="2878304">指针</a>型等多种数据结构形式，因此，更为庞大的数据结构运算它也可以应付。<sup class="sup--normal" data-sup="3" data-ctrmap=":3,">
                        [3]</sup><a class="sup-anchor" name="ref_[3]_1219">&nbsp;</a>
                    </div>
                    <div class="para" label-module="para">其二，简洁性。9 类控制语句和32个<a target="_blank" href="https://baike.baidu.com/item/KEYWORDS/8284218" data-lemmaid="8284218">KEYWORDS</a>是C语言所具有的基础特性，使得其在计算机应用程序编写中具有广泛的适用性，不仅可以适用广大编程人员的操作，提高其工作效率，同 时还能够支持高级编程，避免了语言切换的繁琐。<sup class="sup--normal" data-sup="3" data-ctrmap=":3,">
                        [3]</sup><a class="sup-anchor" name="ref_[3]_1219">&nbsp;</a>
                    </div>
                    <div class="para" label-module="para">其三，结构完善。C语言是一种结构化语言，它可以通过组建模块单位的形式实现<a target="_blank" href="https://baike.baidu.com/item/%E6%A8%A1%E5%9D%97%E5%8C%96/3295536" data-lemmaid="3295536">模块化</a>的应用程序，在系统描述方面具有显著优势，同时这一特性也使得它能够适应多种不同的编程要求，且执行效率高。<sup class="sup--normal" data-sup="3" data-ctrmap=":3,">
                        [3]</sup><a class="sup-anchor" name="ref_[3]_1219">&nbsp;</a>
                    </div><div class="anchor-list ">
                    <a name="3_3" class="lemma-anchor para-title"></a>
                    <a name="sub1219_3_3" class="lemma-anchor "></a>
                    <a name="缺点" class="lemma-anchor "></a>
                    <a name="3-3" class="lemma-anchor "></a>
                </div><div class="para-title level-3" label-module="para-title">
                    <h3 class="title-text"><span class="title-prefix">c语言</span>缺点</h3>
                </div>
                    <div class="para" label-module="para">1. C语言的缺点主要表现在数据的封装性上，这一点使得C在数据的安全性上有很大缺陷，这也是C和C++的一大区别。</div>
                    <div class="para" label-module="para">2. C语言的语法限制不太严格，对变量的类型约束不严格，影响程序的安全性，对<a target="_blank" href="https://baike.baidu.com/item/%E6%95%B0%E7%BB%84%E4%B8%8B%E6%A0%87%E8%B6%8A%E7%95%8C">数组下标越界</a>不作检查等。从应用的角度，C语言比其他高级语言较难掌握。也就是说，对用C语言的人，要求对程序设计更熟练一些。<sup class="sup--normal" data-sup="7" data-ctrmap=":7,">
                        [7]</sup><a class="sup-anchor" name="ref_[7]_1219">&nbsp;</a>
                    </div><div class="anchor-list ">
                    <a name="4" class="lemma-anchor para-title"></a>
                    <a name="sub1219_4" class="lemma-anchor "></a>
                    <a name="语言组成" class="lemma-anchor "></a>
                </div><div class="para-title level-2" label-module="para-title">
                    <h2 class="title-text"><span class="title-prefix">c语言</span>语言组成</h2>
                    <a class="edit-icon j-edit-link" data-edit-dl="4" href="javascript:;" style="display: block;"><em class="cmn-icon wiki-lemma-icons wiki-lemma-icons_edit-lemma"></em>编辑</a>
                </div>
                    <div class="anchor-list ">
                        <a name="4_1" class="lemma-anchor para-title"></a>
                        <a name="sub1219_4_1" class="lemma-anchor "></a>
                        <a name="基本构成" class="lemma-anchor "></a>
                        <a name="4-1" class="lemma-anchor "></a>
                    </div><div class="para-title level-3" label-module="para-title">
                    <h3 class="title-text"><span class="title-prefix">c语言</span>基本构成</h3>
                </div>
                    <div class="para" label-module="para"><b>数据类型</b></div>
                    <div class="para" label-module="para">C的数据类型包括：<a target="_blank" href="https://baike.baidu.com/item/%E6%95%B4%E5%9E%8B">整型</a>、字符型、实型或<a target="_blank" href="https://baike.baidu.com/item/%E6%B5%AE%E7%82%B9%E5%9E%8B">浮点型</a>（单精度和双精度）、<a target="_blank" href="https://baike.baidu.com/item/%E6%9E%9A%E4%B8%BE%E7%B1%BB%E5%9E%8B">枚举类型</a>、数组类型、<a target="_blank" href="https://baike.baidu.com/item/%E7%BB%93%E6%9E%84%E4%BD%93%E7%B1%BB%E5%9E%8B">结构体类型</a>、共用体类型、指针类型和<a target="_blank" href="https://baike.baidu.com/item/%E7%A9%BA%E7%B1%BB%E5%9E%8B">空类型</a>。</div>
                    <div class="para" label-module="para"><b>常量与变量</b></div>
                    <div class="para" label-module="para"><a target="_blank" href="https://baike.baidu.com/item/%E5%B8%B8%E9%87%8F">常量</a>其值不可改变，符号常量名通常用大写。</div>
                    <div class="para" label-module="para"><a target="_blank" href="https://baike.baidu.com/item/%E5%8F%98%E9%87%8F/3956968" data-lemmaid="3956968">变量</a>是以某标识符为名字，其值可以改变的量。<a target="_blank" href="https://baike.baidu.com/item/%E6%A0%87%E8%AF%86%E7%AC%A6/7105638" data-lemmaid="7105638">标识符</a>是以字母或下划线开头的一串由字母、数字或下划线构成的序列，请注意第一个字符必须为字母或下划线，否则为不合法的变量名。变量在<a target="_blank" href="https://baike.baidu.com/item/%E7%BC%96%E8%AF%91/1258343" data-lemmaid="1258343">编译</a>时为其分配相应存储单元。</div>
                    <div class="para" label-module="para"><b>数组</b></div>
                    <div class="para" label-module="para">如果一个变量名后面跟着一个有数字的中括号，这个声明就是<a target="_blank" href="https://baike.baidu.com/item/%E6%95%B0%E7%BB%84">数组</a>声明。<a target="_blank" href="https://baike.baidu.com/item/%E5%AD%97%E7%AC%A6%E4%B8%B2">字符串</a>也是一种数组。它们以<a target="_blank" href="https://baike.baidu.com/item/ASCII">ASCII</a>的<a target="_blank" href="https://baike.baidu.com/item/NULL">NULL</a>作为数组的结束。要特别注意的是，中括号内的索引值是从0算起的。</div>
                    <div class="para" label-module="para"><b>指针</b></div>
                    <div class="para" label-module="para">如果一个<a target="_blank" href="https://baike.baidu.com/item/%E5%8F%98%E9%87%8F%E5%A3%B0%E6%98%8E">变量声明</a>时在前面使用 * 号，表明这是个指针型变量。换句话说，该变量存储一个地址，而 *（此处特指单目运算符 * ，下同。C语言中另有 双目运算符 *） 则是取内容操作符，意思是取这个内存地址里存储的内容。指针是 C 语言区别于其他同时代<a target="_blank" href="https://baike.baidu.com/item/%E9%AB%98%E7%BA%A7%E8%AF%AD%E8%A8%80">高级语言</a>的主要特征之一。</div>
                    <div class="para" label-module="para">指针不仅可以是变量的地址，还可以是<a target="_blank" href="https://baike.baidu.com/item/%E6%95%B0%E7%BB%84">数组</a>、数组元素、函数的地址。通过指针作为<a target="_blank" href="https://baike.baidu.com/item/%E5%BD%A2%E5%BC%8F%E5%8F%82%E6%95%B0">形式参数</a>可以在函数的调用过程得到一个以上的返回值，不同于return（z）这样的仅能得到一个返回值。</div>
                    <div class="para" label-module="para">指针是一把双刃剑，许多操作可以通过指针自然的表达，但是不正确的或者过分的使用指针又会给程序带来大量潜在的错误。</div>
                    <div class="para" label-module="para"><b>字符串</b></div>
                    <div class="para" label-module="para">C语言的字符串其实就是以'\0'字符结尾的char型数组，使用字符型并不需要引用库，但是使用字符串就需要C标准库里面的一些用于对字符串进行操作的函数。它们不同于字符数组。使用这些函数需要引用<a target="_blank" href="https://baike.baidu.com/item/%E5%A4%B4%E6%96%87%E4%BB%B6">头文件</a>&lt;string.h&gt;。</div>
                    <div class="para" label-module="para"><b>文件输入/输出</b></div>
                    <div class="para" label-module="para">在C语言中，输入和输出是经由标准库中的一组函数来实现的。在<a target="_blank" href="https://baike.baidu.com/item/ANSI%20C">ANSI C</a>中，这些函数被定义在头文件&lt;stdio.h&gt;；中。</div>
                    <div class="para" label-module="para">标准输入/输出</div>
                    <div class="para" label-module="para">有三个标准输入/输出是标准I/O库预先定义的：</div>
                    <div class="para" label-module="para"><a target="_blank" href="https://baike.baidu.com/item/stdin">stdin</a>标准输入</div>
                    <div class="para" label-module="para"><a target="_blank" href="https://baike.baidu.com/item/stdout">stdout</a>标准输出</div>
                    <div class="para" label-module="para"><a target="_blank" href="https://baike.baidu.com/item/stderr">stderr</a>输入输出错误</div>
                    <div class="para" label-module="para"><b>运算</b></div>
                    <div class="para" label-module="para">C语言的运算非常灵活，功能十分丰富，运算种类远多于其它<a target="_blank" href="https://baike.baidu.com/item/%E7%A8%8B%E5%BA%8F%E8%AE%BE%E8%AE%A1%E8%AF%AD%E8%A8%80">程序设计语言</a>。在表达式方面较其它程序语言更为简洁，如自加、自减、逗号运算和三目运算使表达式更为简单，但初学者往往会觉的这种表达式难读，关键原因就是对运算符和运算顺序理解不透不全。当多种不同运算组成一个运算表达式，即一个运算式中出现多种运算符时，运算的优先顺序和结合规则就会显得十分重要。</div><div class="anchor-list ">
                    <a name="4_2" class="lemma-anchor para-title"></a>
                    <a name="sub1219_4_2" class="lemma-anchor "></a>
                </div>
                </div>
            </div>
        </div>
        <footer class="footer mt-20" style="margin-top: 60px;">
            <div class="container">
                <nav class="footer-nav">
                    <a  href="http://www.h-ui.net/aboutHui.shtml">关于我们</a>
                    <span class="pipe">|</span>
                    <a  href="http://www.h-ui.net/copyright.shtml">软件著作权</a>
                    <span class="pipe">|</span>
                    <a  href="http://www.h-ui.net/juanzeng.shtml">感谢捐赠</a>
                </nav>
                <p>Copyright &copy;2013-2017 H-ui.net All Rights Reserved. <br>
                    <a rel="nofollow"  href="http://www.miitbeian.gov.cn/">京ICP备15015336号-1</a>
                    <br>
                    未经允许，禁止转载、抄袭、镜像<br>
                    用心做站，做不一样的站</p>
            </div>
        </footer>
    </div>
</div>
<!--普通弹出层-->
<div id="modal-demo" class="modal fade middle" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content radius">
            <div class="modal-header">
                <h3 class="modal-title">登陆窗口</h3>
                <a class="close" data-dismiss="modal" aria-hidden="true" href="javascript:void(0);">×</a>
            </div>
            <div class="modal-body">
                <div class="panel-body">
                    <form action="" method="post" class="form form-horizontal responsive" id="demoformLogin">
                        <div class="row cl">
                            <label class="form-label col-xs-3">账号：</label>
                            <div class="formControls col-xs-8">
                                <input type="text" class="input-text" placeholder="4~16个字符，字母/中文/数字/下划线" name="username" id="usernameLogin">
                            </div>
                        </div>
                        <div class="row cl">
                            <label class="form-label col-xs-3">密码：</label>
                            <div class="formControls col-xs-8">
                                <input type="password" class="input-text" autocomplete="off" placeholder="密码" name="password" id="passwordLogin">
                            </div>
                        </div>
                        <div class="row cl">
                            <div class="col-xs-8 col-xs-offset-3">
                                <input class="btn btn-primary" id="logSub" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<%--初始化分页插件数据信息--%>
<script type="text/javascript" src="${staticPath}/hui/lib/laypage/1.2/laypage.js"></script>
<script>
    var courseId = $("#courseId").val();
    $.getJSON('/comment/getCommentByCourseId', {curr: 1,limit:10,courseId:courseId,type:'1'}, function(res){ //从第6页开始请求。返回的json格式可以任意定义
        laypage({
            limit:10,
            cont: 'forPage', //容器。值支持id名、原生dom对象，jquery对象。【如该容器为】：&lt;div id="page1">&lt;/div>
            pages: res.pages, //通过后台拿到的总页数
            curr: 1, //初始化当前页
            jump: function(e){ //触发分页后的回调
                console.log(e);
                $.getJSON('/comment/getCommentByCourseId', {curr: e.curr,limit:e.limit,courseId:courseId,type:'1'}, function(res){
                    var zz = res.content;
                    var htmllet = "";
                    $("#commentList").html(htmllet);
                    createHtml(htmllet,zz,'commentList');
                });
                $('body,html').animate({
                        scrollTop: 0
                    },
                    500);
            }
        });
        var zz = res.content;
        var htmllet = "";
        $("#commentList").html(htmllet);
        createHtml(htmllet,zz,'commentList');
    });
    function createHtml(htmllet,zz,id) {
        for(var i = 0;i<zz.length;i++){
            console.log(zz[i].ccComment);
            htmllet += '<li class="item cl"> <a href="/showUserInfo?userId='+zz[i].userUId+'"><i class="avatar size-L radius"><img alt="" src="'+zz[i].userFile+'"></i></a>\n' +
                '                                    <div class="comment-main">\n' +
                '                                        <header class="comment-header">\n' +
                '                                            <div class="comment-meta"><a class="comment-author" href="/showUserInfo?userId='+zz[i].userUId+'">'+zz[i].userName+'</a> 评论于\n' +
                '                                                <time title="">'+zz[i].ccTime+'</time>\n' +
                '                                            </div>\n' +
                '                                        </header>\n' +
                '                                        <div class="comment-body">\n' +
                '                                            <p>'+zz[i].ccComment+'</p>\n' +
                '                                        </div>\n' +
                '                                    </div>\n' +
                '                                </li>';
        }
        $("#"+id).html(htmllet);
    }
</script>
<script>
    /*登陆按钮点击操作*/
    $(function(){
        $("#logSub").click(function () {
            var code = $("#usernameLogin").val();
            var pwd = $("#passwordLogin").val();
            debugger;
            $.ajax({
                url : "/user/userLogin",
                type : "post",
                data : {
                    code : code,
                    pwd : pwd
                },
                success : function(data) {
                    var aa = data.msg
                    if(aa == "success"){
                        $("#modal-demo").modal("hide");
                        //刷新当前页面
                        location.reload(true);
                    }else{
                        //弹出错误问题
                        alert("账号密码错误，登陆失败");
                    }
                }
            });
        })
    });
    $(function() {
        $('.maskWraper').Huihover();
        /* 计算输入域字体数量 */
        $(".textarea").Huitextarealength({
            minlength:10,
            maxlength:200.
        });
    });
    //星星评价效果
    $(function(){
        //星级评价
        $("#star-1").raty({
            hints: ['1','2', '3', '4', '5'],//自定义分数
            starOff: 'iconpic-star-S-default.png',//默认灰色星星
            starOn: 'iconpic-star-S.png',//黄色星星
            path: '${staticPath}/hui/static/h-ui/images/star',//可以是相对路径
            number: 5,//星星数量，要和hints数组对应
            showHalf: true,
            targetKeep : true,
            click: function (score, evt) {//点击事件
                //第一种方式：直接取值
                // $("#result-1").html(score+'分');
                $("#mySc").val(score);
            }
        });
    });
    //弹窗
    function modaldemo(){
        $("#modal-demo").modal("show");
    }
    //点击提交按钮触发对文章添加评论事件
    function alertMsg() {
        //判断当前用户是否是已登录的状态，不是的话弹出登陆框
        var userId = $("#userHiddenId").val();
        if(userId.length == 0){
            $("#modal-demo").modal("show");
            return;
        }else{
            var score = $("#mySc").val();
            var beizhu = $("#beizhu").val();
            var courseId = $("#courseId").val();
            alert(score+"------"+beizhu+"---"+courseId+"---"+userId);
            $.ajax({
                url : "/comment/addCourseComment",
                type : "post",
                data : {
                    cId:courseId,
                    ccUserId:userId,
                    ccScoure:score,
                    ccComment:beizhu,
                    ccType:'1'
                },
                success : function(data) {
                    var aa = data.msg
                    if(aa == "success"){
                        alert("评论成功");
                        //刷新当前页面
                        location.reload(true);
                    }else{
                        //弹出错误问题
                        alert("添加评论失败，联系管理员");
                    }
                }
            });
        }

    }
</script>
</body>
</html>
