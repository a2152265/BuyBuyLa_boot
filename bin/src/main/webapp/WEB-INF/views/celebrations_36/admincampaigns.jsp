<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.css">
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
 <script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.js"></script>
<style>
body{

}
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
  background-color: #f1f1f1;
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
/* RESET RULES
–––––––––––––––––––––––––––––––––––––––––––––––––– */
@import url("https://fonts.googleapis.com/css?family=Lato:400,700&display=swap");

:root {
  --page-header-bgColor: #242e42;
  --page-header-bgColor-hover: #1d2636;
  --page-header-txtColor: #dde9f8;
  --page-header-headingColor: #7889a4;
  --page-header-width: 220px;
  --page-content-bgColor: #f0f1f6;
  --page-content-txtColor: #171616;
  --page-content-blockColor: #fff;
  --white: #fff;
  --black: #333;
  --blue: #00b9eb;
  --red: #ec1848;
  --border-radius: 4px;
  --box-shadow: 0 0 10px -2px rgba(0, 0, 0, 0.075);
  --switch-bgLightModeColor: #87cefa;
  --switch-sunColor: gold;
  --switch-moonColor: #f4f4f4;
  --switch-bgDarkModeColor: #1f1f27;
}

* {
  padding: 0;
  margin: 0;
  box-sizing: border-box;
}

ul {
  list-style: none;
}

a,
button {
  color: inherit;
}

a {
  text-decoration: none;
}

button {
  background: none;
  cursor: pointer;
}

input {
  -webkit-appearance: none;
}

[type="checkbox"] {
  position: absolute;
  left: -9999px;
}

label {
  cursor: pointer;
}

button,
input {
  border: none;
}

svg {
  display: block;
}

body {
  font: 16px/1.5 "Lato", sans-serif;
}


/* HEADER STYLES
–––––––––––––––––––––––––––––––––––––––––––––––––– */
.page-header {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  overflow: auto;
  padding-top: 20px;
  width: var(--page-header-width);
  color: var(--page-header-txtColor);
  background: var(--page-header-bgColor);
}

/*In case you prefer an absolutely positioned header that covers the full page height, add these styles*/
/*body {
  position: relative;
}

.page-header {
  position: absolute;
  top: 0;
  left: 0;
  height: 100%;
}*/

/*remove these styles*/
/*.page-header {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  overflow: auto;
}*/

.page-header nav {
  display: flex;
  flex-direction: column;
  min-height: 100%;
}

.page-header .logo {
  display: block;
  margin: 0 15px;
}

.page-header .logo svg {
  max-width: 120px;
  fill: var(--white);
}

.page-header .toggle-mob-menu {
  display: none;
  margin-left: 5px;
  padding: 4px;
  background: var(--page-content-blockColor);
  border-radius: var(--border-radius);
}

.page-header .toggle-mob-menu svg {
  fill: var(--black);
  transition: transform 0.2s;
}

.page-header .admin-menu {
  display: flex;
  flex-direction: column;
  flex-grow: 1;
  margin-top: 35px;
}

.page-header .admin-menu li:nth-last-child(2) {
  margin-bottom: 35px;
}

.page-header .admin-menu li:last-child {
  margin-top: auto;
  margin-bottom: 20px;
}

.page-header .admin-menu li > * {
  width: 100%;
  padding: 12px 15px;
}

.page-header .admin-menu .switcher {
  display: inline-block;
  width: auto;
}

.page-header .admin-menu .menu-heading h3 {
  text-transform: uppercase;
  letter-spacing: 0.15em;
  font-size: 12px;
  margin-top: 12px;
  color: var(--page-header-headingColor);
}

.page-header .admin-menu svg {
  width: 20px;
  height: 20px;
  fill: var(--page-header-txtColor);
  margin-right: 10px;
}

.page-header .admin-menu a,
.page-header .admin-menu button {
  display: flex;
  align-items: center;
  font-size: 0.9rem;
}

.page-header .admin-menu a:hover,
.page-header .admin-menu a:focus,
.page-header .admin-menu button:hover,
.page-header .admin-menu button:focus {
  background: var(--page-header-bgColor-hover);
  color: var(--blue);
  outline: none;
}

