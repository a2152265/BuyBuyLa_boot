
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- header -->
<%@ include file="../Home/manager/datatable/header-forum.jspf"%>
<!-- sidebar -->
<%@ include file="../Home/manager/footer.jspf"%>
<!-- 通知欄 -->
<section class="page-content">

	
	<div class="wrapper">
		<div class="section">
			<h2>BuyBuyLa討論區管理</h2><br>
			<button type="button" style="margin-left: 200px"
				class="btn btn-primary" data-bs-toggle="modal"
				data-bs-target="#ManagerModal">發起公告</button>
			<table id="forum" class="display" style="width: 100%">
				<thead>
					<tr>
						<th>編號</th>
						<th>發表人</th>
						<th>標籤</th>
						<th>標題</th>
						<th>時間</th>
						<th>管理</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="content" items="${content}">
						<tr>
							<td><c:out value="${content.id}" /></td>
							<td><c:out value="${content.userName}" /></td>
							<td><c:out value="${content.tag}" /></td>
							<td><a style='color:black' href="<c:url value='/detailed' />?id=${content.id}"><c:out
										value="${content.title}" /></a></td>
							<td><c:out value="${content.date}" /></td>
							<td>


								<div class="modal fade" id="ManagerModal" tabindex="-1"
									aria-labelledby="exampleModalLabel" aria-hidden="true">
									<div class="modal-dialog modal-xl">
										<form:form method='POST'
											modelAttribute="managerAddForumContentBean"
											class='form-horizontal' enctype="multipart/form-data">
											<div class="modal-content">
												<div class="modal-header">
<!-- 													<h3 class="modal-title" id="exampleModalLabel">發起公告</h3> -->
															<select id="insSelectTag" class="form-select"
																aria-label="Default select example">
																<option>官方最新公告</option>
															</select>
																<div style="display: flex">
															<div class="form-check"
																style="margin-top: 6px; margin-left: 400px">
																<input class="form-check-input" type="checkbox"
																	id="insFlexCheckDefault"> <label
																	class="form-check-label" for="flexCheckDefault">
																	置頂 </label>
															</div>
														</div>
													<button type="button" class="btn-close"
														data-bs-dismiss="modal" aria-label="Close"></button>
												</div>
												<div class="modal-body insContentBody">

													<!-- 發起公告 -->
													<form:input path="tag" type="hidden" id="insTag" />
													<form:textarea path="content"
														class="managerAddContent display-none" />
													<form:input path="date" type="hidden" id="nowDate" />
													<form:input path="messageQty" type="hidden" value="0" />
													<form:input path="viewQty" type="hidden" value="0" />
													<form:input path="likeQty" type="hidden" value="0" />
													<form:input path="picId" class="form-control" type="hidden"
														value="${loginSession.id}" />
													<form:input path="userName" type="hidden"
														value="${loginSession.userName}" />
													<form:input path="userEmail" type="hidden"
														value="${loginSession.userEmail}" />
													<form:input path="userNickname" type="hidden"
														value="${loginSession.userNickname}" />
													<form:input path="Identification" type="hidden"
														value="${loginSession.identification}" />
													<form:input path="topArticle" type="hidden"
														class="insTopArticle" value="general" />
													<!-- 結束 -->
													<div class="mb-3">
														<form:input type="text" path="title" required="true"
															placeholder="標題" class="form-control title-fontsize managerTitleKeyInput"
															aria-label="Sizing example input" value=""
															aria-describedby="inputGroup-sizing-lg" />
														<br>
														<div id="managerAddSummernote"></div>
													</div>
												</div>
												<div class="modal-footer">
										<input type='button' class='btn btn-warning addManagerNewForumKeyInput' value='一鍵輸入'>
													<button id="managerInsSubmit" type="submit"
														class="btn btn-primary">送出</button>
													<button type="button" class="btn btn-secondary"
														data-bs-dismiss="modal">取消</button>
												</div>
											</div>
										</form:form>
									</div>
								</div> <!-- Modal -->

								<div class="modal fade" id="managerMessage" tabindex="-1"
									aria-labelledby="exampleModalLabel" aria-hidden="true">
									<div class="modal-dialog modal-xl">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title managerMessageTitle"
													id="exampleModalLabel"></h5>
												<button type="button" class="btn-close"
													data-bs-dismiss="modal" aria-label="Close"></button>
											</div>
											<div class="modal-body">

												<table id="message" class="display" style="width: 100%">
													<thead>
														<tr>
															<th>評論編號</th>
															<th>會員名稱</th>
															<th>會員信箱</th>
															<th>留言內容</th>
															<th>時間</th>
															<th>管理</th>
														</tr>
													</thead>
													<tbody id="messageResult"></tbody>
												</table>


											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-secondary"
													data-bs-dismiss="modal">Close</button>
											</div>
										</div>
									</div>
								</div>




								<button type="button" class="btn btn-info updateDataBtn"
									data-id="${content.id}" data-bs-toggle="modal"
									data-bs-target="#UpdateModal">編輯</button>
								<div class="modal fade" id="UpdateModal" tabindex="-1"
									aria-labelledby="exampleModalLabel" aria-hidden="true">
									<div class="modal-dialog modal-lg">
										<form:form method='POST'
											modelAttribute="managerEditForumContentBean"
											class='form-horizontal' enctype="multipart/form-data">
											<div class="modal-content">
												<div class="modal-header">
