<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商品管理</title>
<link rel='stylesheet' href='../../css/manageHome.css' />
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<style>
#myInput {
  background-image: url('/css/searchicon.png'); /* Add a search icon to input */
  background-position: 10px 12px; /* Position the search icon */
  background-repeat: no-repeat; /* Do not repeat the icon image */
  width: 50%; /* Full-width */
  font-size: 16px; /* Increase font-size */
  padding: 12px 20px 12px 40px; /* Add some padding */
  border: 1px solid #ddd; /* Add a grey border */
  margin-bottom: 12px; /* Add some space below the input */
}

#myTable {
  border-collapse: collapse; /* Collapse borders */
  width: 50%; /* Full-width */
  border: 1px solid #ddd; /* Add a grey border */
  font-size: 14px; /* Increase font-size */
  margin:auto;
  font-family: "微軟正黑體";
  font-weight: bolder;
            
}

#myTable th, #myTable td {
  text-overflow:ellipsis; 
  white-space:nowrap;
  word-wrap:break-word; 
  text-align: center; /* Left-align text */
  padding: 12px; /* Add padding */
}

#myTable tr {
  /* Add a bottom border to all table rows */
  border-bottom: 1px solid #ddd;
}

#myTable tr.header, #myTable tr:hover {
  /* Add a grey background color to the table header and on hover */
  background-color: #ECF5FF;
}
 .btn-outline-primary {
  color:lightblue;
  background-color: #fff;
  border-color: lightblue;
  width:130px;
  height:50px;
}
  .btn-outline-primary:hover, .btn-outline-primary:focus, .btn-outline-primary:active:hover{
  color: #fff;
  background-color:lightblue;
  border-color: lightblue;
}


.page-content {
  position: relative;
  left: var(--page-header-width);
  width: calc(100% - var(--page-header-width));
  min-height: 100vh;
  padding: 30px;
  color: var(--page-content-txtColor);
  background: var(--page-content-bgColor);
}

.search-and-user {
  display: grid;
  grid-template-columns: 1fr auto;
  grid-column-gap: 50px;
  align-items: center;
  background: var(--page-content-bgColor);
  margin-bottom: 30px;
}

.search-and-user form {
  position: relative;
}

.search-and-user [type="search"] {
  width: 100%;
  height: 50px;
  font-size: 1.5rem;
  padding-left: 15px;
  background: var(--page-content-blockColor);
  color: var(--white);
  border-radius: var(--border-radius);
  box-shadow: var(--box-shadow);
}

.search-and-user ::placeholder {
  color: var(--page-content-txtColor);
}

.search-and-user form svg {
  width: 26px;
  height: 26px;
  fill: var(--page-content-txtColor);
}

.search-and-user form button {
  position: absolute;
  top: 50%;
  right: 15px;
  transform: translateY(-50%);
}

.search-and-user .admin-profile {
  display: flex;
  align-items: center;
}

.search-and-user .admin-profile .greeting {
  margin: 0 10px 0 20px;
}

.search-and-user .admin-profile svg {
  width: 30px;
  height: 30px;
}

.search-and-user .admin-profile .notifications {
  position: relative;
}

.search-and-user .admin-profile .badge {
  display: flex;
  align-items: center;
  justify-content: center;
  position: absolute;
  top: -10px;
  right: -3px;
  width: 18px;
  height: 18px;
  border-radius: 50%;
  font-size: 10px;
  color: var(--white);
  background: var(--red);
}

.page-content .grid {
  display: grid;
  grid-template-columns: repeat(2, 1fr);
  grid-gap: 30px;
}

/* .page-content .grid > article { */
/*   display: flex; */
/*   height: 300px; */
/*   background: var(--page-content-blockColor); */
/*   border-radius: var(--border-radius); */
/*   box-shadow: var(--box-shadow); */
/* } */

/* .page-content .grid > article:first-child, */
/* .page-content .grid > article:last-child { */
/*   grid-column: 1 / -1; */
/* } */

.table-wrapper {
					min-width: 1000px;
					background: #fff;
					padding: 20px;
					box-shadow: 0 1px 1px rgba(0,0,0,.05);
				}

	.table-responsive {
					margin: 30px 0;
				}
				
				
