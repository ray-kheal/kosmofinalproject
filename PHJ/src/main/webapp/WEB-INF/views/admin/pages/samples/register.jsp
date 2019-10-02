<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Purple Admin</title>
    <!-- plugins:css -->
    <link rel="stylesheet" href="../../assets/vendors/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="../../assets/vendors/css/vendor.bundle.base.css">
    <!-- endinject -->
    <!-- Plugin css for this page -->
    <!-- End plugin css for this page -->
    <!-- inject:css -->
    <!-- endinject -->
    <!-- Layout styles -->
    <link rel="stylesheet" href="../../assets/css/style.css">
    <!-- End layout styles -->
    <link rel="shortcut icon" href="../../assets/images/favicon.png" />
  </head>
  
  <script>
  function sendIt() {
	  
	 if (f.email.value == "") {
			alert("이메일을 입력해주세요.");
			f.email.focus();
			return; 
		}
	  
	 //비밀번호 입력여부 체크
	if (f.pass1.value == "") {
		alert("비밀번호를 입력하지 않았습니다.")
		document.f.pass1.focus();
		return;
	}

	//비밀번호확인 공백체크
	if (f.pass2.value == "") {
		alert("비밀번호를 입력해주세요.")
		document.f.pass2.focus();
		
		return;
	}
	//비밀번호와 비밀번호 확인 일치여부 체크
	if (f.pass1.value != f.pass2.value) {
		alert("비밀번호가 일치하지 않습니다")
		document.f.user_pw2.value = ""
		document.f.user_pw2.focus();
		return;
	}
	
	f.action ="./adminRegist.do";
	alert("가입이 완료 되었습니다!")  
  }
  
  
  
  </script>
  <body>
    <div class="container-scroller">
      <div class="container-fluid page-body-wrapper full-page-wrapper">
        <div class="content-wrapper d-flex align-items-center auth">
          <div class="row flex-grow">
            <div class="col-lg-4 mx-auto">
              <div class="auth-form-light text-left p-5">
                <div class="brand-logo"> 
                  <img src="../../../images/logo.png"> 
                </div>
                <div style="text-align: center;">
                <!-- <h4>처음이신가요?</h4> -->
                <h6> <i class="mdi mdi-account-key"></i>&nbsp;&nbsp;관리자용 회원가입 </h6>
                <br />
                </div>
                <form  action="adminRegist.do" onsubmit="return sendIt();" name="f" method="post" >
                  <div class="form-group form-inline">
                  	<input type="hidden" name="membertype" id="membertype" value="master" />
                  	 <label for="name" class="col-sm-4 control-label"  >이름</label>
					 <div class="col-sm-8">                  	 
                    <input type="text" class="form-control form-control-lg" name="name" id="name" placeholder="이름">
                  </div>
                  </div>
                  <div class="form-group form-inline">
                  <label for="email" class="col-sm-4 control-label">이메일</label>
                  <div class="col-sm-8">
                    <input type="email" class="form-control form-control-lg" name="email" id="email" placeholder="이메일">
                  </div>
                  </div>
                  <div class="form-group form-inline"> 
                  <label for="email" class="col-sm-4 control-label">비밀번호</label>
                   <div class="col-sm-8">
                    <input type="password" class="form-control form-control-lg"  name="pass1"  id="pass1" placeholder="비밀번호">
                  </div>
                  </div>
                  <div class="form-group form-inline">
                  <label for="email" class="col-sm-4 control-label">비밀번호확인</label>
                   <div class="col-sm-8">
                    <input type="password" class="form-control form-control-lg"  name="pass2"  id="pass2" placeholder="비밀번호확인">
                  </div>
                  </div>
                  <div class="form-group form-inline">
                   <label for="phone_num" class="col-sm-4 control-label">전화번호</label>
                   <div class="col-sm-8">
                    <input type="tel" class="form-control form-control-lg" name="mobile" id="mobile"  placeholder="전화번호">
                  </div>
                  </div>
                  <div class="mb-4">
                    <div class="form-check">  
                      <label class="form-check-label text-muted">
                        <input type="checkbox" class="form-check-input"> I agree to all Terms & Conditions </label>
                    </div>
                  </div>
                  <div class="mt-3">
                    <button type="submit"  class="btn btn-block btn-gradient-info btn-lg font-weight-medium auth-form-btn" >SIGN UP</button>
                  </div>
                  <div class="text-center mt-4 font-weight-light"> Already have an account? <a href="login.do" class="text-primary">Login</a>
                  </div>
                </form>  
                
              </div>
            </div>
          </div>
        </div>
        <!-- content-wrapper ends -->
      </div>
      <!-- page-body-wrapper ends -->
    </div>
    <!-- container-scroller -->
    <!-- plugins:js -->
    <script src="../../assets/vendors/js/vendor.bundle.base.js"></script>
    <!-- endinject -->
    <!-- Plugin js for this page -->
    <!-- End plugin js for this page -->
    <!-- inject:js -->
    <script src="../../assets/js/off-canvas.js"></script>
    <script src="../../assets/js/hoverable-collapse.js"></script>
    <script src="../../assets/js/misc.js"></script>
    <!-- endinject -->
  </body>
</html>