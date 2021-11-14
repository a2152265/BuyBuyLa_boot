<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
    <link rel="stylesheet" href="member.css">
    <link rel='stylesheet' href="<spring:url value='/css/member.css' />"  type="text/css" />
    
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BuyBuyLa | 會員中心</title>
    <style>
        

    </style>
</head>
<body style="background-color: rgb(70,130,180,0.2);">
   
    <div class="wrapper">
       <div class="section">

    <div class="top_navbar" style="background-color: rgb(70,130,180);">
      <div class="hamburger">
        <a href="#">
          <i class="fas fa-bars"></i>
        </a>
      </div>
    </div>

    
      <div class="container">
      <span style="font-size:30px;  font-weight:bold;">隱私權政策</span>
      </div>
        <div class="container">
      <span style="font-size:20px;  font-weight:bold;">

   &emsp;&emsp;&emsp;歡迎您來到BuyBuyLa的網站（以下簡稱本網站），本網站由藍石國際股份有限公司（以下簡稱我們）所經營。我們遵守「個人資料保護法」，並重視您的隱私權，為了確保您的個人資料安全，讓您能夠安心使用本網站的各項服務與資訊，我們訂立了以下的隱私權政策，請您詳細閱讀以了解本網站如何蒐集、應用、保護您的資料。
<br><br>
一、隱私權保護政策的適用範圍&nbsp:
<br>
&emsp;&emsp;&emsp;隱私權保護政策內容，包括本網站如何處理在您使用網站服務時收集到的個人識別資料。隱私權保護政策不適用於本網站以外的相關連結網站，也不適用於非本網站所委託或參與管理的人員。
<br><br>
二、個人資料的蒐集、處理及利用方式&nbsp:
<br>
• 當您在本網站加入會員、購物、申請試用包、電子報訂閱等網站活動或服務時，我們將視業務或活動性質請您提供必要的個人資料，並在該特定目的範圍內處理及利用。非經您書面同意，本網站不會將個人資料用於其他用途。	
• 於一般瀏覽時，伺服器會自行記錄相關行徑，包括您使用連線設備的IP位址、使用時間、使用的瀏覽器、瀏覽及點選資料記錄等，做為我們增進網站服務的參考依據，此記錄為內部應用，絕不對外公佈。
<br>
• 為提供精確的服務，我們會將收集的問卷調查內容進行統計與分析，分析結果之統計數據或說明文字呈現，除供內部研究外，我們會視需要公佈統計數據及說明文字，但不涉及特定個人之資料。
<br>
• 關於申請綁定 LINE 個人化服務：藍石將根據您提供的手機號碼或 Email 與 LINE 帳號進行身份驗證，過程中的查詢及驗證服務是由綠藤系統執行，並不會經由 LINE 記錄資料。
<br><br>
三、與第三方共用個人資料之政策&nbsp:
<br>
&emsp;&emsp;&emsp;本網站絕不會提供、交換、出租或出售任何您的個人資料給其他個人、團體、私人企業或公務機關，但有法律依據或合約義務者，不在此限。我們將在下列原則下，與第三人共用您的個人資料：
<br>
• 法律明文規定。
<br>
• 提供您服務或有利於您的權益，需與提供服務的第三方共用資料時。我們將在服務或活動中充分說明並通知，您可以選擇是否接受。
<br>
• 當您在網站的行為，違反服務條款或可能損害或妨礙網站與其他使用者權益或導致任何人遭受損害時，經網站管理單位研析揭露您的個人資料是為了辨識、聯絡或採取法律行動所必要者。
<br>
• 本網站委託廠商協助蒐集、處理或利用您的個人資料時，將對委外廠商或個人善盡監督管理之責。
<br>
&emsp;&emsp;&emsp;依據個資法第三條規定，您就本網站保有您之個人資料得行使之權利及方式如下：
<br>
（一）得向本網站行使之權利&nbsp:
<br>
&emsp;1、向本網站查詢、請求閱覽或請求製給複製本。<br>
&emsp;2、向本網站請求補充或更正。<br>
&emsp;3、向本網站請求停止蒐集、處理或利用及請求刪除。<br>
<br>
（二）行使權利之方式：以電子郵件 a21@gmail.com 或電話 0921212121 通知本網站主張行使上開權利之具體內容。
<br><br>
四、Cookie 的使用&nbsp:
<br>
&emsp;&emsp;&emsp;Cookie 是網站在您瀏覽網頁時，儲存在您電腦中的資料，讓網頁伺服器能辨識使用者、儲存使用者瀏覽該網站時的各種偏好設定，例如位置、語言、個人識別資訊，但僅限於您確實輸入過的內容，無法自行存取您未提供的資料或檔案。日後，您再度瀏覽網站時，該網站便能依據 Cookie 資料來判斷使用者，以提供符合您喜好及需求的資訊。
<br>
為了提供您更個人化的服務或統計瀏覽行為的目的，本網站會在您的電腦中放置並取用 Cookie，若您不願接受 Cookie 的寫入，您可在您使用的瀏覽器功能項中設定隱私權等級為高，即可拒絕 Cookie 的寫入，但可能會導至網站某些功能無法正常執行 。
<br><br>
五、隱私權保護政策修訂&nbsp:
<br>
&emsp;&emsp;&emsp;本網站隱私權保護政策將因應需求隨時進行修正，修正後的條款將刊登於網站上。
      </span>
      </div>


  </div>
  
  
  
<%@ include file="../Home/member/member_25/inschan/sidebar.jspf"%>
       
       
       