<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <% response.setContentType("text/html;charset=UTF-8"); %>
    <%@page import="java.util.Date" 
    		import="java.util.Calendar" 
    		import="java.text.SimpleDateFormat"
    		import="java.lang.Integer"
     %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
        <title>新建疑难解惑</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <script type="text/javascript" charset="utf-8" src="${ctx }/ueditor.config.js"></script>
        <script type="text/javascript" charset="utf-8" src="${ctx }/ueditor.all.min.js"> </script>
        <script type="text/javascript" charset="utf-8" src="${ctx }/lang/zh-cn/zh-cn.js"></script>
        <style type="text/css">
        div{
            width:100%;
        }
        </style>

        
        <!-- jQuery AND jQueryUI -->
        <script type="text/javascript" src="${ctx }/js/libs/jquery/1.6/jquery.min.js"></script>
        <script type="text/javascript" src="${ctx }/js/libs/jqueryui/1.8.13/jquery-ui.min.js"></script>
        

        <link rel="stylesheet" href="${ctx }/css/min.css" />
        <script type="text/javascript" src="${ctx }/js/min.js"></script>
        
    </head>
    <script type="text/javascript">
	
    
    
    
    //实例化编辑器
    //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
    var ue = UE.getEditor('editor');

	function tiJiao(){
		document.getElementById("answer").value = UE.getEditor('editor').getContentTxt();
		document.getElementById('biaoDan').submit();
	}
    function isFocus(e){
        alert(UE.getEditor('editor').isFocus());
        UE.dom.domUtils.preventDefault(e)
    }
    function setblur(e){
        UE.getEditor('editor').blur();
        UE.dom.domUtils.preventDefault(e)
    }
    function insertHtml() {
        var value = prompt('插入html代码', '');
        UE.getEditor('editor').execCommand('insertHtml', value)
    }
    function createEditor() {
        enableBtn();
        UE.getEditor('editor');
    }
    function getAllHtml() {
        alert(UE.getEditor('editor').getAllHtml())
    }
    function getContent() {
        var arr = [];
        arr.push("使用editor.getContent()方法可以获得编辑器的内容");
        arr.push("内容为：");
        arr.push(UE.getEditor('editor').getContent());
        alert(arr.join("\n"));
    }
    function getPlainTxt() {
        var arr = [];
        arr.push("使用editor.getPlainTxt()方法可以获得编辑器的带格式的纯文本内容");
        arr.push("内容为：");
        arr.push(UE.getEditor('editor').getPlainTxt());
        alert(arr.join('\n'))
    }
    function setContent(isAppendTo) {
        var arr = [];
        arr.push("使用editor.setContent('欢迎使用ueditor')方法可以设置编辑器的内容");
        UE.getEditor('editor').setContent('欢迎使用ueditor', isAppendTo);
        alert(arr.join("\n"));
    }
    function setDisabled() {
        UE.getEditor('editor').setDisabled('fullscreen');
        disableBtn("enable");
    }

    function setEnabled() {
        UE.getEditor('editor').setEnabled();
        enableBtn();
    }

    function getText() {
        //当你点击按钮时编辑区域已经失去了焦点，如果直接用getText将不会得到内容，所以要在选回来，然后取得内容
        var range = UE.getEditor('editor').selection.getRange();
        range.select();
        var txt = UE.getEditor('editor').selection.getText();
        alert(txt)
    }

    function getContentTxt() {
        var arr = [];
        arr.push("使用editor.getContentTxt()方法可以获得编辑器的纯文本内容");
        arr.push("编辑器的纯文本内容为：");
        arr.push(UE.getEditor('editor').getContentTxt());
        alert(arr.join("\n"));
    }
    function hasContent() {
        var arr = [];
        arr.push("使用editor.hasContents()方法判断编辑器里是否有内容");
        arr.push("判断结果为：");
        arr.push(UE.getEditor('editor').hasContents());
        alert(arr.join("\n"));
    }
    function setFocus() {
        UE.getEditor('editor').focus();
    }
    function deleteEditor() {
        disableBtn();
        UE.getEditor('editor').destroy();
    }
    function disableBtn(str) {
        var div = document.getElementById('btns');
        var btns = UE.dom.domUtils.getElementsByTagName(div, "button");
        for (var i = 0, btn; btn = btns[i++];) {
            if (btn.id == str) {
                UE.dom.domUtils.removeAttributes(btn, ["disabled"]);
            } else {
                btn.setAttribute("disabled", "true");
            }
        }
    }
    function enableBtn() {
        var div = document.getElementById('btns');
        var btns = UE.dom.domUtils.getElementsByTagName(div, "button");
        for (var i = 0, btn; btn = btns[i++];) {
            UE.dom.domUtils.removeAttributes(btn, ["disabled"]);
        }
    }

    function getLocalData () {
        alert(UE.getEditor('editor').execCommand( "getlocaldata" ));
    }

    function clearLocalData () {
        UE.getEditor('editor').execCommand( "clearlocaldata" );
        alert("已清空草稿箱")
    }
