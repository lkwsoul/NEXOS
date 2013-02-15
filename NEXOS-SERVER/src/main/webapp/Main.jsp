<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0014)about:internet -->
<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en"> 
    <!-- 
    Smart developers always View Source. 
    
    This application was built using Adobe Flex, an open source framework
    for building rich Internet applications that get delivered via the
    Flash Player or to desktops via Adobe AIR. 
    
    Learn more about Flex at http://flex.org 
    // -->
    <head>
        <meta name="google" value="notranslate" />         
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <!-- Include CSS to eliminate any default margins/padding and set the height of the html element and 
             the body element to 100%, because Firefox, or any Gecko based browser, interprets percentage as 
             the percentage of the height of its parent container, which has to be set explicitly.  Fix for
             Firefox 3.6 focus border issues.  Initially, don't display flashContent div so it won't show 
             if JavaScript disabled.
        -->
        <style type="text/css" media="screen"> 
            html, body  { height:100%; }
            body { margin:0; padding:0; overflow:auto; text-align:center; 
                   background-color: #ffffff; }   
            object:focus { outline:none; }
            #flashContent { display:none; }
        </style>
        
        <title>Nexos Application</title>
        
        

		    <!-- ====================================================================== -->
		    <!-- Customize Part - Start -->
		    <!-- ====================================================================== -->
		    <!-- FABridge Import.  -->
		    <script type="text/javascript" src="FABridge.js"></script>
        <script language="JavaScript" type="text/javascript" defer="defer">
	        //#####################################################################################################
	        // FABridge 처리 부분
	        //#####################################################################################################
	        var objMain;
	        var bridgeID = "Main";
	        var initCallBack = function () {
	          // swf는 Main으로 취급합니다.
	          objMain = FABridge.Main.root();
	          return;
	        }
	        FABridge.addInitializationCallback(bridgeID, initCallBack);
	        // FABridge를 통해서 로그인 창을 뛰우기.
	
	        /**
	        * Browser Focus처리하기
	        */
	        function setBrowserFocus(){
	          window.focus();
	          Main.focus();
	          setTimeout("Main.focus()",250);
	        }
	        
	        //#####################################################################################################
	        // Iframe 관련
	        //#####################################################################################################
	        var frameRef = null;
	        function moveIFrame(x,y) {
            if(frameRef==null) {
              frameRef=document.getElementById("myFrame");
            }
            frameRef.style.left=x+"px";
            frameRef.style.top=y+"px";
          }

          function resizeIFrame(w,h) {
            var iFrameRef =document.getElementById("myIFrame");
            iFrameRef.width=w+"px";
            iFrameRef.height=h+"px";
          }
          
          function hideIFrame(){
            document.getElementById("myFrame").style.display="none";
          }
           
          function showIFrame(){
            document.getElementById("myFrame").style.display="";
          }
          
          var itmeOutValue = 400;
          //var itmeOutValue = 800;
          
          /**
          * 특정 URL을 호출하는 Function.
          * @param url : 호출할 URL
          * @param isPost : Post방식으로 URL호출 할것인지 여부.(default value "N")
          * @param isHidden : 숨김여부.
          */
          function loadIFrame(url, isPost, isHidden) {
            //PDF설치여부 체크하기.
            if(url.indexOf("report?")>-1){
              var bCheckPDFInstalled = checkPDFInstalled();
              if(bCheckPDFInstalled!=undefined && !bCheckPDFInstalled){
                alert("설치된 아크로벳리더가 없습니다. 설치 후 다시 출력해주세요");
                url =  "http://www.adobe.com/kr/products/acrobat/readstep2.html";
              }
            }
            if(isPost=="Y"){
              //document.getElementById("myFrame").innerHTML = "<iframe id='myIFrame' frameborder='0'></iframe><form name='myForm' method='post' target='myIFrame'></form>";
              //document.all.myForm.action = url;
              //document.all.myForm.target = "myIFrame";
              //document.all.myForm.submit();
              document.all.myForm.method = "post";
            }else{
              //document.all.myForm.method = "get"; 
              //document.getElementById("myFrame").innerHTML = "<iframe id='myIFrame' src='" + url + "' frameborder='0'></iframe><form name='myForm' method='post' target='myIFrame'></form>";
              document.getElementById("myFrame").innerHTML = "<iframe id='myIFrame' src='" + url + "' frameborder='0'></iframe>";
              return;
            }
          
            //숨김일 경우.
            if(isHidden=="Y") {
              document.all.myForm.target = "iframhidden";
            }else{
              document.all.myForm.target = "myIFrame";
            }
            document.all.myForm.action = url;
            document.all.myForm.submit();
          }
          
          function checkPDFInstalled(){
            if(window.ActiveXObject){
              // AcroPDF.PDF is used by version 7 and later
              try{
                control_text = "AcroPDF.PDF";
                control = new ActiveXObject(control_text);
              }catch(e){
                return false;
              }
              
              if(!control){
                try{
                  // PDF.PdfCtrl is used by version 6 and earlier
                  control_text = "PDF.PdfCtrl";
                  control = new ActiveXObject(control_text);
                }catch (e){
                  return false;
                }
              }
              if(control){
                return true;
              }else{
                return false;
              }
            }
          }
          
          /**
           * Client IP를 Set하는 Function
           * login_ok.jsp에서 호출함.
           */
          function setClientIP(ipValue) {
            objMain = FABridge.Main.root();
            objMain.appSetClientIP(ipValue);
          }
          
          function setFocusMain() {
            window.focus();
            Main.focus();
            // swf는 Main으로 취급합니다.
            objMain = FABridge.Main.root();
            //Main.mxml의 Function호출.
            objMain.appFocusIn();
          }
          
          function removeInterval() {
            //clearInterval(intInterval);
          }
          
          /**
          * 호출된URL에 대한 초기화 Function.
          * @param isPost : Post방식으로 URL호출 할것인지 여부.(default value "N")
          */
          function unloadIFrame(isPost){
            /*
            if(isPost=="Y"){
              if(myIFrame!=null && myIFrame!=undefined)
                myIFrame.document.location.href="about:blank";
            }else{
              //document.getElementById("myFrame").innerHTML = "";
              myFrame.removeChild(myIFrame);
              myFrame.removeChild(myForm);
            }*/
            //myFrame.removeChild(myIFrame);
            myFrame.removeChild(myForm);
          }
          
          /**
          * 로그인 Function
          */
          function login(userId,userPw){
            //var strURL = "/servlet/LoginR";
            var strURL = "/LoginR";
            loginForm.USER_ID.value  = userId;
            loginForm.USER_PWD.value = userPw;
            loginForm.action = strURL;
          
            loginForm.submit();
            return true;
            //document.getElementById("myFrameLoginOut").innerHTML = "<iframe id=\"iframloginOut\" src='"+strURL+"' frameborder='0' width=\"0\" height=\"0\"></iframe>";
          }
          
          /**
           * 로그아웃 Function.
           */
          function logout(){
            //var strURL = "/servlet/LogoutR?LOGIN_TYPE=FLEX";
            var strURL = "/LogoutR?LOGIN_TYPE=FLEX";
            document.getElementById("myFrameLoginOut").innerHTML = "<iframe id=\"iframloginOut\" src='"+strURL+"' frameborder='0' width=\"0\" height=\"0\"></iframe>";
            return true;
          }
          
          var intInterval;
          
          /**
          * Hidden Frame에 특정 URL을 호출합니다.
          */
          function loadHiddenIFrame(url){
            //eval("document.iframhidden.location.href=\""+url+"\"");
            //기본 iframe으로 target을 지정하여 submit처리함
            document.all.myForm.target = "iframhidden";
            document.all.myForm.action = url;
            document.all.myForm.submit();
            
            setTimeout(setFocusMain, itmeOutValue);
            return true;
          }
          
          /**
           * Hidden Frame 초기화.
           */
          function unloadHiddenIFrame(){
            //eval("document.iframhidden.location.href=\"about:blank\"");
            //기본 iframe으로 target을 지정하여 submit처리함
            document.all.myForm.target = "iframhidden";
            document.all.myForm.action = "about:blank";
            document.all.myForm.submit();
            clearInterval(intInterval);
            return true;
          }
          
          /**
           * interval을 Clear하도록 합니다.
           */
          function callClearInterval() {
            clearInterval(intInterval);
          }
          
          /**
           * Hidden Frame출력 페이지 로딩을 위한  Function.
           * @param url : 호출할 URL
           * @param printType :  프린트호출할 종류.
           *                     PRINT_LABEL_IN  = 입고라벨
           *                     PRINT_BILL_IN   = 입고전표
           *                     PRINT_LABEL_OUT = 출고라벨
           *                     PRINT_BILL_OUT  = 출고라벨
           */
          function loadHiddenPrint(url,printType){
            if(printType==null || printType=="") {
              //eval("document.iframhidden.location.href=\""+url+"\"");
            	document.all.myForm.target = "iframhidden";
              document.all.myForm.action = url;
              document.all.myForm.submit();
            }else{
	            //var strDivId        = "myFrameHidden"+printType;
	            var strFramId       = "iframhidden"+printType
	            //alert("loadHiddenPrint=");
	            //alert("strDivId="+strDivId);
	            //alert("strFramId="+strFramId);
	            //alert("url="+url);
	            
	            var hiddenIframe = document.getElementById(strFramId);
	            
	            if(hiddenIframe==undefined || hiddenIframe==null){
	              alert("정확한 Hidden Frame명을 입력해주세요");
	              return;
	            }
	            
	            setValuePrintType("_P_PRINT_LABEL_IN"     ,document.all.printForm.P_PRINT_LABEL_IN.value    , printType);
	            setValuePrintType("_P_PRINT_LABEL_OUT"    ,document.all.printForm.P_PRINT_LABEL_OUT.value   , printType);
	            setValuePrintType("_P_PRINT_BILL_IN"      ,document.all.printForm.P_PRINT_BILL_IN.value     , printType);
	            setValuePrintType("_P_PRINT_BILL_OUT"     ,document.all.printForm.P_PRINT_BILL_OUT.value    , printType);
	            setValuePrintType("_P_PRINT_LABEL_IN_IN"  ,document.all.printForm.P_PRINT_LABEL_IN_IN.value , printType);
	            //alert("!!!!printType=" + printType);
	            //프린트 호출 종류에 따라서 Form을 다르게 가져간다
	            if(printType=="PRINT_LABEL_IN") {
	              //alert("a_printType=" + printType);
	              document.all.formPRINT_LABEL_IN.action = url;
	              document.all.formPRINT_LABEL_IN.submit();
	            }else if(printType=="PRINT_BILL_IN") {
	              //alert("b_printType=" + printType);
	              document.all.formPRINT_BILL_IN.action = url;
	              document.all.formPRINT_BILL_IN.submit();
	            }else if(printType=="PRINT_LABEL_OUT") {
	              //alert("c_printType=" + printType);
	              document.all.formPRINT_LABEL_OUT.action = url;
	              document.all.formPRINT_LABEL_OUT.submit();
	            }else if(printType=="PRINT_BILL_OUT") {
	              //alert("d_printType=" + printType);
	              document.all.formPRINT_BILL_OUT.action = url;
	              document.all.formPRINT_BILL_OUT.submit();
	            }else if(printType=="PRINT_LABEL_IN_IN") {
	                //alert("b_printType=" + printType);
	                document.all.formPRINT_LABEL_IN_IN.action = url;
	                document.all.formPRINT_LABEL_IN_IN.submit();
	            }else{
	              setValue("_P_PRINT_LABEL_IN"    ,document.all.printForm.P_PRINT_LABEL_IN.value);
	              setValue("_P_PRINT_LABEL_OUT"   ,document.all.printForm.P_PRINT_LABEL_OUT.value);
	              setValue("_P_PRINT_BILL_IN"     ,document.all.printForm.P_PRINT_BILL_IN.value);
	              setValue("_P_PRINT_BILL_OUT"    ,document.all.printForm.P_PRINT_BILL_OUT.value);
	              setValue("_P_PRINT_LABEL_IN_IN" ,document.all.printForm.P_PPRINT_LABEL_IN_IN.value);
	              
	              document.all.myForm.target = "iframhidden"+printType;
	              document.all.myForm.action = url;
	              document.all.myForm.submit();
	            }
           
               //alert("loadHiddenPrint="+url);
               //eval("document."+strFramId+".location.href=\""+url+"\"");
            }
           
            //focus처리.
            setTimeout(setFocusMain, itmeOutValue);
            return true;
          }
           
          /**
          * 타입별 프린터 명을 지정한다
          */
          function setPrintName(type,value){
	          var inputElm=document.getElementById("P_" + type);
	
	          if(inputElm==undefined || inputElm==null){
	            alert("프린터 input 객체가 필요합니다.");
	          }else{
	            inputElm.setAttribute("value" ,value);
	          }
          }
                 
           /**
            * Hidden Frame출력 페이지 초기화을 위한 Function.
            * @param printType :  프린트호출할 종류.
            *                     PRINT_LABEL_IN  = 입고라벨
            *                     PRINT_BILL_IN   = 입고전표
            *                     PRINT_LABEL_OUT = 출고라벨
            *                     PRINT_BILL_OUT  = 출고라벨
            */
          function unloadHiddenPrint(){
	          if(printType==null || printType=="") {
	            document.getElementById("myFrameHidden").innerHTML = "";
	          }else{
	            var hiddenObject = document.getElementById("myFrameHidden"+printType);
	            if(hiddenObject==undefined || hiddenObject==null){
	              alert("정확한 Hidden Frame Layer명을 입력해주세요");
	              return;
	            }
	            hiddenObject.innerHTML = "";
	          }
	        
	          //일정시간 지속적으로 반복하기 위해서 setInterval로 변경.
	          intInterval = setInterval(setFocusMain, itmeOutValue);
	          return true;
          }
          
          /**
          * Hidden Frame출력 페이지 로딩을 위한  Function - 라벨.
          * @param url : 호출할 URL
          * @param printType :  프린트호출할 종류.
          *                     PRINT_LABEL_IN  = 입고라벨
          *                     PRINT_BILL_IN   = 입고전표
          *                     PRINT_LABEL_OUT = 출고라벨
          *                     PRINT_BILL_OUT  = 출고라벨
          */
          function loadHiddenPrintMuiti(url){
            eval("document.iframhidden.location.href=\""+url+"\"");
            alert(url);
            //focus처리.
            setTimeout(setFocusMain, itmeOutValue);
            return true;
          }
          
          /**
          * 특정값을 myForm의 hidden값으로 지정 Function
          */
          function setValue(strName,strValue){
            var inputElm=document.getElementById(strName);
            
            if(inputElm==undefined || inputElm==null){
              inputElm = document.createElement("input");
          
              inputElm.setAttribute("id"    ,strName);
              inputElm.setAttribute("type"  ,"hidden");
              inputElm.setAttribute("name"  ,strName);
              inputElm.setAttribute("value" ,strValue);
             
              document.all.myForm.appendChild(inputElm);
            }else{
              inputElm.setAttribute("value" ,strValue);
            }
            return true;
          }

          /**
          * myForm에 설정된 값을 Clear합니다
          */
          function clearValues() {
            var vForm = document.getElementById("myForm");

            if ( vForm.hasChildNodes() ) {
                while ( vForm.childNodes.length >= 1 ) {
                  vForm.removeChild( vForm.firstChild );       
                } 
            }
          }
          
          //----------------------------------------------------------------------------
          /**
           * 특정값을 myForm의 hidden값으로 지정 Function
           * @param printType :  프린트호출할 종류.
           *                     PRINT_LABEL_IN  = 입고라벨
           *                     PRINT_BILL_IN   = 입고전표
           *                     PRINT_LABEL_OUT = 출고라벨
           *                     PRINT_BILL_OUT  = 출고전표
           */
          function setValuePrintType(strName,strValue,printType){
	          var vID     = printType+strName;
	          var inputElm=document.getElementById(vID);
	          
	          if(inputElm==undefined || inputElm==null){
	            inputElm = document.createElement("input");
	        
	            inputElm.setAttribute("id"    ,vID);
	            inputElm.setAttribute("type"  ,"hidden");
	            inputElm.setAttribute("name"  ,strName);
	            inputElm.setAttribute("value" ,strValue);
	            //프린트 호출 종류에 따라서 Form을 다르게 가져간다
	            var formTarget;
	            if(printType=="PRINT_LABEL_IN") {
	              formTarget = document.getElementById("formPRINT_LABEL_IN");
	            }else if(printType=="PRINT_BILL_IN") {
	              formTarget = document.getElementById("formPRINT_BILL_IN");
	            }else if(printType=="PRINT_LABEL_OUT") {
	              formTarget = document.getElementById("formPRINT_LABEL_OUT");
	            }else if(printType=="PRINT_BILL_OUT") {
	              formTarget = document.getElementById("formPRINT_BILL_OUT");
	            }else if(printType=="PRINT_LABEL_IN_IN") {
	              formTarget = document.getElementById("formPRINT_LABEL_IN_IN");
	            }
               formTarget.appendChild(inputElm);
            }else{
               inputElm.setAttribute("value" ,strValue);
            }
            return true;
          }

          /**
           * myForm에 설정된 값을 Clear합니다
           * @param printType :  프린트호출할 종류.
           *                     PRINT_LABEL_IN  = 입고라벨
           *                     PRINT_BILL_IN   = 입고전표
           *                     PRINT_LABEL_OUT = 출고라벨
           *                     PRINT_BILL_OUT  = 출고라벨
           */
          function clearValuesForm(printType) {
	          var strFormId = "form" + printType;
	          var vForm = document.getElementById(strFormId);
	          if ( vForm.hasChildNodes() ) {
	            while ( vForm.childNodes.length >= 1 ) {
	              vForm.removeChild( vForm.firstChild );       
	            } 
	          }
          }
          
          /**
          * myForm의 모든 element를 삭제합니다.
          */
          function removeParameters(isPost){
            /*
            if(isPost=="Y"){
              document.getElementById("myFrame").innerHTML = "<iframe name='myIFrame' id='myIFrame' frameborder='0'></iframe><form name='myForm' method='post' target='myIFrame'></form>";
            }else{
              document.getElementById("myFrame").innerHTML = "";
            }*/
            document.getElementById("myFrame").innerHTML = "<iframe name='myIFrame' id='myIFrame' frameborder='0'></iframe>";

            document.getElementById("myFormContainer").innerHTML = "<form id='myForm' name='myForm' method='post' target='myIFrame'></form>";
            return true;
          }
          
          /**
          * 분할출력을 위한 동적인 Ifame생성
          */
          function loadDynamicIframe(printCd, url) {
            var iframe=document.createElement("iframe");

            iframe.setAttribute("id"    ,printCd);
            iframe.setAttribute("name"  ,printCd);
            iframe.className="hiddeniframe";
            iframe.style.display="none";
            
            document.body.appendChild(iframe);

            //eval("document."+printCd+".location.href=\""+url+"\"");

            //PDF설치여부 체크하기.
            if(url.indexOf("report?")>-1){
              var bCheckPDFInstalled = checkPDFInstalled();
              if(bCheckPDFInstalled!=undefined && !bCheckPDFInstalled){
                alert("설치된 아크로벳리더가 없습니다. 설치 후 다시 출력해주세요");
                //url =  "http://www.adobe.com/kr/products/acrobat/readstep2.html";
                return;
              }
            }
            
            //document.getElementById("myFrame").innerHTML = "<iframe id='myIFrame' frameborder='0'></iframe><form name='myForm' method='post' target='myIFrame'></form>";
            //document.all.myForm.action = url;
            //document.all.myForm.target = "myIFrame";
            //document.all.myForm.submit();
            document.all.myForm.method = "post";

            alert(printCd + "프린트로 출력합니다.");
            document.all.myForm.target = printCd;
            // 출력할 프린트코드도 같이 넘겨준다.
            document.all.myForm.action = url+ "?printCd="+printCd;
            //프린트코드 설정
            //setValue("printCd",printCd);
            document.all.myForm.submit();
          }
        </script>
        <!-- ====================================================================== -->
        <!-- Customize Part - End -->
        <!-- ====================================================================== -->
        
        <!-- Enable Browser History by replacing useBrowserHistory tokens with two hyphens -->
        <!-- BEGIN Browser History required section -->
        <link rel="stylesheet" type="text/css" href="history/history.css" />
        <script type="text/javascript" src="history/history.js"></script>
        <!-- END Browser History required section -->  
            
        <script type="text/javascript" src="swfobject.js"></script>
        <script type="text/javascript">
            // For version detection, set to min. required Flash Player version, or 0 (or 0.0.0), for no version detection. 
            var swfVersionStr = "11.1.0";
            // To use express install, set to playerProductInstall.swf, otherwise the empty string. 
            var xiSwfUrlStr = "playerProductInstall.swf";
            var flashvars = {};
            var params = {};
            params.quality = "high";
            params.bgcolor = "#ffffff";
            params.allowscriptaccess = "sameDomain";
            params.allowfullscreen = "true";
            var attributes = {};
            attributes.id = "Main";
            attributes.name = "Main";
            attributes.align = "middle";
            swfobject.embedSWF(
                "Main.swf", "flashContent", 
                "100%", "100%", 
                swfVersionStr, xiSwfUrlStr, 
                flashvars, params, attributes);
            // JavaScript enabled so display the flashContent div in case it is not replaced with a swf object.
            swfobject.createCSS("#flashContent", "display:block;text-align:left;");
        </script>
    </head>
    <body>
        <!-- SWFObject's dynamic embed method replaces this alternative HTML content with Flash content when enough 
             JavaScript and Flash plug-in support is available. The div is initially hidden so that it doesn't show
             when JavaScript is disabled.
        -->
        <div id="flashContent">
            <p>
                To view this page ensure that Adobe Flash Player version 
                11.1.0 or greater is installed. 
            </p>
            <script type="text/javascript"> 
                var pageHost = ((document.location.protocol == "https:") ? "https://" : "http://"); 
                document.write("<a href='http://www.adobe.com/go/getflashplayer'><img src='" 
                                + pageHost + "www.adobe.com/images/shared/download_buttons/get_flash_player.gif' alt='Get Adobe Flash player' /></a>" ); 
            </script> 
        </div>
        
        <noscript>
            <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" width="100%" height="100%" id="Main">
                <param name="movie" value="Main.swf" />
                <param name="quality" value="high" />
                <param name="bgcolor" value="#ffffff" />
                <param name="allowScriptAccess" value="sameDomain" />
                <param name="allowFullScreen" value="true" />
                <!--[if !IE]>-->
                <object type="application/x-shockwave-flash" data="Main.swf" width="100%" height="100%">
                    <param name="quality" value="high" />
                    <param name="bgcolor" value="#ffffff" />
                    <param name="allowScriptAccess" value="sameDomain" />
                    <param name="allowFullScreen" value="true" />
                <!--<![endif]-->
                <!--[if gte IE 6]>-->
                    <p> 
                        Either scripts and active content are not permitted to run or Adobe Flash Player version
                        11.1.0 or greater is not installed.
                    </p>
                <!--<![endif]-->
                    <a href="http://www.adobe.com/go/getflashplayer">
                        <img src="http://www.adobe.com/images/shared/download_buttons/get_flash_player.gif" alt="Get Adobe Flash Player" />
                    </a>
                <!--[if !IE]>-->
                </object>
                <!--<![endif]-->
            </object>
        </noscript>     
   </body>
   
  <!-- Customize Part -->
  <div id="myFrame"       style="position:absolute;background-color:transparent;border:0px;display:none;">
    <iframe name="myIFrame" id="myIFrame" frameborder="0"></iframe>
  </div>
  <!-- 출력형태에 따른 Form지정 -->
  <div style="position:absolute;background-color:transparent;border:0px;display:none;">
    <form id="formPRINT_LABEL_IN"     name="formPRINT_LABEL_IN"     method="post" target="iframhiddenPRINT_LABEL_IN"></form>
    <form id="formPRINT_LABEL_OUT"    name="formPRINT_LABEL_OUT"    method="post" target="iframhiddenPRINT_LABEL_OUT"></form>
    <form id="formPRINT_BILL_IN"      name="formPRINT_BILL_IN"      method="post" target="iframhiddenPRINT_BILL_IN"></form>
    <form id="formPRINT_BILL_OUT"     name="formPRINT_BILL_OUT"     method="post" target="iframhiddenPRINT_BILL_OUT"></form>
    <form id="formPRINT_LABEL_IN_IN"  name="formPRINT_LABEL_IN_IN"  method="post" target="iframhiddenPRINT_LABEL_IN_IN"></form>
  </div>
  <div id="myFormContainer" style="position:absolute;background-color:transparent;border:0px;display:none;">
   <form id="myForm" name="myForm" method="post" target="myIFrame"></form>
  </div>
  
  <div style="position:absolute;background-color:transparent;border:0px;display:none;">
  <form name="loginForm" method="post" target="ifrmhiddenLoginOut">
    <input type="hidden" name="USER_ID"   />
    <input type="hidden" name="USER_PWD"  />
  </form>
  </div>
  
  <!-- Flex 쿠키에 저장한 값을 저장하는 hidden -->
  <div style="position:absolute;background-color:transparent;border:0px;display:none;">
  <form name="printForm" method="post" target="" >
    <input type="hidden" name="P_PRINT_LABEL_IN"     id="P_PRINT_LABEL_IN"   />
    <input type="hidden" name="P_PRINT_LABEL_OUT"    id="P_PRINT_LABEL_OUT" />
    <input type="hidden" name="P_PRINT_BILL_IN"      id="P_PRINT_BILL_IN"   />
    <input type="hidden" name="P_PRINT_BILL_OUT"     id="P_PRINT_BILL_OUT"  />
    <input type="hidden" name="P_PRINT_LABEL_IN_IN"  id="P_PRINT_LABEL_IN_IN"   />
  </form>
  </div>
  
  <!-- default hidden Frame -->
  <div style="position:absolute;background-color:transparent;border:0px;display:none;">
  <iframe id="iframhidden" name="iframhidden" src="" frameborder="0" width="0" height="0" style="display: none"></iframe>
  <!-- 출력물에 대한 Hidden layeries -->
  <iframe id="iframhiddenPRINT_LABEL_IN"    name="iframhiddenPRINT_LABEL_IN"  src="" frameborder="0" width="0" height="0" style="display: none"></iframe>
  <iframe id="iframhiddenPRINT_LABEL_OUT"   name="iframhiddenPRINT_LABEL_OUT" src="" frameborder="0" width="0" height="0" style="display: none"></iframe>
  <iframe id="iframhiddenPRINT_BILL_IN"     name="iframhiddenPRINT_BILL_IN"   src="" frameborder="0" width="0" height="0" style="display: none"></iframe>
  <iframe id="iframhiddenPRINT_BILL_OUT"    name="iframhiddenPRINT_BILL_OUT"  src="" frameborder="0" width="0" height="0" style="display: none"></iframe>
  <iframe id="iframhiddenPRINT_LABEL_IN_IN" name="iframhiddenPRINT_LABEL_IN_IN" src="" frameborder="0" width="0" height="0" style="display: none"></iframe>
  <iframe id="ifrmhiddenLoginOut"           name="ifrmhiddenLoginOut"         src="" frameborder="0" width="0" height="0" style="display: none"></iframe>
  </div>
</html>