.page-header .admin-menu a:hover svg,
.page-header .admin-menu a:focus svg,
.page-header .admin-menu button:hover svg,
.page-header .admin-menu button:focus svg {
  fill: var(--blue);
}


/* PAGE CONTENT STYLES
–––––––––––––––––––––––––––––––––––––––––––––––––– */
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

.page-content .grid > article {
  display: flex;
  height: 300px;
  background: var(--page-content-blockColor);
  border-radius: var(--border-radius);
  box-shadow: var(--box-shadow);
}

.page-content .grid > article:first-child,
.page-content .grid > article:last-child {
  grid-column: 1 / -1;
}


/* MQ RULES
–––––––––––––––––––––––––––––––––––––––––––––––––– */
@media screen and (max-width: 767px) {
  .page-header,
  .page-content {
    position: static;
    width: 100%;
  }

  .page-header {
    padding: 10px;
  }

  .page-header nav {
    flex-direction: row;
  }

  .page-header .logo {
    margin: 0;
  }

  .page-header .logo svg {
    width: 83px;
    height: 35px;
  }

  .page-header .toggle-mob-menu {
    display: block;
  }

  .page-header .admin-menu {
    position: absolute;
    left: 98px;
    top: 57px;
    margin-top: 0;
    z-index: 2;
    border-radius: var(--border-radius);
    background: var(--page-header-bgColor);
    visibility: hidden;
    opacity: 0;
    transform: scale(0.95);
    transition: all 0.2s;
  }

  .page-header .admin-menu li:nth-last-child(2) {
    margin-bottom: 12px;
  }

  .page-header .admin-menu li:last-child button,
  .search-and-user .admin-profile .greeting {
    display: none;
  }

  .page-content {
    min-height: 0;
    padding: 10px;
  }

  .page-content .grid {
    grid-gap: 10px;
  }

  .search-and-user {
    position: absolute;
    left: 131px;
    top: 10px;
    padding: 0;
    grid-column-gap: 5px;
    width: calc(100% - 141px);
    border-radius: var(--border-radius);
    background: transparent;
  }

  .search-and-user [type="search"] {
    font-size: 1rem;
    height: 35px;
  }

  .search-and-user form svg {
    width: 18px;
    height: 18px;
  }

  .search-and-user .admin-profile svg {
    fill: var(--white);
  }
}

@media screen and (max-width: 400px) {
  .page-content .grid > article {
    grid-column: 1 / -1;
  }
}


/* BODY CLASSES
–––––––––––––––––––––––––––––––––––––––––––––––––– */
.mob-menu-opened .toggle-mob-menu svg {
  transform: rotate(180deg);
}

.mob-menu-opened .page-header .admin-menu {
  transform: scale(1);
  visibility: visible;
  opacity: 1;
}

@media screen and (min-width: 768px) {
  .collapsed .page-header {
    width: 40px;
  }

  .collapsed .page-header .admin-menu li > * {
    padding: 10px;
  }

  .collapsed .page-header .logo,
  .collapsed .page-header .admin-menu span,
  .collapsed .page-header .admin-menu .menu-heading {
    display: none;
  }

  .collapsed .page-header .admin-menu svg {
    margin-right: 0;
  }

  .collapsed .page-header .collapse-btn svg {
    transform: rotate(180deg);
  }

  .collapsed .page-content {
    left: 40px;
    width: calc(100% - 40px);
  }
}


/* SWITCH STYLES
–––––––––––––––––––––––––––––––––––––––––––––––––– */
.switch label {
  display: grid;
  grid-template-columns: auto auto;
  grid-column-gap: 10px;
  align-items: center;
  justify-content: flex-start;
}

.switch span:first-child {
  position: relative;
  width: 50px;
  height: 26px;
  border-radius: 15px;
  box-shadow: inset 0 0 5px rgba(0, 0, 0, 0.4);
  background: var(--switch-bgLightModeColor);
  transition: all 0.3s;
}

.switch span:first-child::before,
.switch span:first-child::after {
  content: "";
  position: absolute;
  border-radius: 50%;
}

