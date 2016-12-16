<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% response.setContentType("text/html;charset=UTF-8"); %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE HTML>
<html>
	<head>
		<title>文章内容页</title>
		<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
		<meta name="Viewport"content="width=device-width,initial-scale=1">
		<link rel="stylesheet" href="${ctx }/css/zui.css">
		<script src="${ctx }/js/jquery.mobile-1.4.5.min.js"></script>
		<script src="${ctx }/js/zui.lite.js"></script>
	</head>
	<body>
	  <article class="article">
  <header>
    <h1 class="text-center">${news05.biaoTi}</h1>
    <!--<dl class="dl-inline">
      <dt>来源：</dt>
      <dd>维基百科</dd>
      <dt>最后修订：</dt>
      <dd>2016年8月12日 (星期五) 12:53</dd>
      <dt></dt>
    </dl>
    <section class="abstract">
      <p><strong>摘要：</strong>HTML5是HTML最新的修订版本，2014年10月由万维网联盟（W3C）完成标准制定。目标是替换1999年所制定的HTML 4.01和XHTML 1.0标准，以期能在互联网应用迅速发展的时候，使网络标准达到匹配当代的网络需求。广义论及HTML5时，实际指的是包括HTML、CSS和JavaScript在内的一套技术组合。</p>
    </section>
  </header>-->
  <section class="content">
 	 ${news05.neiRongURL}
  <!-- 
    <p>HTML5是HTML最新的修订版本，2014年10月由<a href="https://zh.wikipedia.org/wiki/%E4%B8%87%E7%BB%B4%E7%BD%91%E8%81%94%E7%9B%9F" target="_blank">万维网联盟</a>（W3C）完成标准制定。目标是替换1999年所制定的HTML 4.01和XHTML 1.0标准，以期能在互联网应用迅速发展的时候，使网络标准达到匹配当代的网络需求。广义论及HTML5时，实际指的是包括HTML、CSS和JavaScript在内的一套技术组合。它希望能够减少网页浏览器对于需要插件的丰富性网络应用服务（Plug-in-Based Rich Internet Application，RIA），例如：AdobeFlash、Microsoft Silverlight与Oracle JavaFX的需求，并且提供更多能有效加强网络应用的标准集。</p>
    <blockquote>
      <p>具体来说，HTML5添加了许多新的语法特征，其中包括 元素，同时集成了SVG内容。这些元素是为了更容易的在网页中添加和处理多媒体和图片内容而添加的。其它新的元素如 则是为了丰富文档的数据内容。新的属性的添加也是为了同样的目的。同时也有一些属性和元素被移除掉了。一些元素，像被修改，重新定义或标准化了。同时APIs和DOM已经成为HTML5中的基础部分了。HTML5还定义了处理非法文档的具体细节，使得所有浏览器和客户端程序能够一致地处理语法错误。</p>
    </blockquote>
    <h2>发展历史</h2>
    <p>HTML 5草案的前身名为Web Applications 1.0，是在2004年由WHATWG提出。2008年1月22日，第一份正式草案发布。WHATWG表示该规范是目前仍在进行的工作，仍须多年的努力。[8]目前Mozilla Firefox、Google Chrome、Opera、Safari（版本4以上）、Internet Explorer（版本9以上）已支持HTML5技术。</p>
    <p>2014年10月28日，W3C正式发布HTML5.0推荐标准。</p>
    <img src="${ctx }/images/slide1.jpg" alt="">
     <h3>标准化进程</h3>
    <p>2004年6月，Mozilla基金会和Opera软件公司在万维网联盟（W3C）所主办的研讨会上提出了一份联合建议书，这份提案主要针对该技术能向下兼容浏览器的同时，也可以扩展更多新技术[17]，其中Web Forms 2.0初步规范草案被提出，但因W3C已着力于XHTML的发展，故此建议书于8票赞成，14票反对下被否决[18]，这引起部分人的不满，不久后，一些厂商宣布成立网页超文本技术工作小组（WHATWG）组织，以继续推动该规范的开发工作，该组织再度提出Web Applications 1.0规范草案，后来这两种规范逐渐合并成今天的HTML5。2007年，获得W3C接纳，并成立了新的HTML工作团队。</p>
    <h3>2014计划</h3>
    <p>2012年9月，W3C提出计划要在2014年底前发布一个HTML5推荐标准，并在2016年底前发布HTML5.1推荐标准。</p>
    <h4>核心HTML标准</h4>
    <p>HTML5.0，HTML5.1和HTML5.2的合并时间表：</p>
    <table>
      <thead>
        <tr>
          <th></th>
          <th>2012</th>
          <th>2013</th>
          <th>2014</th>
          <th>2015</th>
          <th>2016</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>HTML 5.0</td>
          <td>候选版</td>
          <td>征求评价</td>
          <td>推荐标准</td>
          <td></td>
          <td></td>
        </tr>
        <tr>
          <td>HTML 5.1</td>
          <td>第一工作草案</td>
          <td></td>
          <td>最后召集</td>
          <td>候选版</td>
          <td>推荐标准</td>
        </tr>
        <tr>
          <td>HTML 5.2</td>
          <td></td>
          <td></td>
          <td></td>
          <td>第一工作草案</td>
          <td></td>
        </tr>
      </tbody>
    </table>
     <h2>新应用程序接口（API）</h2>
    <p>除了原先的DOM接口，HTML5增加了更多样化的应用程序接口（API）：</p>
    <ul>
      <li>
        即时二维绘图
        <ul>
          <li>Canvas API：有关动态产出与渲染图形、图表、图像和动画的API</li>
        </ul>
      </li>
      <li>定时媒体播放</li>
      <li>离线存储数据库（离线网络应用程序）</li>
      <li>编辑</li>
      <li>拖放</li>
    </ul>-->
  </section>
  <footer>
     <p class="pull-right text-muted">未经允许不得转载</p>
    <p class="text-important">本文节选自河北师范大学国际合作处官方网站。</p>
   <!-- <ul class="pager pager-justify">
      <li class="next disabled"><a target="_blank" href="${ctx }/https://zh.wikipedia.org/wiki/Category:W3C%E6%A0%87%E5%87%86">W3C æ å <i class="icon-arrow-right"></i></a></li>
    </ul>-->
  </footer>
</article>
	</body>
</html>