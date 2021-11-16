<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>




<div class="form-group">
                <label class="col-md-2 col-md-offset-2 control-label">驗證碼</label>
                <div class="col-md-3">
                    <div class="row_bj" style="width:100%;">
                        <input type="text" class="form-control" id="code" name="code" required placeholder="請輸入驗證碼">
                        <img alt="驗證碼" onclick = "this.src='/getCode?d='+new Date()*1" src="/getCode" style="margin-left:20px;"/>
                    </div>
                    <label class="control-label text-danger" id="code2">(驗證碼錯誤)</label>
                </div>
            </div>

</body>
</html>