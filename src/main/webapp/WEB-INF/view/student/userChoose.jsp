<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<c:choose>
    <c:when test="${userInfo.suRole == 1}">
        <li>
            <a href="/showUserInfo?userId=${userInfo.suUuid}" >个人信息</a>
        </li>
        <li>
            <a href="/toUserCoursePage" >我的订阅</a>
        </li>
        <li>
            <a href="/toMyBbsPage" >我的问题</a>
        </li>
        <li>
            <a href="/toMyWork" >我的作业</a>
        </li>
        <li>
            <a href="/toMyUserListPage" >我的好友</a>
        </li>
        <li>
            <a href="javascritp:;" onclick="loginOut()" >注销登陆</a>
        </li>
    </c:when>
    <c:otherwise>
        <li>
            <a href="/showUserInfo?userId=${userInfo.suUuid}" >个人信息</a>
        </li>
        <li>
            <a href="/toMyCoursePage" >课程列表</a>
        </li>
        <li>
            <a href="/toAddCoursePage" >课程发布</a>
        </li>
        <li>
            <a href="/toWorkPage" >作业管理</a>
        </li>
        <li>
            <a href="/toAddWorkPage" >作业发布</a>
        </li>
        <li>
            <a href="/toMyBbsPage" >问题管理</a>
        </li>
        <li>
            <a href="javascritp:;" onclick="loginOut()" >注销登陆</a>
        </li>
    </c:otherwise>
</c:choose>