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
  <%
  String loginError = request.getParameter("loginError")!=null ? request.getParameter("loginError") : "";
  %>
  <body>
    <div class="container-scroller">
      <div class="container-fluid page-body-wrapper full-page-wrapper">
        <div class="content-wrapper d-flex align-items-center auth">
          <div class="row flex-grow">
            <div class="col-lg-4 mx-auto">
              <div class="auth-form-light text-left p-5">
                <div class="brand-logo" style="text-align: center;">
                  <img src="../../../images/logo.png" style="width: 80%;">   
                </div>  
                <div style="text-align: center;">    
                	<p style="font-weight: bold; color: grey; "><i class="mdi mdi-account-key icon-lg"></i><br /> 관리자용 LOGIN</p>
                </div>
                <h6 class="font-weight-light"></h6>
                <form class="pt-3" action="../../adminLogin.do">
                  <div class="form-group">
                    <input type="email" class="form-control form-control-lg" id="exampleInputEmail1" name="email" placeholder="email">
                  </div>
                  <div class="form-group">
                    <input type="password" class="form-control form-control-lg" id="exampleInputPassword1" name="pass" placeholder="Password">
                  </div>
                  <span style="color:red;font-size:1em;"><%=loginError %></span>
                  <div class="mt-3">
                    <button type="submit" class="btn btn-block btn-gradient-info btn-lg font-weight-medium auth-form-btn" >로그인</button>
                  </div>
                  <div class="my-2 d-flex justify-content-between align-items-center">
                    <!-- <div class="form-check">
                      <label class="form-check-label text-muted">
                        <input type="checkbox" class="form-check-input"> Keep me signed in </label>
                    </div> -->
                    <!-- <a href="#" class="auth-link text-black">Forgot password?</a> -->
                  </div>
                  <div class="mb-2">
                   <!--  <button type="button" class="btn btn-block btn-facebook auth-form-btn">
                       <i class="mdi mdi-facebook mr-2"></i>Connect using facebook </button>  -->
                  </div>
                  <div class="text-center mt-4 font-weight-light">계정이 없으신가요? <a href="register.do" class="text-primary">Create</a>
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