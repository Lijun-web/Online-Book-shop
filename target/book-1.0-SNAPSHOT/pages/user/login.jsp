<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Anmeldungsseite</title>
	<style type="text/css">
		label{
			/*居中对齐*/
			display: inline-block;
			width:87px;
			height: 40px;
			line-height: 40px;
			text-align: justify;
			text-align-last: justify;
		}
	</style>
	<%--	静态 包含base标签，css样式，jQuery文件--%>
	<%@include file="/pages/common/head.jsp"%>
	<script type="text/javascript" src="static/script/jquery-1.7.2.js"></script>
	<script type="text/javascript">
		//页面加载完成后
		$(function (){
			//给登录绑定单击事件
			$("#sub_btn").click(function (){
				//验证用户名是否合法
				//1 获取用户名输入框中文本
				var usernameText = $("#username").val();
				//2 创建正则表达式
				var usernamePatt = /^\w{5,12}$/;
				//Test方法验证
				if(!usernamePatt.test(usernameText)){
				//显示结果
					$("span.errorMsg").text("ungültiger Name！");
					return false
				}

				//验证密码是否合法
				//1 获取密码
				var passwordText = $("#password").val();
				//2 正则表达式
				var passwordPatt = /^\w{5,12}$/;
				//3 test验证
				if(!passwordPatt.test(passwordText)){
				//4 显示信息
					$("span.errorMsg").text("ungültiges Passwort！");
					return false
				}

				$("span.errorMsg").text("Bitte Name und Passwort eingeben");
			});
		});


	</script>
</head>
<body>
		<div id="login_header">
			<img class="logo_img" alt="" src="static/img/logo.gif" >
		</div>
		
			<div class="login_banner">
			
				<div id="l_content">
					<span class="login_word">anmelden</span>
				</div>
				
				<div id="content">
					<div class="login_form">
						<div class="login_box">
							<div class="tit">
								<h1>Mitglied</h1>
								<a href="pages/user/regist.jsp">registieren</a>
							</div>
							<div class="msg_cont">
								<b></b>
								<span class="errorMsg">
<%--									<%=request.getAttribute("msg")==null?"请输入用户名和密码":request.getAttribute("msg")%>--%>
									${ empty requestScope.msg ? "Bitte Name und Passwort eingeben":requestScope.msg}
								</span>
							</div>
							<div class="form">
								<form action="userServlet" method="post">
									<input type="hidden" name="action" value="login" />
									<label>Name：</label>
									<input class="itxt" type="text" placeholder="bitte Name eingeben"
										   autocomplete="off" tabindex="1" name="username"
											value="${requestScope.username}"/>
									<br />
									<br />
									<label>Passwort：</label>
									<input class="itxt" type="password" placeholder="bitte Passwort eingeben"
										   autocomplete="off" tabindex="1" name="password" />
									<br />
									<br />
									<input type="submit" value="anmelden" id="sub_btn" />
								</form>
							</div>
							
						</div>
					</div>
				</div>
			</div>

		<%--	静态包含页脚内容--%>
		<%@include file="/pages/common/footer.jsp"%>
</body>
</html>