@import url(https://fonts.googleapis.com/css?family=Roboto:700);


.button {
  background: #3D4C53;
  margin : 20px 5px 20px 0;
  width : 200px;
  height : 40px;
  overflow: hidden;
  text-align : center;
  transition : .2s;
  cursor : pointer;
  border-radius: 3px;
  box-shadow: 0px 1px 2px rgba(0,0,0,.2);
  
}
.btnTwo {
  position : relative;
  width : 200px;
  height : 150px;
  margin-top: -100px;
  padding-top: 2px;
  background : #26A69A;
  left : -250px;
  transition : .3s;
}
.btnText {
  color : white;
  transition : .3s;
  margin-top: 10px;
}
.btnText2 {
  margin-top : 78px;
  margin-right : -130px;
  color : #FFF;
}
.button:hover .btnTwo{ /*When hovering over .button change .btnTwo*/
  left: -130px;
}
.button:hover .btnText{ /*When hovering over .button change .btnText*/
  margin-left : 65px;
}
.button:active { /*Clicked and held*/
  box-shadow: 0px 5px 6px rgba(0,0,0,0.3);
}

.link{
margin:70px;
color:white;
}

.link:hover{
color:lightblue;
font-size:17px
}

/*大頭貼*/
.profile{
  margin-top:-40px;
  margin-bottom:-20px;
  text-align: center;
}

 .profile img{
  display: block;
  width: 100px;
  height: 100px;
    border-radius: 50%;
  margin: 0 auto;
}

 .profile h3{
  color: #ffffff;
  margin: 10px 0 5px;
}

 .profile p{
  color: rgb(206, 240, 253);
  font-size: 14px;
}
 
</style>
	<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.css">
 	<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.js"></script>
</head>

<body>
 <svg style="display:none;">
  <symbol id="logo" viewBox="0 0 140 59">
    <g>
      <path d="M6.8 57c0 .4-.1.7-.2.9-.1.2-.3.4-.4.5-.1.1-.4.199-.5.3-.2 0-.3.1-.5.1-.1 0-.3 0-.5-.1-.2 0-.4-.101-.5-.3-.2 0-.4-.2-.5-.4-.1-.2-.2-.5-.2-.9V44.7h-2c-.3 0-.6-.101-.8-.2-.2-.1-.3-.2-.5-.4s-.2-.3-.2-.4v-.4c0-.1 0-.2.1-.399 0-.2.1-.301.2-.4.1-.1.3-.3.5-.4.1 0 .4-.1.7-.1h2.1v-3.5c0-1 .1-1.9.3-2.7C4.1 35 4.5 34.3 5 33.7c.5-.6 1.1-1.1 1.9-1.4.8-.3 1.7-.5 2.7-.5.9 0 1.5.101 1.8.4.3.3.5.6.5 1.1 0 .3-.1.601-.3.9-.2.3-.6.4-1.2.4h-.6c-.6 0-1.1.101-1.5.301-.4.199-.7.5-.9.8C7.2 36 7 36.5 7 37c-.1.5-.1 1-.1 1.6V42h2.7c.3 0 .6.1.8.2.2.1.3.2.5.399.1.101.2.301.2.401 0 .2.1.3.1.4 0 .1 0 .3-.1.399 0 .2-.1.3-.2.4-.1.1-.3.3-.5.399-.2.101-.5.2-.8.2H6.8V57z" />
      <path d="M30.4 50.2c0 1.3-.2 2.5-.7 3.5-.5 1.1-1.1 2-1.9 2.8-.8.8-1.8 1.4-2.8 1.8-1.1.4-2.3.601-3.5.601-1.3 0-2.4-.2-3.5-.601-1.1-.399-2-1-2.8-1.8-.8-.8-1.4-1.7-1.9-2.8-.5-1.101-.7-2.2-.7-3.5s.2-2.4.7-3.5c.5-1.101 1.1-2 1.9-2.7.8-.8 1.7-1.4 2.8-1.8 1.1-.4 2.3-.601 3.5-.601 1.3 0 2.4.2 3.5.601 1.1.399 2 1 2.8 1.8.8.8 1.4 1.7 1.9 2.7.5 1.1.7 2.3.7 3.5zm-3.4 0c0-.8-.1-1.5-.4-2.3-.2-.7-.6-1.4-1.1-1.9s-1-1-1.7-1.3c-.7-.3-1.5-.5-2.4-.5s-1.7.2-2.4.5-1.3.8-1.7 1.3c-.5.5-.8 1.2-1.1 1.9-.2.699-.4 1.5-.4 2.3s.1 1.5.4 2.3c.2.7.6 1.4 1.1 1.9.5.6 1 1 1.7 1.3s1.5.5 2.4.5 1.7-.2 2.4-.5 1.3-.8 1.7-1.3c.5-.601.8-1.2 1.1-1.9.3-.7.4-1.5.4-2.3z" />
      <path d="M38.1 44.8h.1c.4-.899 1-1.7 1.9-2.3s1.8-.9 2.9-.9c.5 0 1 .101 1.3.301.4.199.6.6.6 1.1 0 .6-.2 1-.6 1.2-.4.2-.8.3-1.4.3h-.2c-1.3 0-2.4.5-3.2 1.4-.8.899-1.3 2.3-1.3 4.1v7c0 .4-.1.7-.2.9-.1.199-.3.399-.4.5-.2.1-.4.199-.5.3-.2 0-.3.1-.5.1-.1 0-.3 0-.5-.1-.2 0-.4-.101-.5-.3-.1-.2-.3-.301-.4-.5C35 57.7 35 57.4 35 57V43.5c0-.4.1-.7.2-.9.1-.199.3-.399.4-.5.2-.1.3-.199.5-.199s.3-.101.5-.101c.1 0 .3 0 .4.101.2 0 .3.1.5.199.2.101.3.301.4.5.1.2.2.5.2.9v1.3z" />
      <path d="M49.2 51.3c0 .7.2 1.4.5 2 .3.601.7 1.2 1.2 1.601.5.5 1.1.8 1.7 1.1s1.3.4 2 .4c1 0 1.8-.2 2.5-.5.7-.4 1.2-.801 1.8-1.2.2-.2.4-.3.6-.4.2-.301.3-.301.5-.301.4 0 .7.1 1 .4.3.199.4.6.4 1 0 .1 0 .3-.1.5s-.2.4-.4.7c-1.6 1.7-3.7 2.5-6.3 2.5-1.3 0-2.4-.199-3.5-.6s-2-1-2.8-1.8c-.8-.8-1.4-1.7-1.8-2.7-.4-1.1-.7-2.3-.7-3.6 0-1.301.2-2.5.6-3.5.4-1.101 1-2 1.8-2.801.8-.8 1.7-1.399 2.7-1.8 1-.399 2.2-.6 3.4-.6 2.1 0 3.8.6 5.2 1.8s2.3 2.9 2.6 5.2c0 .3.1.5.1.6v.5c0 1.101-.6 1.7-1.7 1.7H49.2V51.3zm9.9-2.5c0-.7-.1-1.3-.3-1.8-.2-.6-.5-1.1-.9-1.5s-.9-.7-1.4-1c-.6-.2-1.2-.4-2-.4-.7 0-1.4.101-2 .4-.6.2-1.2.6-1.6 1-.5.4-.8.9-1.1 1.5-.3.6-.5 1.2-.5 1.8h9.8z" />
      <path d="M77.9 55.1c.399-.3.8-.5 1.199-.5.4 0 .7.101 1 .4.2.3.4.6.4.9 0 .199 0 .5-.1.699a1.856 1.856 0 01-.599.701c-.7.5-1.399.9-2.3 1.2s-1.8.4-2.7.4c-1.3 0-2.5-.2-3.5-.601-1.1-.399-2-1-2.8-1.8s-1.4-1.7-1.8-2.7c-.4-1.1-.7-2.3-.7-3.6s.2-2.5.7-3.601c.4-1.1 1.1-2 1.8-2.8.8-.8 1.7-1.399 2.8-1.8 1.101-.4 2.2-.6 3.5-.6.9 0 1.7.1 2.601.399C78.2 42 79 42.4 79.6 43l.7.7c.101.2.2.5.2.7 0 .399-.1.8-.4 1-.3.3-.6.399-1 .399-.199 0-.399 0-.5-.1-.2-.099-.4-.199-.7-.499-.301-.3-.7-.5-1.2-.7s-1-.3-1.7-.3c-.9 0-1.6.2-2.3.5s-1.2.8-1.7 1.3-.8 1.2-1.1 1.9c-.2.699-.4 1.5-.4 2.3s.1 1.5.3 2.2c.2.699.6 1.3 1 1.899.5.5 1 1 1.7 1.3.7.301 1.4.5 2.3.5.7 0 1.3-.1 1.8-.3.4-.099.9-.299 1.3-.699z" />
      <path d="M94.6 56.2h-.1c-.6.899-1.4 1.6-2.3 2.1-.9.5-2 .7-3.3.7-.7 0-1.301-.1-2-.3-.7-.2-1.4-.5-1.9-.9-.6-.399-1.1-.899-1.4-1.6-.4-.7-.6-1.5-.6-2.4 0-1.3.3-2.2 1-3 .7-.7 1.6-1.3 2.7-1.7 1.1-.399 2.3-.6 3.7-.699 1.399-.101 2.8-.2 4.199-.2v-.5c0-1.2-.399-2.101-1.1-2.7s-1.7-.9-3-.9c-.7 0-1.4.101-2 .301-.6.199-1.3.5-1.9 1-.3.199-.699.3-1 .3-.3 0-.6-.101-.899-.4-.2-.2-.4-.6-.4-.899 0-.2.101-.5.2-.7s.3-.4.6-.601c.7-.5 1.601-1 2.5-1.3 1-.3 2-.5 3.2-.5s2.2.2 3.101.5c.899.3 1.6.8 2.199 1.4.601.6 1 1.3 1.301 2.1.3.8.399 1.601.399 2.5V56.9c0 .3-.1.6-.2.899-.1.201-.2.401-.4.501-.2.101-.3.2-.5.2s-.3.1-.4.1c-.1 0-.3 0-.399-.1-.2 0-.301-.1-.5-.2-.201-.1-.301-.3-.401-.5s-.2-.5-.2-.899v-.7h-.2zm-.9-5.5c-.8 0-1.7 0-2.5.1-.9.101-1.7.2-2.4.4s-1.3.5-1.8.9-.7 1-.7 1.7c0 .5.101.9.3 1.2.2.3.5.6.801.8.3.2.699.4 1.1.4.4.1.8.1 1.2.1 1.5 0 2.7-.5 3.5-1.399.8-.9 1.2-2.101 1.2-3.5v-.9h-.7v.199z" />
      <path d="M111.4 45.4c-.5-.5-1-.801-1.5-1-.5-.2-1.101-.301-1.601-.301-.399 0-.7 0-1.1.101-.4.1-.7.2-1 .399-.3.2-.5.4-.7.7s-.3.601-.3 1c0 .7.3 1.2.899 1.601.601.3 1.601.6 2.801.899.8.2 1.5.4 2.199.7.7.3 1.301.6 1.801 1s.899.8 1.199 1.4c.301.5.4 1.199.4 1.899 0 1-.2 1.8-.6 2.5-.4.7-.9 1.2-1.5 1.7-.601.4-1.301.7-2.101.9-.8.199-1.6.3-2.399.3-1 0-2-.2-2.9-.5-1-.3-1.8-.8-2.5-1.4-.3-.3-.5-.5-.6-.7-.098-.198-.098-.398-.098-.598 0-.4.101-.8.4-1 .3-.3.6-.4 1-.4.399 0 .8.2 1.2.5.5.5 1.1.801 1.699 1.101.601.3 1.2.399 1.9.399.4 0 .8 0 1.2-.1.399-.1.7-.2 1-.4.3-.199.6-.399.8-.699.2-.301.3-.7.3-1.2 0-.8-.399-1.3-1.1-1.7s-1.8-.7-3.2-1c-.6-.1-1.1-.3-1.7-.5-.6-.2-1.1-.5-1.6-.8s-.8-.8-1.101-1.3c-.3-.5-.399-1.2-.399-2 0-.9.2-1.601.5-2.301.401-.6.801-1.2 1.401-1.6.601-.4 1.2-.7 2-.9.7-.199 1.5-.3 2.301-.3.899 0 1.699.101 2.6.4.8.3 1.6.7 2.2 1.2.3.3.5.5.6.699.101.2.101.4.101.601 0 .399-.101.7-.4 1s-.6.399-1 .399c-.402-.199-.802-.399-1.102-.699z" />
      <path d="M126 58.4c-.6.3-1.3.399-2.1.399-1.601 0-2.801-.399-3.601-1.3s-1.2-2.2-1.2-3.9v-9H117.2c-.3 0-.601 0-.8-.1-.2-.1-.4-.2-.5-.3-.101-.101-.2-.3-.2-.4 0-.2-.101-.3-.101-.399 0-.101 0-.2.101-.4 0-.2.1-.3.2-.4.1-.1.3-.3.5-.399.199-.101.5-.2.8-.2h1.899v-3.2c0-.399.101-.7.2-.899.101-.2.3-.4.4-.601.2-.1.399-.2.5-.3.2 0 .3-.1.5-.1.1 0 .3 0 .5.1.2 0 .3.1.5.3.2.101.3.3.399.601.101.199.2.6.2.899V42h3.2c.3 0 .6.1.8.2.2.1.3.2.5.399.102.101.202.301.202.401 0 .2.1.3.1.4 0 .1 0 .3-.1.399 0 .2-.1.3-.2.4-.1.1-.3.3-.5.3-.2.1-.5.1-.8.1h-3.2V53.2c0 1 .2 1.7.5 2.1.4.4.8.601 1.4.601.2 0 .5 0 .7-.101.199-.1.399-.1.6-.1.4 0 .7.1.9.399.199.301.3.601.3.9s-.101.5-.2.7c0 .401-.2.601-.5.701z" />
      <path d="M133.2 44.8h.1c.4-.899 1-1.7 1.9-2.3.899-.6 1.8-.9 2.899-.9.5 0 1 .101 1.301.301.4.199.6.599.6 1.099 0 .6-.2 1-.6 1.2-.4.2-.801.3-1.4.3h-.2c-1.3 0-2.399.5-3.2 1.4-.8.899-1.3 2.3-1.3 4.1v7c0 .4-.1.7-.2.9-.1.199-.3.399-.399.5-.101.1-.4.199-.5.3-.2 0-.3.1-.5.1-.101 0-.3 0-.5-.1-.2 0-.4-.101-.5-.3-.2-.101-.3-.301-.4-.5-.1-.2-.2-.5-.2-.9V43.5c0-.4.101-.7.2-.9.101-.199.3-.399.4-.5.2-.1.3-.199.5-.199s.3-.101.5-.101c.1 0 .3 0 .399.101.2 0 .301.1.5.199.2.101.301.301.4.5.1.2.2.5.2.9v1.3z" />
    </g>
    <g>
      <g>
        <path fill="#08A6DF" d="M70 32.9c-9.1 0-16.5-7.4-16.5-16.5 0-4.8 2.1-9.3 5.7-12.4.5-.4 1.2-.4 1.6.1.4.5.4 1.2-.1 1.6-3.1 2.7-4.9 6.6-4.9 10.7 0 7.8 6.4 14.2 14.2 14.2s14.2-6.4 14.2-14.2c0-7.8-6.4-14.1-14.2-14.1-1.9 0-3.7.4-5.4 1.1-.6.2-1.3 0-1.5-.6-.2-.6 0-1.3.6-1.5C65.7.4 67.8 0 70 0c9.1 0 16.5 7.4 16.5 16.5S79.1 32.9 70 32.9z" />
      </g>
      <g>
        <path fill="#7C2A8A" d="M70 28.4c-6.6 0-11.9-5.4-11.9-11.9 0-6.6 5.4-11.9 11.9-11.9 5 0 9.5 3.2 11.2 7.9.5 1.3.7 2.6.7 4 0 .6-.5 1.1-1.101 1.1-.6 0-1.1-.5-1.1-1.1 0-1.1-.2-2.2-.601-3.3-1.399-3.8-5-6.4-9.1-6.4-5.3 0-9.6 4.3-9.6 9.6s4.3 9.6 9.6 9.6c.6 0 1.1.5 1.1 1.1.002.8-.498 1.3-1.098 1.3z" />
      </g>
      <g>
        <path fill="#EC1848" d="M70 23.9c-4.1 0-7.4-3.3-7.4-7.4s3.3-7.4 7.4-7.4c.6 0 1.1.5 1.1 1.1 0 .6-.5 1.1-1.1 1.1-2.8 0-5.1 2.3-5.1 5.1s2.3 5.1 5.1 5.1 5.1-2.3 5.1-5.1c0-.6.5-1.1 1.101-1.1.6 0 1.1.5 1.1 1.1.099 4.2-3.201 7.5-7.301 7.5z" />
      </g>
    </g>
  </symbol>
  <symbol id="down" viewBox="0 0 16 16">
    <polygon points="3.81 4.38 8 8.57 12.19 4.38 13.71 5.91 8 11.62 2.29 5.91 3.81 4.38" />
  </symbol>
  <symbol id="users" viewBox="0 0 16 16">
    <path d="M8,0a8,8,0,1,0,8,8A8,8,0,0,0,8,0ZM8,15a7,7,0,0,1-5.19-2.32,2.71,2.71,0,0,1,1.7-1,13.11,13.11,0,0,0,1.29-.28,2.32,2.32,0,0,0,.94-.34,1.17,1.17,0,0,0-.27-.7h0A3.61,3.61,0,0,1,5.15,7.49,3.18,3.18,0,0,1,8,4.07a3.18,3.18,0,0,1,2.86,3.42,3.6,3.6,0,0,1-1.32,2.88h0a1.13,1.13,0,0,0-.27.69,2.68,2.68,0,0,0,.93.31,10.81,10.81,0,0,0,1.28.23,2.63,2.63,0,0,1,1.78,1A7,7,0,0,1,8,15Z" />
  </symbol>
  <symbol id="collection" viewBox="0 0 16 16">
    <rect width="7" height="7" />
    <rect y="9" width="7" height="7" />
    <rect x="9" width="7" height="7" />
    <rect x="9" y="9" width="7" height="7" />
  </symbol>
  <symbol id="charts" viewBox="0 0 16 16">
    <polygon points="0.64 7.38 -0.02 6.63 2.55 4.38 4.57 5.93 9.25 0.78 12.97 4.37 15.37 2.31 16.02 3.07 12.94 5.72 9.29 2.21 4.69 7.29 2.59 5.67 0.64 7.38" />
    <rect y="9" width="2" height="7" />
    <rect x="12" y="8" width="2" height="8" />
    <rect x="8" y="6" width="2" height="10" />
    <rect x="4" y="11" width="2" height="5" />
  </symbol>
  <symbol id="comments" viewBox="0 0 16 16">
    <path d="M0,16.13V2H15V13H5.24ZM1,3V14.37L5,12h9V3Z" />
    <rect x="3" y="5" width="9" height="1" />
    <rect x="3" y="7" width="7" height="1" />
    <rect x="3" y="9" width="5" height="1" />
  </symbol>
  <symbol id="pages" viewBox="0 0 16 16">
    <rect x="4" width="12" height="12" transform="translate(20 12) rotate(-180)" />
    <polygon points="2 14 2 2 0 2 0 14 0 16 2 16 14 16 14 14 2 14" />
  </symbol>
  <symbol id="appearance" viewBox="0 0 16 16">
    <path d="M3,0V7A2,2,0,0,0,5,9H6v5a2,2,0,0,0,4,0V9h1a2,2,0,0,0,2-2V0Zm9,7a1,1,0,0,1-1,1H9v6a1,1,0,0,1-2,0V8H5A1,1,0,0,1,4,7V6h8ZM4,5V1H6V4H7V1H9V4h1V1h2V5Z" />
  </symbol>
  <symbol id="trends" viewBox="0 0 16 16">
    <polygon points="0.64 11.85 -0.02 11.1 2.55 8.85 4.57 10.4 9.25 5.25 12.97 8.84 15.37 6.79 16.02 7.54 12.94 10.2 9.29 6.68 4.69 11.76 2.59 10.14 0.64 11.85" />
  </symbol>
  <symbol id="settings" viewBox="0 0 16 16">
    <rect x="9.78" y="5.34" width="1" height="7.97" />
    <polygon points="7.79 6.07 10.28 1.75 12.77 6.07 7.79 6.07" />
    <rect x="4.16" y="1.75" width="1" height="7.97" />
    <polygon points="7.15 8.99 4.66 13.31 2.16 8.99 7.15 8.99" />
    <rect x="1.28" width="1" height="4.97" />
    <polygon points="3.28 4.53 1.78 7.13 0.28 4.53 3.28 4.53" />
    <rect x="12.84" y="11.03" width="1" height="4.97" />
    <polygon points="11.85 11.47 13.34 8.88 14.84 11.47 11.85 11.47" />
  </symbol>
  <symbol id="options" viewBox="0 0 16 16">
    <path d="M8,11a3,3,0,1,1,3-3A3,3,0,0,1,8,11ZM8,6a2,2,0,1,0,2,2A2,2,0,0,0,8,6Z" />
    <path d="M8.5,16h-1A1.5,1.5,0,0,1,6,14.5v-.85a5.91,5.91,0,0,1-.58-.24l-.6.6A1.54,1.54,0,0,1,2.7,14L2,13.3a1.5,1.5,0,0,1,0-2.12l.6-.6A5.91,5.91,0,0,1,2.35,10H1.5A1.5,1.5,0,0,1,0,8.5v-1A1.5,1.5,0,0,1,1.5,6h.85a5.91,5.91,0,0,1,.24-.58L2,4.82A1.5,1.5,0,0,1,2,2.7L2.7,2A1.54,1.54,0,0,1,4.82,2l.6.6A5.91,5.91,0,0,1,6,2.35V1.5A1.5,1.5,0,0,1,7.5,0h1A1.5,1.5,0,0,1,10,1.5v.85a5.91,5.91,0,0,1,.58.24l.6-.6A1.54,1.54,0,0,1,13.3,2L14,2.7a1.5,1.5,0,0,1,0,2.12l-.6.6a5.91,5.91,0,0,1,.24.58h.85A1.5,1.5,0,0,1,16,7.5v1A1.5,1.5,0,0,1,14.5,10h-.85a5.91,5.91,0,0,1-.24.58l.6.6a1.5,1.5,0,0,1,0,2.12L13.3,14a1.54,1.54,0,0,1-2.12,0l-.6-.6a5.91,5.91,0,0,1-.58.24v.85A1.5,1.5,0,0,1,8.5,16ZM5.23,12.18l.33.18a4.94,4.94,0,0,0,1.07.44l.36.1V14.5a.5.5,0,0,0,.5.5h1a.5.5,0,0,0,.5-.5V12.91l.36-.1a4.94,4.94,0,0,0,1.07-.44l.33-.18,1.12,1.12a.51.51,0,0,0,.71,0l.71-.71a.5.5,0,0,0,0-.71l-1.12-1.12.18-.33a4.94,4.94,0,0,0,.44-1.07l.1-.36H14.5a.5.5,0,0,0,.5-.5v-1a.5.5,0,0,0-.5-.5H12.91l-.1-.36a4.94,4.94,0,0,0-.44-1.07l-.18-.33L13.3,4.11a.5.5,0,0,0,0-.71L12.6,2.7a.51.51,0,0,0-.71,0L10.77,3.82l-.33-.18a4.94,4.94,0,0,0-1.07-.44L9,3.09V1.5A.5.5,0,0,0,8.5,1h-1a.5.5,0,0,0-.5.5V3.09l-.36.1a4.94,4.94,0,0,0-1.07.44l-.33.18L4.11,2.7a.51.51,0,0,0-.71,0L2.7,3.4a.5.5,0,0,0,0,.71L3.82,5.23l-.18.33a4.94,4.94,0,0,0-.44,1.07L3.09,7H1.5a.5.5,0,0,0-.5.5v1a.5.5,0,0,0,.5.5H3.09l.1.36a4.94,4.94,0,0,0,.44,1.07l.18.33L2.7,11.89a.5.5,0,0,0,0,.71l.71.71a.51.51,0,0,0,.71,0Z" />
  </symbol>
  <symbol id="collapse" viewBox="0 0 16 16">
    <polygon points="11.62 3.81 7.43 8 11.62 12.19 10.09 13.71 4.38 8 10.09 2.29 11.62 3.81" />
  </symbol>
  <symbol id="search" viewBox="0 0 16 16">
    <path d="M6.57,1A5.57,5.57,0,1,1,1,6.57,5.57,5.57,0,0,1,6.57,1m0-1a6.57,6.57,0,1,0,6.57,6.57A6.57,6.57,0,0,0,6.57,0Z" />
    <rect x="11.84" y="9.87" width="2" height="5.93" transform="translate(-5.32 12.84) rotate(-45)" />
  </symbol>
</svg>
<header class="page-header">
  <nav>
    <a href="#0" aria-label="forecastr logo" class="logo">
      <svg width="140" height="49">
        <use xlink:href="/image/BuyBuyLa.jsp"></use>
      </svg>
    </a>
    <button class="toggle-mob-menu" aria-expanded="false" aria-label="open menu">
      <svg width="20" height="20" aria-hidden="true">
        <use xlink:href="#down"></use>
      </svg>
    </button>
    <ul class="admin-menu">
      <li class="menu-heading">
      
      
       <div class="profile">
             <!--    <img src="https://i.ytimg.com/vi/LMu_WwyqZJI/maxresdefault.jpg" alt="profile_picture">  --> 
                <!-- 讀取圖片 -->
               <img  src="<c:url value='/getPicturefromMember/${memberUiDefault.id}'/>"   alt="profile_picture" />
                <h3></h3>
                <p>您好! &nbsp; 管理員${memberUiDefault.userEmail}</p><br>
        </div>
            
      </li>
      <li>
        <a href="<c:url value='/' />">
          <svg>
            <use xlink:href="#appearance"></use>
          </svg>
          <span>回首頁</span>
        </a>
      </li>
      <li>
        <a href="<c:url value='/manager_Ui' />">
          <svg>
            <use xlink:href="#users"></use>
          </svg>
          <span>會員資料管理</span>
        </a>
      </li>
      <li>
        <a href="<c:url value='/manage/products/待審核' />">
          <svg>
            <use xlink:href="#pages"></use>
          </svg>
          <span>商品管理</span>
        </a>
      </li>
      <li>
        <a href="<c:url value='/recordManage' />">
          <svg>
            <use xlink:href="#pages"></use>
          </svg>
          <span>購物紀錄管理</span>
        </a>
      </li>
        <li>
        <a href="<c:url value='/refundManage' />">
          <svg>
            <use xlink:href="#pages"></use>
          </svg>
          <span>退款管理</span>
        </a>
      </li>
      <li>
        <a href="../../admincampaign">
          <svg>
            <use xlink:href="#collection"></use>
          </svg>
          <span>活動管理</span>
        </a>
      </li>
      <li>
        <a href="<c:url value='/manager/forum' />">
          <svg>
            <use xlink:href="#comments"></use>
          </svg>
          <span>動態管理</span>
        </a>
      </li>
      <li>
        <div class="switch">
          <input type="checkbox" id="mode"style="-webkit-appearance: none; position: absolute;left: -9999px;" checked>
          <label for="mode">
            <span></span>
            <span>暗黑模式</span>
          </label>
        </div>
        <button class="collapse-btn" aria-expanded="true" aria-label="collapse menu">
          <svg aria-hidden="true">
            <use xlink:href="#collapse"></use>
          </svg>
          <span>全螢幕</span>
        </button>
      </li>
    </ul>
  </nav>
</header>
<section class="page-content">


   <!-- title -->
   <div style="background-color:white; padding:30px">
    	<h1 style="font-size:50px; text-align:center;">管理者中心</h1>
   </div>
  <section class="search-and-user">

  </section>

	<div style="width: 100%; display:flex;">
     <div style="width: 900px; background-color:#fff ;">
  		<canvas id="myChart" ></canvas>
		<h3 style="text-align: center;">商品類別</h3>
		<h3 style="text-align: center;">${allProduct}</h3>
	</div>		
	<div style="width: 500px; margin-left: 20px; background-color:#fff;	">
  		<canvas id="myChart1" ></canvas>
  		<h3 style="text-align: center;">賣家商品數量</h3>
	</div>
	<div style="width: 665px; margin-left: 20px; background-color:#fff;	">
  		<div style="width: 500px; margin-left: 70px; background-color:#fff;	">
  		<canvas id="myChart2"  ></canvas>
  		<h3 style="text-align: center;">商品狀態</h3>
	</div>
	</div>
	</div>




    <div class="table-responsive" >
	<div class="table-wrapper">
	  <div style="background-color:#242e42; width:650px ; padding:10px;"  >
	<a class="link"  id="uncheck" href="<c:url value='/manage/products/待審核 ' />">待審核</a>
	<a class="link"  id="uncheck" href="<c:url value='/manage/products/上架中 ' />">上架中</a>
	<a style="border:none; " class="link"  id="uncheck" href="<c:url value='/manage/products/審核失敗 ' />">審核失敗</a>

  </div>

<c:if test="${status =='待審核' }">
<div style="display:flex;">
<div class="button">
    <p class="btnText">上架</p>
    <div class="btnTwo">
      <button class="btnText2"  onClick="batch_up()" >v</button>
    </div>
    
 </div>

<div class="button">
    <p class="btnText">下架</p>
    <div class="btnTwo">
      <button class="btnText2" onClick="batch_fail()" >X</button>
    </div>
 </div>
 <div class="button">
    <p class="btnText">匯出</p>
    <div class="btnTwo">
      <button id="csv" class="btnText2">Csv</button>
    </div>
 </div>
 
 </div>
</c:if>


	<table id="myTable" class="display" style="width:100%;font-weight:bolder;font-size:20px;" >
    <thead>
        <tr>
    <th style="width:10%;">商品編號</th>
    <th style="width:10%;">賣家</th>
    <th style="width:20%;">商品名稱</th>
    <th style="width:10%;">商品圖片</th>
    <th style="width:10%;"><i class="far fa-calendar-alt"></i>&nbsp商品庫存</th>
    <th style="width:10%;">商品價錢</th>
    <th style="width:10%;">商品類別</th>
    <th style="width:10%;">上傳時間</th>
    <th style="width:10%;"><i class="fas fa-file-alt"></i>&nbsp商品狀態</th>
    <c:if test="${status =='待審核' }">
    <th style="width:10%;"><input type="checkbox" value="" name="selectall"></th>
    </c:if>
        </tr>
    </thead>
    <tbody>
   
   	
    <c:forEach items="${products}" var="product">
        <tr>
		    <td id="id">${product.productId}</td>
		  	<td>${product.seller}</td>
		    <td>${product.productName}</td>
		    <td><img width='100' height='100' 
		  				   src="<c:url value='/getPicture/${product.productId}' />" /></td>
		    <td>${product.stock}</td>
		    <td>${product.price}</td>
		    <td>${product.category}</td>
		    <td>${product.insertTime}</td>
		    <td>${product.status}</td>
		   <c:if test="${status =='待審核' }">
		    <td>
		       <input id="" type="checkbox" name="select" id="checkbox" value="${product.productId}"/>
		    </td>
		   </c:if> 
        </tr>
        </c:forEach> 


    </tbody>
</table>
</div>
</div>
	

  </section>
  <footer class="page-footer">
    <span>made by </span>
    <a href="https://georgemartsoukos.com/" target="_blank">
      <img width="24" height="24" src="https://assets.codepen.io/162656/george-martsoukos-small-logo.svg" alt="George Martsoukos logo">
    </a>
  </footer>
<script src="https://cdn.jsdelivr.net/npm/chart.js@3.6.0/dist/chart.min.js"></script>
<script type="text/javascript">
const html = document.documentElement;
const body = document.body;
const menuLinks = document.querySelectorAll(".admin-menu a");
const collapseBtn = document.querySelector(".admin-menu .collapse-btn");
const toggleMobileMenu = document.querySelector(".toggle-mob-menu");
const switchInput = document.querySelector(".switch input");
const switchLabel = document.querySelector(".switch label");
const switchLabelText = switchLabel.querySelector("span:last-child");
const collapsedClass = "collapsed";
const lightModeClass = "light-mode";

/*TOGGLE HEADER STATE*/
collapseBtn.addEventListener("click", function () {
  body.classList.toggle(collapsedClass);
  this.getAttribute("aria-expanded") == "true"
    ? this.setAttribute("aria-expanded", "false")
    : this.setAttribute("aria-expanded", "true");
  this.getAttribute("aria-label") == "collapse menu"
    ? this.setAttribute("aria-label", "expand menu")
    : this.setAttribute("aria-label", "collapse menu");
});

/*TOGGLE MOBILE MENU*/
toggleMobileMenu.addEventListener("click", function () {
  body.classList.toggle("mob-menu-opened");
  this.getAttribute("aria-expanded") == "true"
    ? this.setAttribute("aria-expanded", "false")
    : this.setAttribute("aria-expanded", "true");
  this.getAttribute("aria-label") == "open menu"
    ? this.setAttribute("aria-label", "close menu")
    : this.setAttribute("aria-label", "open menu");
});

/*SHOW TOOLTIP ON MENU LINK HOVER*/
for (const link of menuLinks) {
  link.addEventListener("mouseenter", function () {
    if (
      body.classList.contains(collapsedClass) &&
      window.matchMedia("(min-width: 768px)").matches
    ) {
      const tooltip = this.querySelector("span").textContent;
      this.setAttribute("title", tooltip);
    } else {
      this.removeAttribute("title");
    }
  });
}

/*TOGGLE LIGHT/DARK MODE*/
if (localStorage.getItem("dark-mode") === "false") {
  html.classList.add(lightModeClass);
  switchInput.checked = false;
  switchLabelText.textContent = "Light";
}

switchInput.addEventListener("input", function () {	
  html.classList.toggle(lightModeClass);
  if (html.classList.contains(lightModeClass)) {
    switchLabelText.textContent = "白天模式";
    localStorage.setItem("dark-mode", "false");
  } else {
    switchLabelText.textContent = "暗黑模式";
    localStorage.setItem("dark-mode", "true");
  }
});

$('#myTable').DataTable({
	  rowReorder: true,
	  columnDefs: [
	      { orderable: true, className: 'reorder', targets: 0},
	      { orderable: true, className: 'reorder', targets: 3},
	      { orderable: true, className: 'reorder', targets: 4},
	      { orderable: true, className: 'reorder', targets: 5},
	      { orderable: true, className: 'reorder', targets: 6},
	      { orderable: false, targets: '_all' }

	      ],
   "language": {
   "processing": "處理中...",
   "loadingRecords": "載入中...",
   "lengthMenu": "顯示 _MENU_ 項結果",
   "zeroRecords": "沒有符合的結果",
   "info": "顯示第 _START_ 至 _END_ 項結果，共 _TOTAL_ 項",
   "infoEmpty": "顯示第 0 至 0 項結果，共 0 項",
   "infoFiltered": "(從 _MAX_ 項結果中過濾)",
   "infoPostFix": "",
   "search": "搜尋:",
   "paginate": {
       "first": "第一頁",
       "previous": "上一頁",
       "next": "下一頁",
       "last": "最後一頁"
   },
   "aria": {
       "sortAscending": ": 升冪排列",
       "sortDescending": ": 降冪排列"
   }
   
   
   
}


});

$('input:checkbox[name="selectall"]').click(function(){
	 if($(this).is(':checked')){
	     $('input:checkbox[name="select"]').each(function(){
	    $(this).prop("checked",true);
	  });
	    }else{
	      $('input:checkbox[name="select"]').each(function(){
	    $(this).prop("checked",false);
	  });
	    }
	 });
     

 function batch_up() {
	    var productId = '';
	    $('input:checkbox[name="select"]').each(function(){
	      if(this.checked == true){
	    	  productId += this.value + ',';
	      }
	      console.log(productId);
	    });

	      $.ajax({
	        type: 'post',
	        url: '../launched',
	        data: {"productIds": productId},
	        success: function (data, textStatus, xhr) {
	          if (xhr.status == 200) {
	        	 swal.fire({
	                 icon: 'success',
	                 title: '上架成功',
	                 showConfirmButton: false,
	                 timer: 1000
	               })
	        	 setTimeout("location.href='./products';", 1000);  
	        		$.ajax({
	    				type:'get',
	    				url:'../../launched_addaddress',
	    				data: {"productIds": productId},
	    				
	    				success:function(){
	    					
	    				}
	    										
	    			});		
	        	 
	          } 
	        },
	        error: function (xhr, status) {
	        	console.log(xhr.status);
	        	
	        },
	      });
	      
	  
	   
	  }
 
 function batch_fail() {
	    var productId = '';
	    $('input:checkbox[name="select"]').each(function(){
	      if(this.checked == true){
	    	  productId += this.value + ',';
	      }
	      console.log(productId);
	    });

	      $.ajax({
	        type: 'post',
	        url: '../launchedfail',
	        data: {"productIds": productId},
	        success: function (data, textStatus, xhr) {
	          if (xhr.status == 200) {
	        	 swal.fire({
	                 icon: 'success',
	                 title: '審核成功',
	                 showConfirmButton: false,
	                 timer: 1000
	               })
	        	 setTimeout("location.href='./products';", 1000);  
	        		$.ajax({
	    				type:'get',
	    				url:'../../launched_addaddressfail',
	    				data:{},
	    				
	    				success:function(){
	    					
	    				}
	    										
	    			});		
	        	 
	          } 
	        },
	        error: function (xhr, status) {
	        	console.log(xhr.status);
	        	
	        },
	      });
	      
	  
	   
	  }
 
 const ctx = document.getElementById('myChart').getContext('2d');
 const myChart = new Chart(ctx, {
     type: 'bar',
     data: {
         labels: ['手機平板與周邊', '運動健身', '生活用品', '寵物', '其他'],
         datasets: [{
             label: '',
             data: [${category}],
             backgroundColor: [
                 'rgba(255, 99, 132, 0.5)',
                 'rgba(54, 162, 235, 0.5)',
                 'rgba(255, 206, 86, 0.5)',
                 'rgba(75, 192, 192, 0.5)',
                 'rgba(153, 102, 255, 0.5)',
                 
             ],
             borderColor: [
                 'rgba(255, 99, 132, 1)',
                 'rgba(54, 162, 235, 1)',
                 'rgba(255, 206, 86, 1)',
                 'rgba(75, 192, 192, 1)',
                 'rgba(153, 102, 255, 1)',
                 
             ],
             
             borderWidth: 1
         }]
     },
     options: {
         scales: {
             y: {
                 beginAtZero: true
             }
             
         },
         responsive: true,
         plugins: {
           legend: {
             position: 'top',
             
           },
           title: {
             display: true,
             text: '',
             position: 'bottom',
           }
         }
     }
 });
 
 const ctx1 = document.getElementById('myChart1').getContext('2d');
 const myChart1 = new Chart(ctx1, {
     type: 'pie',
     data: {
         labels: ['${sellerNo1}', '${sellerNo2}', '${sellerNo3}'],
         datasets: [{
             label: '',
             data: [${seller}],
             backgroundColor: [
                 'rgba(255, 99, 132, 0.5)',
                 'rgba(54, 162, 235, 0.5)',
                 'rgba(255, 206, 86, 0.5)',
                 'rgba(75, 192, 192, 0.5)',
                 'rgba(153, 102, 255, 0.5)',
                 'rgba(255, 159, 64, 0.5)'
             ],
             borderColor: [
                 'rgba(255, 99, 132, 1)',
                 'rgba(54, 162, 235, 1)',
                 'rgba(255, 206, 86, 1)',
                 'rgba(75, 192, 192, 1)',
                 'rgba(153, 102, 255, 1)',
                 'rgba(255, 159, 64, 1)'
             ],
             borderWidth: 1
         }]
     },
     options: {
         scales: {
//              y: {
//                  beginAtZero: true
//              }
         }
     }
 });
 
 const ctx2 = document.getElementById('myChart2').getContext('2d');
 const myChart2 = new Chart(ctx2, {
     type: 'doughnut',
     data: {
         labels: ['上架中', '審核中', '審核失敗'],
         datasets: [{
             label: '# of Votes',
             data: [${productStatus}],
             backgroundColor: [
                 'rgba(255, 99, 132, 0.5)',
                 'rgba(54, 162, 235, 0.5)',
                 'rgba(255, 206, 86, 0.5)',
                 'rgba(75, 192, 192, 0.5)',
                 'rgba(153, 102, 255, 0.5)',
                 'rgba(255, 159, 64, 0.5)'
             ],
             borderColor: [
                 'rgba(255, 99, 132, 1)',
                 'rgba(54, 162, 235, 1)',
                 'rgba(255, 206, 86, 1)',
                 'rgba(75, 192, 192, 1)',
                 'rgba(153, 102, 255, 1)',
                 'rgba(255, 159, 64, 1)'
             ],
             borderWidth: 1
         }]
     },
     options: {
//          scales: {
//              y: {
//                  beginAtZero: true
//              }
//          }
     }
 });
 
 $('#csv').click(function () {
	   var url = "<c:url value='/productCsv'/>";
	   $.ajax({
	  url: url,
	  type: 'get',
	  contentType: "application/json; charset=utf-8",
	  data: {},
	  success: function (data) {
	    Swal.fire({
	   title: '匯出成功',
	   icon: 'success',
	   text: "已匯出全部商品資料！",
	   position: 'center',

	    }).then((result) => {
	   /* Read more about isConfirmed, isDenied below */
	   if (result.isConfirmed) {
	     location.href = "<c:url value='/manage/products/待審核'/>";
	   }
	    })
	  },
	  error: function (xhr, text) {
	    console.log("status code: " + xhr.status);
	    console.log("error message: " + text);
	    Swal.fire({
	   title: '匯出失敗',
	   icon: 'error',
	   text: "",
	    })
	  }
	   });

	 });

 

 </script>
</body>
</html>