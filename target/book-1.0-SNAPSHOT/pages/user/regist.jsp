<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registierungsseite</title>
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
<%@include file="/pages/common/head.jsp"%>
	<script type="text/javascript">
		//页面加载完成之后
		$(function () {
			$("#code").blur(function (){
				var codeText = this.value;
				codeText = $.trim(codeText);
				if(codeText == null || codeText == ""){
					$("span.errorMsg").text("bitte code eingeben");

				}
			})

			$("#email").blur(function (){
				var emailText = this.value;
				var emailPatt = /^[a-z\d]+(\.[a-z\d]+)*@([\da-z](-[\da-z])?)+(\.{1,2}[a-z]+)+$/;
				if(!emailPatt.test(emailText)){
					$("span.errorMsg").text("ungültige Emailaddress！");
				}
			})

			$("#password").blur(function (){
				var password = this.value;
				var passwordPatt = /^\w{5,12}$/;
				if(!passwordPatt.test(password)){
					$("span.errorMsg").text("ungültiges Passwort!");
				}

			})

			$("#repwd").blur(function (){
				var repwdText = this.value;
				var passwordText = $("#password").val();
				if(repwdText != passwordText){

					$("span.errorMsg").text("Zwei Passworte nicht gleich！");

				}

			})

			$("#username").blur(function(){

				//获取用户名
				var username = this.value;

				// 2 ein Objekt mit regulären Ausdrücken erstellen
				var usernamePatt = /^\w{5,12}$/;
				// 3 die Testmethode zur Überprüfung
				if (!usernamePatt.test(username)){
					// 4 Ergebnisse zeigen
					$("span.errorMsg").text("ungültiger Name！");

			}
				else {
					$.getJSON("${pageScope.basePath}userServlet","action=ajaxExistsUsername&username=" + username, function (data) {
						if(data.existsUsername){
							$("span.errorMsg").text("Es gibt schon den Name！");
						} else {
							$("span.errorMsg").text("Der Name ist nutzbar！");
						}

					} )
				}
			})

			$("#code_img").click(function (){
				this.src = "${basePath}kaptcha.jpg?d=" + new Date();
			});

			//给注册绑定单击事件
			$("#sub_btn").click(function () {
				// 验证用户名:必须由字母，数字下划线组成，并且长度为 5 到 12 位
				// 1 den Inhalt in das Eingabefeld für den Benutzernamen abrufen
				var usernameText = $("#username").val();
				// 2 ein Objekt mit regulären Ausdrücken erstellen
				var usernamePatt = /^\w{5,12}$/;
				// 3 die Testmethode zur Überprüfung
				if (!usernamePatt.test(usernameText)){
					// 4 Ergebnisse zeigen
					$("span.errorMsg").text("ungültiger Name！");

					return false;

				}

				// 验证密码:必须由字母，数字下划线组成，并且长度为 5 到 12 位
				var passwordText = $("#password").val();
				// 2 ein Objekt mit regulären Ausdrücken erstellen
				var passwordPatt = /^\w{5,12}$/;
				// 3 die Testmethode zur Überprüfung
				if (!passwordPatt.test(passwordText)){
					// 4 Ergebnisse zeigen
					$("span.errorMsg").text("ungültiges Passwort！");

					return false;

				}

				// 验证确认密码:和密码相同
				var repwdText = $("#repwd").val();
				if(repwdText != passwordText){

					$("span.errorMsg").text("die zwei Passworte sind nicht gleich！");

					return false;

				}

				// 邮箱验证:xxxxx@xxx.com 验证码:现在只需要验证用户已输入。因为还没讲到服务器。验证码生成
				var emailText = $("#email").val();
				var emailPatt = /^[a-z\d]+(\.[a-z\d]+)*@([\da-z](-[\da-z])?)+(\.{1,2}[a-z]+)+$/;
				if(!emailPatt.test(emailText)){
					$("span.errorMsg").text("ungültige Emailaddress！");

					return false;
				}

				var codeText = $("#code").val();
				codeText = $.trim(codeText);
				if(codeText == null || codeText == ""){
					$("span.errorMsg").text("bitte Verifizierungscode eingeben！");

					return false;
				}





				$("span.errorMsg").text("");
			});

		});



		
	</script>
<style type="text/css">
.login_form{
	height:420px;
	margin-top: 25px;
}

</style>
</head>
<body>
		<div id="login_header">
			<img class="logo_img" alt="" src="static/img/logo.gif" >
		</div>
		
			<div class="login_banner">
			
				<div id="l_content">
					<span class="login_word">registieren</span>
				</div>
				
				<div id="content">
					<div class="login_form">
						<div class="login_box">
							<div class="tit">
								<h1>Mitglied werden</h1>
								<span class="errorMsg">
<%--									<%=request.getAttribute("msg")==null?"":request.getAttribute("msg")%>--%>
									${requestScope.msg}
								</span>
							</div>
							<div class="form">
								<form action="userServlet" method="post">
									<input type="hidden" name="action" value="regist" />
									<label >Name：    </label>
									<input class="itxt" type="text" placeholder="bitte Name eingeben"
										   value="${requestScope.username}"
										   autocomplete="off" tabindex="1" name="username" id="username" />
									<br />
									<br />
									<label>Passwort：</label>
									<input class="itxt" type="password" placeholder="bitte Passwort eingeben"
										   autocomplete="off" tabindex="1" name="password" id="password" />
									<br />
									<br />
									<label>Passwort：</label>
									<input class="itxt" type="password" placeholder="bitte Passwort noch mal eingeben"
										   autocomplete="off" tabindex="1" name="repwd" id="repwd" />
									<br />
									<br />
									<label>Email：   </label>
									<input class="itxt" type="text" placeholder="bitte Emailaddress eingeben"
										   value="${requestScope.email}"
										   autocomplete="off" tabindex="1" name="email" id="email" />
									<br />
									<br />
									Verifizierungscode：
									<input class="itxt" type="text" style="width: 80px;" name="code" id="code"/>
									<img id="code_img" alt="" src="kaptcha.jpg" style="float: right; margin-right: 40px; width: 80px; height: 40px;">
									<br />
									<br />
									<input type="submit" value="registieren" id="sub_btn" />
									
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