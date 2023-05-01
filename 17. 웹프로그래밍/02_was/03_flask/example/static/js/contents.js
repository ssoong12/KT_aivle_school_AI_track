(function () {
    var msgs = {
        login: 'Login Your Account.',
        noAccount: 'Tdere is no Account.',
    };

    var drawChart = function(chartData){
        Highcharts.chart('container', {
            chart: {
                backgroundColor: '#343a40',
                plotBackgroundColor: null,
                plotBorderWidth: null,
                plotShadow: false,
                type: 'pie'
            },
            title: {
                text: 'Article Category Classification Result',
                style: {'color': 'white'},
                align: 'center'
            },
            tooltip: {
                pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
            },
            accessibility: {
                point: {
                    valueSuffix: '%'
                }
            },
            plotOptions: {
                pie: {
                    allowPointSelect: true,
                    cursor: 'pointer',
                    dataLabels: {
                        enabled: true,
                        format: '<b>{point.name}</b>: {point.percentage:.1f} %'
                    }
                }
            },
            series: [{
                name: 'Brands',
                colorByPoint: true,
                data: chartData
            }]
        });
        
    }
    
    var Event = {
        getContents: function () {
            $('.search').on('click', function () {
                var addr = $('.input-address').val();
                var url = 'https://apis.zigbang.com/v2/search?leaseYn=N&q=' + addr + '&serviceType=원룸'
                $.getJSON(url, function (json) {
                    // console.log(json.items);
                    var tag = '';
                    for(var i = 0; i < json.items.length; i++){
                        // console.log(json.items[i])
                        tag += '<tr>';
                        tag += '    <td>' + (i + 1) + '</td>';
                        tag += '    <td>' + json.items[i].id + '</td>';
                        tag += '    <td>' + json.items[i].name + '</td>';
                        tag += '    <td>' + Math.round(Number(json.items[i].lat) * 100) / 100 + '</td>';
                        tag += '    <td>' + Math.round(Number(json.items[i].lng) * 100) / 100 + '</td>';
                        tag += '    <td>' + json.items[i].description + '</td>';
                        tag += '</tr>';
                    }
                    $('.table-wrap > table > tbody').html(tag);
                    $('.table-wrap').show();
                });
            });
        },
        getCategory: function () {
            $('.search').on('click', function () {
                var params = {
                    sentence : $('.input-address').val(),
                }
                $.post('/api/category', params, function(response){
                    console.log(response.predict);
                    var chartData = []
                    for(var i = 0; i < response.predict.length  ;i++){
                        var data = response.predict[i];
                        console.log(data[0], data[1]);
                        chartData.push({name: data[0], y: data[1]})
                        drawChart(chartData);
                    }
                })
            });
        }
    };
    // Event.getContents();
    Event.getCategory();
})();