<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   
<body>
		<div class="row-chat">
			<div class="box-chat">
				<c:forEach var="send" items="${boxchat}">
					<c:choose>
						<c:when test="${send.senduserid  == user.userid}">
							<div class="receiveuser">
								<div class="profile">
									<c:out value="${send.sendusername}" />
								</div>
								<div class="action-chat">
									<p>${send.datemsg}</p>
								</div>
								<div class="reply-chat">
									<p>${send.content}</p>
								</div>
							</div>
						</c:when>
						<c:otherwise>
							<div class="senduser">
								<div class="profile">
									<c:out value="${send.sendusername}" />
								</div>
								<div class="action-chat">
									<p>${send.datemsg}</p>
								</div>
								<div class="reply-chat">
									<p>${send.content}</p>
								</div>
							</div>
						</c:otherwise>
					</c:choose>

				</c:forEach>
			</div>
		</div>
<div class="chat-input">
  <form action="${receiveuserid}" id="user-input-form" modelAttribute="urlboxchat" method="POST" autocomplete="off">
    <input type="text" id="user-input" name="user-input" class="user-input" placeholder="Talk about your thinking" autocomplete="off">
  </form>
</div>


<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script type="text/javascript" src="resources/js/chatting.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>
</body>