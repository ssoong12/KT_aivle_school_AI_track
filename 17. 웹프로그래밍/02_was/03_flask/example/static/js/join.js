(function() {
    $('header a.join').addClass('active');
    var msgs = {
        checkPw: 'Check Your Password.',
        joinAccount: 'Joined Your Account.',
        hasAccount: 'Already has Account.',
    };
    var Event = {
        join: function() {
            $('#join-btn').on('click', function() {
                var params = {
                    id: $('#email').val(),
                    pw: $('#pw').val(),
                    ckpw: $('#ckpw').val(),
                    addr: $('input[name="addr"]:checked').val(),
                    birth: $('#birth').val(),
                    subscription: $('#subscription').val(),
                };
                console.log(params);
                if(params.pw != params.ckpw){
                    // console.log('check password!');
                    $('.join-wrap>.msg').text(msgs.checkPw).show();
                } else {
                    var url = 'api/join'
                    // console.log(params);
                    $.post(url, params, function(response){
                        // console.log(response);
                        $('.join-wrap>.msg').text(msgs[response.msg]).show();
                        if(response.msg === 'joinAccount'){
                            location.href = 'login';
                        };
                    });
                };
            });
        }
    };
    Event.join();
})();