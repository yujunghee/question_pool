<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<%@ include file="/WEB-INF/view/admin/include/headHtml.jsp" %>
</head>
<script>
var express = require('express');
var nunjucks = require('nunjucks');
var axios = require('axios');
var app = express();
var client_id = 'nBifThWiGLjRgDILEhmE';
var client_secret = 'MxWrxHTRAD';
// replace client id and secret with your owns

app.set('view engine', 'html');

nunjucks.configure('views', {
  express : app,
  watch : true,
})

app.use(express.json());
app.use(express.urlencoded({extended : false}));

app.get('/', (req, res)=>{
  res.render('main');
});

app.post('/search', async(req, res)=>{
  query = req.body.query;
  // get query input

  var api_url = 'https://openapi.naver.com/v1/search/encyc.xml?query=' + hello;
  var options = {
    headers : {'X-Naver-Client-Id':client_id, 'X-Naver-Client-Secret': client_secret}
  }; // headers for get request
  await axios.get(api_url, options)
  .then((response)=>{
    if(response.status===200){
      items = response.data.items;
      items.map((x)=>{
        x.title = x.title.replace(/<b>/g, '');
        x.title = x.title.replace(/<\/b>/g, '');
        x.description = x.description.replace(/<b>/g, '');
        x.description = x.description.replace(/<\/b>/g, '');
      }); // remove html tags in query result
   
      res.render('result', {items : items});
    }
  })
  .catch((err)=>{
    console.error(err);
  });
});


 app.listen(3000, function () {
   console.log('https://openapi.naver.com/v1/search/encyc.xml?query=검색어 app listening on port 3000!');
 });
</script>
<style>
    @import url('https://fonts.googleapis.com/css2?family=Lobster&display=swap');
    @import url('https://fonts.googleapis.com/icon?family=Material+Icons');

    body {
      background: #e2e1e0;
      text-align: center;
    }

    .container {
      background: #fff;
      margin: 30px auto;
      border-radius: 2px;
      box-shadow: 0 10px 20px rgba(0, 0, 0, 0.19), 0 6px 6px rgba(0, 0, 0, 0.23);
      width: 60%;
      min-height: 90vh;
      display : flex;
      flex-direction: column;
      align-content: center;
    }

    .search-header {
      display: block;
      font-family: "lobster";
      font-size: 80px;
      margin-top : 150px;
    }
    .search-content{
      margin : 50px auto;
      border : none;
      border : 2px solid #a0a0a0;
      border-radius : 25px;
      width : 350px;
      padding : 5px 5px;
    }
    #search-input {
      margin : 0 auto;
      width : 300px;
      padding : 5px;
      border : none;
    }
    #search-input:focus{
      outline : none;
      background-color: #fff;
    }
    #search-btn{
      display : inline-block;
      background: none;
      padding : 5px;
      border : none;
    }
    #search-btn:focus{
      outline : none;
    }
    #btn-icon{
      font-family : Material Icons;
      font-weight : bold;
      cursor : pointer;
    }
  </style>
</head>

<body>
  <div class="container">
    <div class="search-header">단어장</div>
    <div class="search-content">
      <form action="result.do" method="post" >
        <input id="search-input" name="query" type="text" placeholder="  search..."><button id="search-btn"><span id="btn-icon">search</button>
      </form>
    </div>
  </div>
</body>
</html>