.switch span:first-child::before {
  top: 1px;
  left: 1px;
  width: 24px;
  height: 24px;
  background: var(--white);
  z-index: 1;
  transition: transform 0.3s;
}

.switch span:first-child::after {
  top: 50%;
  right: 8px;
  width: 10px;
  height: 10px;
  transform: translateY(-50%);
  background: var(--switch-sunColor);
  box-shadow: 0 0 4px 2px #ffdb1a;
}

.switch [type="checkbox"]:checked + label span:first-child {
  background: var(--switch-bgDarkModeColor);
}

.switch [type="checkbox"]:focus + label span:first-child {
  box-shadow: 0 3px 5px rgba(255, 255, 255, 0.25);
}

.switch [type="checkbox"]:checked + label span:first-child::before {
  transform: translateX(24px);
}

.switch [type="checkbox"]:checked + label span:first-child::after {
  left: 12px;
  width: 15px;
  height: 15px;
  background: transparent;
  box-shadow: -2px -5px 0 var(--switch-moonColor);
  transform: translateY(-50%) rotate(-72deg);
}


/* LIGHT MODE STYLES
–––––––––––––––––––––––––––––––––––––––––––––––––– */
.light-mode {
  --page-header-bgColor: #f1efec;
  --page-header-bgColor-hover: #b9e4e0;
  --page-header-txtColor: #2c303a;
  --page-header-headingColor: #979595;
  --page-content-bgColor: #fff;
  --box-shadow: 0 0 10px -2px rgba(0, 0, 0, 0.25);
}

.light-mode .page-header .admin-menu a:hover,
.light-mode .page-header .admin-menu a:focus,
.light-mode .page-header .admin-menu button:hover,
.light-mode .page-header .admin-menu button:focus {
  color: var(--black);
}

.light-mode .page-header .logo svg,
.light-mode .page-header .admin-menu a:hover svg,
.light-mode .page-header .admin-menu a:focus svg,
.light-mode .page-header .admin-menu button:hover svg,
.light-mode .page-header .admin-menu button:focus svg {
  fill: var(--black);
}

.light-mode .switch [type="checkbox"]:focus + label span:first-child {
  box-shadow: 0 3px 5px rgba(0, 0, 0, 0.25);
}

@media screen and (max-width: 767px) {
  .light-mode .search-and-user .admin-profile svg {
    fill: var(--black);
  }
}


/* FOOTER
–––––––––––––––––––––––––––––––––––––––––––––––––– */
.page-footer {
  font-size: 1rem;
  display: flex;
  align-items: center;
  justify-content: flex-end;
  margin-top: 10px;
}

.page-footer a {
  margin-left: 4px;
}
</style>
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
        <h3>ADMIN</h3>
      </li>
      <li>
        <a href="#0">
          <svg>
            <use xlink:href="#pages"></use>
          </svg>
          <span>會員管理</span>
        </a>
      </li>
      <li>
        <a href="manage/products">
          <svg>
            <use xlink:href="#users"></use>
          </svg>
          <span>商品管理</span>
        </a>
      </li>
      <li>
        <a href="./user">
          <svg>
            <use xlink:href="#trends"></use>
          </svg>
          <span>購物車管理</span>
        </a>
      </li>
      <li>
        <a href="./admincampaign">
          <svg>
            <use xlink:href="#collection"></use>
          </svg>
          <span>活動管理</span>
        </a>
      </li>
      <li>
        <a href="#0">
          <svg>
            <use xlink:href="#comments"></use>
          </svg>
          <span>動態管理</span>
        </a>
      </li>
      <li>
        <a href="#0">
          <svg>
            <use xlink:href="#appearance"></use>
          </svg>
          <span>Appearance</span>
        </a>
      </li>
      <li class="menu-heading">
        <h3>Settings</h3>
      </li>
      <li>
        <a href="#0">
          <svg>
            <use xlink:href="#settings"></use>
          </svg>
          <span>Settings</span>
        </a>
      </li>
      <li>
        <a href="#0">
          <svg>
            <use xlink:href="#options"></use>
          </svg>
          <span>Options</span>
        </a>
      </li>
      <li>
        <a href="#0">
          <svg>
            <use xlink:href="#charts"></use>
          </svg>
          <span>Charts</span>
        </a>
      </li>
      <li>
        <div class="switch">
          <input type="checkbox" id="mode" checked>
          <label for="mode">
            <span></span>
            <span>Dark</span>
          </label>
        </div>
        <button class="collapse-btn" aria-expanded="true" aria-label="collapse menu">
          <svg aria-hidden="true">
            <use xlink:href="#collapse"></use>
          </svg>
          <span>Collapse</span>
        </button>
      </li>
    </ul>
  </nav>
