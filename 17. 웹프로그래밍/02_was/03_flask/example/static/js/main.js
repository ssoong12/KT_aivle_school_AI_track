console.log(1);
$("#getData").click(function() {
    // $.getJSON("/people", function(data) {
    //     console.log(data);
    //     var tag = "<p>alice : " + data.alice + "</p>";
    //         tag += "<p>jin : " + data.jin + "</p>";
    //     $(".result").html(tag);
    // })
    // var url = "/api/test?data1=1234&data2=test&data3=한글"
    // $.getJSON(url, function(response){
    //     console.log(response);
    // })
    var url = "/api/test";
    var data1 = {data1: 1234, data2: 'test', data3: '한글'};
    console.log(data1);
    $.post(url, data1, function(response){
        console.log(response);
    })
}) 