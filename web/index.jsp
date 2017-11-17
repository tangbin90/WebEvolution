<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/11/17
  Time: 15:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>

<html>
  <head>
    <title>Welcome！I'm a baby web</title>
  </head>
  <body>
  Hello, I'm still young.<br/>
  现在时间为：<%= (new java.util.Date()).toString()%>
  <!--JSP中声明变量-->
  <%!int i = 0;%>
  <!--声明函数-->
  <%!public String f(int i) {
    if (i < 3)
     return "i小于3";
    else
    return "i大于等于3";
    }%>
  你的值是：<%= f(1)%><<br/>
  <!--使用Bean-->
  <jsp:useBean id="test" class="com.book.web.SimpleBean"/>
  <jsp:setProperty name="test" property="name" value="Baby"/>
  你叫什么：<jsp:getProperty name="test" property="name"/>
  <!--获取Session-->
  <%! int number = 0;
    synchronized void countPeople(){
        number++;
    }
    %>
  <%
    if(session.isNew()){
        countPeople();
        String str=String.valueOf(number);
        session.setAttribute("count", str);
        application.setAttribute("count",str);
    }
  %>
  <p>
    你是第<%=(String) application.getAttribute("count")%>个访问本网站的人。
  </p>
  <!--几个默认对象 application：应用启动的时候存在，应用停掉消失，用户在哥哥页面浏览都是这一个对象。
        pageContext范围局限在本页面内。
        Request从请求到页面之后。
        Session用户持续连接服务器的时间，连接断开则Session无效。
        -->
  </body>
</html>