</script>
    <body>
        
        <script type="text/javascript" src="${ctx }/content/settings/main.js"></script>
		<link rel="stylesheet" href="${ctx }/content/settings/style.css" />
        <!--              
                HEAD
                        --> 
        <div id="head">
          
        </div>
        <!--            
                SIDEBAR
                         --> 
		<div id="sidebar">
            <ul>
                <li>
                    <a>
                        <img src="${ctx }/img/icons/menu/inbox.png" alt="" />
                        欢迎
                    </a>
                </li>
                <li><a href="#"><img src="${ctx }/img/icons/menu/layout.png" alt="" /> 新闻管理</a>
                    <ul>
                        <li><a href="${ctx }/news/list_gg">公告</a></li>
                        <li><a href="${ctx }/news/list_rd">热点</a></li>
                        <li><a href="${ctx }/news/list_gj">国外</a></li>
                        <li><a href="${ctx }/news/list_xn">校内</a></li>
                        <li><a href="${ctx }/formsXW.jsp?action='add'">添加新闻</a></li>
                        <li><a href="${ctx }/formLB.jsp">添加首页轮播图</a></li>
                    </ul>
                </li>
                <li><a href="#"><img src="${ctx }/img/icons/menu/brush.png" alt="" /> 信息管理</a>
                    <ul>
                        <li><a href="table.jsp?p=table">学生基本信息表</a></li>
                        <li><a href="table.jsp?p=table">奖学金申请表</a></li>
                        <li><a href="table.jsp?p=table">助学金申请表</a></li>
                        <li><a href="forms.jsp?p=forms">添加申请表</a></li>
                    </ul>
                </li>
                <li  class="current"><a href="#"><img src="${ctx }/img/icons/menu/factory.png" alt="" /> 疑难问题管理</a>
                    <ul>
                        <li><a href="${ctx}/ynjd/list?leiXing=新生专区">新生专区专区</a></li>
                        <li><a href="${ctx}/ynjd/list?leiXing=国外">国外专区</a></li>
                        <li><a href="${ctx}/ynjd/list?leiXing=新生">新生专区</a></li>
                        <li><a href="${ctx}/ynjd/list?leiXing=常见">常见问题专区</a></li>
                        <li class="current"><a href="${ctx}/formsYN.jsp">添加专区</a></li>
                    </ul>
                </li>
                <li><a href="#"><img src="${ctx }/img/icons/menu/lab.png" alt="" />学生管理</a>
                    <ul>
                        <li><a href="${ctx}/student/list_hg">韩国学生</a></li>
                        <li><a href="${ctx }/student/list_yn">印尼学生</a></li>
                        <li><a href="${ctx }/student/list_bx">巴西学生</a></li>
                        <li><a href="${ctx }/student/list_rb">日本学生</a></li>
                        <li><a href="${ctx }/formsXS.jsp">添加学生</a></li>
                     </ul>
                </li>
                <li><a href="#"><img src="${ctx }/img/icons/menu/flag.png" alt="" />定向消息</a>
                    <ul>
                        <li><a href="${ctx }/news/list_dxhg">韩国消息</a></li>
                        <li><a href="${ctx }/news/list_dxyn">印尼消息</a></li>
                        <li><a href="${ctx }/news/list_dxbx">巴西消息</a></li>
                        <li><a href="${ctx }/news/list_dxrb">日本消息</a></li>
                        <li><a href="${ctx}/formsDX.jsp">添加消息</a></li>
                     </ul>
                </li>
            </ul>
        </div>  
        <!--            
              CONTENT 
                        --> 
        <div id="content" class="white">
            <h1><img src="${ctx }/img/icons/posts.png" alt=""/> 疑难解答</h1>

	<div class="bloc">
	<div class="title">
        疑难解答
      </div>
   <div class="content">
   		<c:if test="${action!='edit' }">
		<form id="biaoDan" action="${ctx}/ynjd/add" method="post">
     <div class="content">
    </div> 
        <div class="input">
            <label for="input1">问题</label>
            <input type="text" name="question" id="input1" />
        </div>
        <br/>
        <br/>
    	<br/>
    <div class="input">
 
            <label for="label">指定推送模块</label>
			
            <!-- 默认选定属性 checked="checked" -->
            <input type="radio" name="leiXing" id="check1" value="常见"/> 
            <label class="inline">常见问题</label> 
            <input type="radio" name="leiXing" id="check2" value="国外"/>
            <label class="inline">国外专区</label> 
            <input type="radio" name="leiXing" id="check3" value="校内"/>
            <label class="inline">校内专区</label> 
            <input type="radio" name="leiXing" id="check4" value="新生"/>
            <label class="inline">新生专区</label> 
    </div>
    <br/>
    <br/>
    <br/>
    <br/>
    <br/>
    <div class="input">
    <label for="input3">内容</label>
    <script id="editor" name="answerURL" type="text/plain" style="width:1024px;height:500px;"></script>
    </div>
    <input type = "hidden" name="answer" id="neiRong"/>
 		<div id="btns">
    	<div>
        <button onclick="getAllHtml()">获得整个html的内容</button>
        <button onclick="getContent()">获得内容</button>
        <button onclick="setContent()">写入内容</button>
        <button onclick="setContent(true)">追加内容</button>
        <button onclick="getContentTxt()">获得纯文本</button>
        <button onclick="getPlainTxt()">获得带格式的纯文本</button>
        <button onclick="hasContent()">判断是否有内容</button>
        <button onclick="setFocus()">使编辑器获得焦点</button>
        <button onmousedown="isFocus(event)">编辑器是否获得焦点</button>
        <button onmousedown="setblur(event)" >编辑器失去焦点</button>
    </div>
    <div>
        <button onclick="getText()">获得当前选中的文本</button>
        <button onclick="insertHtml()">插入给定的内容</button>
        <button id="enable" onclick="setEnabled()">可以编辑</button>
        <button onclick="setDisabled()">不可编辑</button>
        <button onclick=" UE.getEditor('editor').setHide()">隐藏编辑器</button>
        <button onclick=" UE.getEditor('editor').setShow()">显示编辑器</button>
        <button onclick=" UE.getEditor('editor').setHeight(300)">设置高度为300默认关闭了自动长高</button>
    </div>
    <div>
        <button onclick="getLocalData()" >获取草稿箱内容</button>
        <button onclick="clearLocalData()" >清空草稿箱</button>
    </div>
