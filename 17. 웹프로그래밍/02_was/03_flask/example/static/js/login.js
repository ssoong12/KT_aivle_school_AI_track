(function() {
    $('header a.login').addClass('active');
    var msgs = {
        login: 'Login Your Account.',
        noAccount: 'There is no Account.',
    };
    var Event = {
        login: function() {
            $('#login-btn').on('click', function() {
                var params = {
                    id: $("#email").val(),
                    pw: $("#pw").val(),
                };
                // if( params.id === 'admin@kt.com' && params.pw === '1234'){
                //     $('.login-wrap>.msg').text(msgs.login).show();
                //     location.href = 'contents.html';
                // } else {
                //     $('.login-wrap>.msg').text(msgs.noAccount).show();
                // }
                $.post('/api/login', params, function(response){
                    // console.log(response.msg);
                    $('.login-wrap>.msg').text(msgs[response.msg]).show();
                    if(response.msg === 'login'){
                        location.href = 'contents';
                    }
                })
            });
        }
    };
    Event.login();
})();