<!-- 													<h3 class="modal-title" id="exampleModalLabel">管理員編輯</h3> -->
														<div style="display: flex;">
															<select id="updSelectTag" class="form-select"
																aria-label="Default select example">
																<option>社團精選話題</option>
																<option>官方最新公告</option>
																<option>新手賣家發問</option>
																<option>賣家閒聊討論</option>
															</select>
															<div class="form-check"
																style="margin-top: 6px; margin-left: 400px">
																<input class="form-check-input" type="checkbox"
																	id="editFlexCheckDefault"> <label
																	class="form-check-label" for="flexCheckDefault">
																	置頂 </label>
															</div>
														</div>
													<button type="button" class="btn-close"
														data-bs-dismiss="modal" aria-label="Close"></button>
												</div>
												<div class="modal-body updContentBody">
													<!-- 隱藏 -->
													<form:input path="id" id="updid" type="hidden" />
													<form:input path="tag" id="updTag" type="hidden" />
													<form:textarea path="content"
														class="updManagerContent display-none" />
													<form:input path="date" id="nowUpdDate" type="hidden" />

													<form:input path="messageQty" class="editMessageQty"
														type="hidden" />
													<form:input path="viewQty" class="editViewQty"
														type="hidden" />
													<form:input path="likeQty" class="editLikeQty"
														type="hidden" />

													<form:input path="picId" class="picId" type="hidden"
														value="${loginSession.id}" />
													<form:input path="userName" class="userName" type="hidden"
														value="${loginSession.userName}" />
													<form:input path="userEmail" class="userEmail"
														type="hidden" value="${loginSession.userEmail}" />
													<form:input path="userNickname" class="userNickname"
														type="hidden" value="${loginSession.userNickname}" />
													<form:input path="Identification" type="hidden"
														value="${loginSession.identification}" />
													<form:input path="topArticle" class="editTopArticle"
														type="hidden" />
													<!-- 結束 -->
													<div class="mb-3">
														<form:input type="text" required="true" placeholder="標題"
															path="title" class="form-control title-fontsize editManagerTitleKeyInput"
															aria-label="Sizing example input"
															aria-describedby="inputGroup-sizing-lg" />
														<br>

														<div id="editesummernote"></div>
														<div class="mb-3"></div>
													</div>
												</div>
												<div class="modal-footer">
												<input type="button" class="editManagerNewForumKeyInput btn btn-warning" value="一鍵輸入">
													<button id="updSubmit" type="submit"
														class="btn btn-primary updManagerSubmit">送出</button>
													<button type="button" class="btn btn-secondary"
														data-bs-dismiss="modal">取消</button>
												</div>
											</div>
										</form:form>
									</div>
								</div>
								<button type="button" class="btn btn-danger"
									onclick="if(window.confirm('確定刪除?')) location.href='<c:url value='/manager/delete32?id=${content.id}'/>' ">刪除</button>
								<button class="btn btn-primary managerCrudBtn"
									data-bs-toggle="modal" data-bs-target="#managerMessage">評論管理</button>

							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<br><br><br>
			<hr>
			<h1>評論檢舉</h1>
			<table id="messageReport" class="display" style="width: 100%">
				<thead>
					<tr>
						<th style="display:none">檢舉編號</th>
						<th>文章編號</th>
						<th>評論編號</th>
						<th>檢舉人</th>
						<th>被檢舉人</th>
						<th style="display:none">被檢舉人信箱</th>
						<th>原因</th>
						<th>內容</th>
						<th>日期</th>
						<th>受理狀態</th>
						<th>管理</th>
					</tr>
				</thead>
					<c:forEach items="${reportMessage}" var="reportList">
						<tr>
							<td class="reportId" style="display:none">${reportList.reportId}</td>
							<td class="reportForumId">${reportList.reportForumId}</td>
							<td class="reportMessageId">${reportList.reportMessageId}</td>
							<td class="reportUserName">${reportList.reportUserName}</td>
							<td class="reportedUserName">${reportList.reportedUserName}</td>
							<td class="reportedUserEmail" style="display:none">${reportList.reportedUserEmail}</td>
							<td class="reportReason">${reportList.reportReason}</td>
							<td class="reportContent">${reportList.reportContent}</td>
							<td class="reportDate">${reportList.reportDate}</td>
							<td class="reportStatus">${reportList.reportStatus}</td>
							<td>
							<input type="button" class="btn btn-secondary ignore" value="忽略">
							<input type="button" class="btn btn-danger warning" value="刪除此評論">
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<input type="button"class="btn btn-info clear"  value="清除" style="float:right;margin-right:200px">
			<br><br><br><br>
		</div>
	</div>

</section>

	
	<!-- jquery -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>
	<script src='../js/forum_32/forum_jquery_32.js'></script>
	<!-- summernote -->
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
	<script src='../js/forum_32/forum_summernote_32.js'></script>
	