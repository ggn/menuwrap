﻿function statusChangeCallback(response) {
    console.log('statusChangeCallback');
    if (response.status === 'connected') {
        $('#FbloginButton').hide();
        UserLoggedIn();
    } else if (response.status === 'not_authorized') {
        $('#FbloginButton').show();
        document.getElementById('status').innerHTML = 'Please log ' +
          'into this app.';
    } else {
        $('#FbloginButton').show();
        document.getElementById('status').innerHTML = 'Please log ' +
          'into Facebook.';
    }
}

function checkLoginState() {
    FB.getLoginStatus(function (response) {
        statusChangeCallback(response);
    });
}

window.fbAsyncInit = function () {
    FB.init({
        appId: '372309036298915',
        cookie: true,
        xfbml: true,
        version: 'v2.3'
    });

    FB.getLoginStatus(function (response) {
        statusChangeCallback(response);
    });
};

(function (d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "//connect.facebook.net/en_US/sdk.js";
    fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));

function UserLoggedIn() {
    console.log('Welcome!  Fetching your information from facebook.... ');
    FB.api('/me', function (response) {
        if (response.hasOwnProperty('name')) {
            console.log('Successful login for: ' + response.name);
            console.log('Checking user registration: ' + response.name);
            RegisterUser(response);
        }

        if (response.hasOwnProperty('first_name')) {
            $('#status').html('Welcome, <b>' + response.first_name + '</b> ! <u><a href="#" onclick="UserLogOut();">Logout</a></u>');
        }
        var userDetails = {};
    });
}

function UserLogOut() {
    FB.logout(function (response) {
        ClearUserSession();
        statusChangeCallback(response);
    });
}

function StartUserSession(user) {
    window.localStorage.setItem("UserSession", JSON.stringify(user));
}

function GetUserSession() {
    return JSON.parse(window.localStorage.getItem("UserSession"));
}
function ClearUserSession() {
    window.localStorage.clear();
}

function RegisterUser(user) {
    var ajaxUrl = $.trim($('#registerUserURL').val());
    AjaxCall(ajaxUrl, user, "POST").success(function (data) {
        StartUserSession(data);
        console.log('Checking user contact details for: ' + data.name);
        if ($.trim(data.contact) == "") {
            var contact = prompt(data.name + " please provide your contact number to participate in our lucky draw.", "10 digit number");
            if (contact != null) {
                data.contact = contact;
                ajaxUrl = $.trim($('#UpdateContactURL').val());
                AjaxCall(ajaxUrl, data, "POST").success(function (result) {
                    if (result) {
                        alert("Lucky draw takes place on Last friday of every month. Results will be notified to you in the registered mobile number.");
                    }
                });
            }
        }
    }).error(function (qhr, error) {
    });
}

function AjaxCall(ajaxUrl, jsondata, ajaxType, requriesValidation) {
    debugger;
    var user = GetUserSession();
    if (requriesValidation)
    {
        if (!user || !user.ExpiresIn)
        {
            alert("Please login with facebook using the button below");
            scrollTo('AuthenticationDiv');
            return false;
        }
    }
    var ajaxCaller = $.ajax({
        url: ajaxUrl,
        data: jsondata,
        type: ajaxType,
        datatype: "JSON"
    });
    return ajaxCaller;
}

function scrollTo(id) {
    // Remove "link" from the ID
    id = id.replace("link", "");
    // Scroll
    $('html,body').animate({
        scrollTop: $("#" + id).offset().top
    },
        'slow');
}



