<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title> ���������� </title>
</head>
<body>
${userInfo.name }��, �ȳ��ϼ���! </br>
<input type="button" value="���� �� �� Ȯ��" onclick="location.href='myPosts'"> </br>
<input type="button" value="��й�ȣ ����" onclick="location.href='../../member/modify'"> </br>
<input type="button" value="Ż���ϱ�" onclick="location.href='../../member/delete'">
</body>
</html>