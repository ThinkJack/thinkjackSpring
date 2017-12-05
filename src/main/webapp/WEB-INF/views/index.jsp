<%--
  Created by IntelliJ IDEA.
  User: kwak
  Date: 2017. 10. 18.
  Time: PM 7:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Test</title>
  <script src="https://unpkg.com/vue"></script>
  <style>
    #list  { width: 400px; border:1px solid black; border-collapse:collapse; }
    #list td, #list th { border:1px solid black;  text-align:center; }
    #list > thead > tr { color:yellow; background-color: purple; }
  </style>
</head>
<body>
${serverTime}
<div id="exmaple">
  <p>
    국가명 : <input type="text" v-model="countryname" placeholder="국가명" />
  </p>
  <table id="list">
    <thead>
    <tr>
      <th>번호</th><th>국가명</th><th>수도</th><th>지역</th>
    </tr>
    </thead>
    <tbody id="contacts">
    <tr v-for="c in filtered">
      <td>{{c.no}}</td>
      <td>{{c.name}}</td>
      <td>{{c.capital}}</td>
      <td>{{c.region}}</td>
    </tr>
    </tbody>
  </table>
</div>
<script type="text/javascript">
    var model = {
        countryname : "",
        countries : [
            { no:1,  name : "미국", capital : "워싱턴DC", region:"america", konglish:"alrnr" },
            { no:2,  name : "프랑스", capital : "파리", region:"europe", konglish:"vmfkdtm"},
            { no:3,  name : "영국", capital : "런던", region:"europe", konglish:"fjsejs"},
            { no:4,  name : "중국", capital : "베이징", region:"asia",konglish:"qpdlwld" },
            { no:5,  name : "태국", capital : "방콕", region:"asia" ,konglish:"qkdzhr" },
            { no:6,  name : "모로코", capital : "라바트", region:"africa" ,konglish:"ahfhzh"},
            { no:7,  name : "라오스", capital : "비엔티안", region:"asia",konglish:"fkdhtm" },
            { no:8,  name : "베트남", capital : "하노이", region:"asia" ,konglish:"qpxmska"},
            { no:9,  name : "피지", capital : "수바", region:"oceania" ,konglish:"vlwl"},
            { no:10,  name : "솔로몬 제도", capital : "호니아라", region:"oceania" ,konglish:"thffhahs wpeh"},
            { no:11,  name : "자메이카", capital : "킹스턴", region:"america" ,konglish:"wkapdlzk"},
            { no:12,  name : "나미비아", capital : "빈트후크", region:"africa" ,konglish:"skalqldk"},
            { no:13,  name : "동티모르", capital : "딜리", region:"asia" ,konglish:"ehdxlahfm"},
            { no:14,  name : "멕시코", capital : "멕시코시티", region:"america" ,konglish:"aprtlzh"},
            { no:15,  name : "베네수엘라", capital : "카라카스", region:"america" ,konglish:"qpsptndpffk"},
            { no:16,  name : "서사모아", capital : "아피아", region:"oceania", konglish:"tjtkahdk" }
        ]
    }

    var clist = new Vue({
        el : "#exmaple",
        data : model,
        computed : {
            filtered : function() {
                var cname = this.countryname.trim();
                return this.countries.filter(function(item,index) {
                    if (item.name.indexOf(cname) > -1 || item.konglish.indexOf(cname) > -1 || item.region.indexOf(cname) > -1) {
                        return true;
                    }
                });
            }
        }
    });
</script>
</body>
</html>
