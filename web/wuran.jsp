<%@page import="java.sql.ResultSet" %>
<%@ page import="Test.Dao.mapDao" %>
<%@ page import="Test.Pojo.Pic" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=1.3">
    </script>
    <title>河流污染举报系统</title>
    <link rel="shortcut icon" href="img/title.ico"/>
    <link href="css/wuranfenbu.css" type="text/css" rel="stylesheet"/>
</head>
<body style="margin-top: 0; margin-left: 0">
<jsp:include page="part/other.jsp"/>
<div class="first">
    <img src="img/logo.jpg">
</div>
<div class="second">
    <jsp:include page="part/navigation.jsp"/>
    <div class="second-right">
        <div id="menu">
            <div id="container"></div>
        </div>
    </div>
</div>
<div class="third">
    <jsp:include page="part/foot.jsp"/>
</div>
</body>
<script type="text/javascript">
    var map = new BMap.Map("container"); //在container容器中创建一个地图,参数container为div的id属性;
    map.addControl(new BMap.NavigationControl()); //初始化地图控件
    map.addControl(new BMap.ScaleControl());
    map.addControl(new BMap.OverviewMapControl());
    var point = new BMap.Point(113.663221, 34.7568711); //定位 ，实际应用时从配置参数中获取
    map.enableScrollWheelZoom(); //启用地图滚轮放大缩小
    map.centerAndZoom(point, 15);
    //其他坐标点
    var points = new Array();
    var personName = new Array();
    <%request.setCharacterEncoding("UTF-8");%>
    <%
    mapDao map = (mapDao) application.getAttribute("map");
    ResultSet res = map.query("select * from mappic");
    while (res.next()) {
        Pic a = new Pic();
        a.setLat(res.getString("lat"));
        a.setLog(res.getString("log"));
        a.setUrl(res.getString("url"));%>
    debugger
    points.push(new BMap.Point(<%=a.getLog()%>, <%=a.getLat()%>));
    personName.push('<img src="<%=a.getUrl()%>" style="width: 200px;height: 150px;">');
    <%}%>
    for (var i = 0; i < points.length; i++) {
        addMarker(i);
    }

    function addMarker(j) {
        var marker = new BMap.Marker(points[j]); // 创建标注
        map.addOverlay(marker);
        var opts = {
            width: 220, // 信息窗口宽度
            height: 180, // 信息窗口高度
            //title : deps[j]
            // 信息窗口标题
        }
        var infoWindow = new BMap.InfoWindow(personName[j], opts); // 创建信息窗口对象
        marker.addEventListener("click", function () {
            this.openInfoWindow(infoWindow);
        });
        //marker.enableDragging(); //标注可拖拽
    }
</script>
</html>