</div>
<div>
    <button onclick="createEditor()">
    创建编辑器</button>
    <button onclick="deleteEditor()">
    删除编辑器</button>
</div>
        <div class="submit">
        <input type="button" value="新增" onclick="tiJiao();"/>
        </div>
        	</form>
			</c:if>
   <!-- *******************************edit********************************************** -->
        <c:if test="${action=='edit' }">
        <%session.setAttribute("action", "add");%>
	 <form id="biaoDan" action="${ctx }/ynjd/edit" method="post">	
     <div class="content">
     <div class="right">
    </div> 
    </div> 
        <div class="input">
            <label for="input1">标题</label>
            <input type="text" name="question" id="input1" value="${ynjd03.question}" />
            <input type="hidden" name="id_news"/>
        </div>
        <br/>
        <br/>
    <div class="input">
    </div>

    <br/>

    <div class="input">
 
            <label for="label">指定推送模块</label>
			<c:choose>
            <c:when test="${news03.leiXing=='常见'}">
            <input type="radio" id="check1" name="leiXing" value="常见" checked="checked"/> 
            	<label for="check1" class="inline">常见问题</label>	
            	 <input type="radio" id="check2" name="leiXing" value="国外" /> 
            	<label for="check2" class="inline">国外专区</label>	
            	<input type="radio" id="check3" name="leiXing" value="校内" /> 
            	<label for="check3" class="inline">校内专区</label>	
            	 <input type="radio" id="check4" name="leiXing" value="新生" /> 
            	<label for="check4" class="inline">新生专区</label>	
           </c:when>
           <c:when test="${news03.leiXing=='国外'}">
               <input type="radio" id="check1" name="leiXing" value="常见" /> 
            	<label for="check1" class="inline">常见问题</label>	
            	 <input type="radio" id="check2" name="leiXing" value="国外" checked="checked"/> 
            	<label for="check2" class="inline">国外专区</label>	
            	<input type="radio" id="check3" name="leiXing" value="新生" /> 
            	<label for="check3" class="inline">新生专区</label>	
            	 <input type="radio" id="check4" name="leiXing" value="新生" /> 
            	<label for="check4" class="inline">新生专区</label>	
            </c:when>
            <c:when test="${news03.leiXing=='新生'}">
             <input type="radio" id="check1" name="leiXing" value="常见" /> 
            	<label for="check1" class="inline">常见问题</label>	
            	 <input type="radio" id="check2" name="leiXing" value="国外" /> 
            	<label for="check2" class="inline">国外专区</label>	
            	<input type="radio" id="check3" name="leiXing" value="校内" checked="checked"/> 
            	<label for="check3" class="inline">校内专区</label>	
            	 <input type="radio" id="check4" name="leiXing" value="新生" /> 
            	<label for="check3" class="inline">新生专区</label>	
            </c:when>
            <c:when test="${news03.leiXing=='新生'}">
            <input type="radio" id="check1" name="leiXing" value="常见" /> 
            	<label for="check1" class="inline">常见问题</label>	
            	 <input type="radio" id="check2" name="leiXing" value="国外" /> 
            	<label for="check2" class="inline">国外专区</label>	
            	<input type="radio" id="check3" name="leiXing" value="校内" /> 
            	<label for="check3" class="inline">校内专区</label>	
            	 <input type="radio" id="check4" name="leiXing" value="新生"  checked="checked"/> 
            	<label for="check4" class="inline">新生专区</label>	
            </c:when>
            <c:otherwise>
             <input type="radio" id="check1" name="leiXing" value="常见" /> 
            	<label for="check1" class="inline">常见问题</label>	
            	 <input type="radio" id="check2" name="leiXing" value="国外" /> 
            	<label for="check2" class="inline">国外专区</label>	
            	<input type="radio" id="check3" name="leiXing" value="校内" /> 
            	<label for="check3" class="inline">校内专区</label>	
            	 <input type="radio" id="check4" name="leiXing" value="新生"  checked="checked"/> 
            	<label for="check4" class="inline">新生专区</label>	
            </c:otherwise>
            </c:choose>
    </div>
    <br/>
    <br/>
    <br/>
    <br/>
    <br/>
    <div class="input">
    <label for="input3">内容</label>
    <script id="editor" type="text/plain"  name="answerURL"style="width:1024px;height:500px;">${ynjd03.answerURL}</script>
    </div>
    	<input type ="hidden" name="answer" id="answer"/>
 		<div id="btns">
    	<div>
        <button onclick="getAllHtml()">获得整个html的内容</button>
        <button onclick="getContent()">获得内容</button>
        <button onclick="setContent()">写入内容</button>
        <button onclick="setContent(true)">追加内容</button>
        <button onclick="getContentTxt()">获得纯文本</button>
        <button onclick="getPlainTxt()">获得带格式的纯文本</button>
        <button onclick="hasContent()">判断是否有内容</button>
        <button onclick="setFocus()">使编辑器获得焦点</button>
        <button onmousedown="isFocus(event)">编辑器是否获得焦点</button>
        <button onmousedown="setblur(event)" >编辑器失去焦点</button>
    </div>
    <div>
        <button onclick="getText()">获得当前选中的文本</button>
        <button onclick="insertHtml()">插入给定的内容</button>
        <button id="enable" onclick="setEnabled()">可以编辑</button>
        <button onclick="setDisabled()">不可编辑</button>
        <button onclick=" UE.getEditor('editor').setHide()">隐藏编辑器</button>
        <button onclick=" UE.getEditor('editor').setShow()">显示编辑器</button>
        <button onclick=" UE.getEditor('editor').setHeight(300)">设置高度为300默认关闭了自动长高</button>
    </div>

    <div>
        <button onclick="getLocalData()" >获取草稿箱内容</button>
        <button onclick="clearLocalData()" >清空草稿箱</button>
    </div>
</div>
<div>
    <button onclick="createEditor()">
    创建编辑器</button>
    <button onclick="deleteEditor()">
    删除编辑器</button>
</div>
        <div class="submit">
        <input type="button" value="新增" onclick="tiJiao();"/>
        </div>  
        </form>
		</c:if>
		<!-- *************************/edit******************************************************* -->
    </div>
    </div>
</div>
    </body>
</html>