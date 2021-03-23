<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trace: 족압 시각화 데이터</title>
</head>
<body>
<%String folderpath=request.getParameter("folderpath");
%>
<h3><%=folderpath %></h3>
<h1 style="text-align:center;margin-top:20px;margin-bottom:20px;"></h1>
<div id="image" style="width:40%; margin-left:15%"></div>
<script src="https://www.gstatic.com/firebasejs/8.2.9/firebase-app.js"></script>
<script src="https://www.gstatic.com/firebasejs/8.2.9/firebase-analytics.js"></script>
<script src="https://www.gstatic.com/firebasejs/8.2.9/firebase.js"></script>
<script>
  // Your web app's Firebase configuration
  // For Firebase JS SDK v7.20.0 and later, measurementId is optional
  var firebaseConfig = {
    apiKey: "AIzaSyCrvvW1xaCI3Vlh76AxsaXzqrn1H4CojPE",
    authDomain: "tracemobileapp-de9b1.firebaseapp.com",
    databaseURL: "https://tracemobileapp-de9b1-default-rtdb.firebaseio.com",
    projectId: "tracemobileapp-de9b1",
    storageBucket: "tracemobileapp-de9b1.appspot.com",
    messagingSenderId: "51128598053",
    appId: "1:51128598053:web:edc12f4d3e9bdfc146c9cc",
    measurementId: "G-4405168J95"
  };
  // Initialize Firebase
  firebase.initializeApp(firebaseConfig);


  var image=document.getElementById("image");
  var storage=firebase.storage();
  var storageRef=storage.ref();
  example();
  function example(){
 var folderpath="<%=folderpath%>";
 folderpath="uploads/"+folderpath;
   var listRef = storageRef.child(folderpath);
   var i=0;
// Find all the prefixes and items.
listRef.listAll().then(function(res) {

  res.items.forEach(function(itemRef) {
    // All the items under listRef.
    console.log(itemRef.toString());
    var img=document.createElement("img");
    img.id=itemRef.toString();
    image.appendChild(img);
    i++;
   displayImage(i,itemRef);
  });
}).catch(function(error) {
  // Uh-oh, an error occurred!
  console.error(error);
});
  }

function displayImage(row,images){
  images.getDownloadURL().then(function(url){
    
      var img=document.getElementById(images.toString());
      img.src=url;
      img.width='300';
      img.height='300';
      img.marginBottom='30';
      console.log(img.src);
     
  });
}
</script>    

</body>
</html>