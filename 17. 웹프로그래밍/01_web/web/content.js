(function () {
  var Event = {
    getContents: function () {
      $("button.search").on("click", function () {
        var addr = $(".input-address").val();
        console.log(addr);
        var url = "https://apis.zigbang.com/v2/search?leaseYn=N&q=";
        url = url + addr + "&serviceType=원룸";
        console.log(url);
        // ajax 통신
        $.getJSON(url, function (response) {
          console.log(response.items);
          var tag = "";
          // items 길이만큼 반복문 실행
          for (var i = 0; i < response.items.length; i++) {
            console.log(response.items[i]);
            var item = response.items[i];
            tag += "<tr>";
            tag += "  <td>" + (i + 1) + "</td>";
            tag += "  <td>" + item.id + "</td>";
            tag += "  <td>" + item.name + "</td>";
            tag +=
              "  <td>" + Math.round(Number(item.lat) * 100) / 100 + "</td>";
            tag +=
              "  <td>" + Math.round(Number(item.lng) * 100) / 100 + "</td>";
            tag += "  <td>" + item.description + "</td>";
            tag += "</tr>";
          }
          $(".table-wrap>table>tbody").html(tag);
          $(".table-wrap").show(200);
        });
      });
    },
  };
  Event.getContents();
})();