</header>
<section class="page-content">
  <div id="search" style="margin-bottom:30px">
						<button  type="button" class="btn btn-outline-primary"onclick="location.href ='./campaign/addCampaign'">新增活動</button>
	</div>
<table id="myTable" class="display" style="width:100%;font-weight:bolder;font-size:20px;" >
    <thead >
        <tr >
    <th style="width:6%;"><i class="fas fa-list-ol"></i>&nbsp編號</th>
    <th style="width:12%;"><i class="fas fa-portrait"></i>&nbsp活動名稱</th>
    <th style="width:20%;"><i class="fas fa-file-alt"></i>&nbsp活動內容</th>
    <th style="width:15%;"><i class="fas fa-image"></i>&nbsp圖片</th>
    <th style="width:10%;"><i class="far fa-calendar-alt"></i>&nbsp日期</th>
    <th style="width:10%;"><i class="far fa-clipboard"></i>&nbsp備註</th>
    <th style="width:10%;"><i class="fas fa-pencil-alt"></i>&nbsp修改</th>
    <th style="width:10%;"><i class="fas fa-trash-alt"></i>&nbsp刪除</th>
        </tr>
    </thead>
    <tbody>
    <c:forEach items="${campaigns}" var="campaign">
        <tr>
    <td>${campaign.id}</td>
    <td>${campaign.name}</td>
    <td>${campaign.description}</td>
    <td>
    <a href="<c:url value='${campaign.url} ' />"  target="_blank">
    <img style="padding:10px" width='100' height='100' 
                		src="<c:url value='/getCampaignPicture/${campaign.id}' />" />
     </a>
    </td>
    <td>${campaign.date1}</td>
    <td>${campaign.note}</td>
    <td><button style="font-size:18px;font-weight:bolder;border: 1px grey solid;border-radius:3px" class="btn" type="button" onclick="location.href ='./updatecampaign?id=${campaign.id}'" >修&nbsp改</button></td>
    <td><button style="font-size:18px;font-weight:bolder;border: 1px grey solid;border-radius:3px" class="btn" type="button" onclick="if(window.confirm('確定要刪除')) location.href ='./deletecampaign/${campaign.id}'" >刪&nbsp除</button>
    </td>
  </tr>
        </c:forEach>
    </tbody>
</table>

</section>

<script>


$(document).ready( function () {
    $('#myTable').DataTable({
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
    
//     $('#myTable').DataTable({
//         "language": {
//             "processing": "處理中...",
//             "loadingRecords": "載入中...",
//             "lengthMenu": "顯示 _MENU_ 項結果",
//             "zeroRecords": "沒有符合的結果",
//             "info": "顯示第 _START_ 至 _END_ 項結果，共 _TOTAL_ 項",
//             "infoEmpty": "顯示第 0 至 0 項結果，共 0 項",
//             "infoFiltered": "(從 _MAX_ 項結果中過濾)",
//             "infoPostFix": "",
//             "search": "搜尋:",
//             "paginate": {
//                 "first": "第一頁",
//                 "previous": "上一頁",
//                 "next": "下一頁",
//                 "last": "最後一頁"
//             },
//             "aria": {
//                 "sortAscending": ": 升冪排列",
//                 "sortDescending": ": 降冪排列"
//             }
//         }
//     });
    
} );


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
    switchLabelText.textContent = "Light";
    localStorage.setItem("dark-mode", "false");
  } else {
    switchLabelText.textContent = "Dark";
    localStorage.setItem("dark-mode", "true");
  }
});



	

</script>

</body>
</html>