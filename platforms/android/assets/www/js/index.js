var lvl2Clues, lvl2CluePosy;
var srcLvl2 = [];
var overlayLvl1 = [];

var overlayLvl2 = [
    [],
    [],
    []
];
var srcLvl3 = [
    [],
    [],
    []
];

function onLoad() {
    document.addEventListener("deviceready", onDeviceReady, false);
}

// device APIs are available
//
function onDeviceReady() {
    // Now safe to use device APIs


var case_id = 4;
var remote_host = "http://192.168.2.40:3000";

/*-----------------------------------------*/
/* Case Input Structures Left,Top,Width,Height%*/
/*-----------------------------------------*/

//var lvl1Nodes = ["60,70,30,25", "60,55,15,7", "85,50,12,14"];
var lvl1Nodes = [];

//var lvl1Data = ["The body was found here...hmmm||clue-body.jpg||So this is where he breathed his last...I should have a closer look...", "The obvious murder weapon. Or is it?||clue-knife.jpg||A normal barber\'s blade...I wonder if there is anything unusual about it", "What\'s that on the ground?||clue-cigs.jpg||These cigarette butts doesn\'t look very old. Aren\'t cigarettes expensive in the village...I wonder who could afford them"];
var lvl1Data = [];


//var lvl2Nodes = [
//    ["18,30,19,15", "73,31,13,10", "34,30,38,20"],
//    ["10,44,51,15"],
//    []
//];
var lvl2Nodes = [];

//var lvl2Data = [
//    ["I think this is what killed him||clue-cut.jpg||Looks like the killer did quite a number on Kamal. Not an easy task with such a blade...Looks like the killer had used something similar before", "What's that mark on his finger?||clue-tan.jpg||Hmmm...A ring seems to be missing...Could it have been taken by the killer?", "What\'s this on his shirt?||clue-hair.jpg||Looks like hair, but doesn\'t seem to be his...Maybe one of his customers I guess...or could it be the killer\'s"],
//    ["Looks like something is carved on the handle||clue-kk.jpg||Hmmm...Looks like Kamal had a personalized blade..."],
//    []
//];
var lvl2Data = [];


//var suspectNames = ['Kamal Kumar, Victim', 'Bhairav Thakur, Barber', 'Raju Kishan, Kamal\'s son-in-law', 'Shanti Kishan, Kamal\'s daughter', 'Rudra Chauhan, Loan Shark'];
var suspectNames = [];
//var suspectPhotos = ['/assets/victim-kamal.jpg', '/assets/suspect-bhairav.jpg', '/assets/suspect-raju.jpg', '/assets/suspect-shanti.jpg', '/assets/suspect-rudra.jpg'];
var suspectPhotos = [];

//var suspectBios = ['A renowned barber in the village where he was loved and respected by all. He lost his wife at a young age and has worked hard to provide for his only daughter. His business has done quite well over the years but his debts seem to rise meteorically every year. He has some property and land to his name but holds it close to his heart and has promised never to let it go.',
//    'The only other barber in the village. Shrewd in business,he has always seen Kamal as a threat to his livelihood. He is extremely envious of Kamal\'s popularity. He is well known by the villagers for his mercurial nature. He seems quite well kempt for a villager..Not a hair out of place. ',
//    'A typical small town guy, always dreaming big but doing nothing about it. I don\'t know how he landed such a beauty of a wife and how she still tolerates him. He\'s known around the village for his chain smoking and pretty much wasting his time away. What a loser...',
//    'A loving daughter and a foolish yet supportive wife. She admired her husband\'s ambition and had started dreaming herself. She had grown distant from her father after getting married. I wonder how that old man allowed them to get married!',
//    'A notorious money lender known to have inflated interest rate and penchant for making examples out of defaulters. Had lent a small sum of money to Kamal a decade ago but has inflated his interests so much that the paid amount has exceeded 50 times its intitial value. A normal village loan shark I guess...A real scumbag'
//];
var suspectBios = [];
//var suspectReactions = ['',
//    'I\'m very sad at the loss of a fellow barber. Though we may not have seen each other eye to eye, I always respected him. This village is not very safe especially for us rich folk, that’s why I carry my equipment with me wherever I go.',
//    ' This is a cursed village. My beloved father-in-law\'s life has been taken away by some miscreant. I don\'t wish to live here anymore! I want to move out and goto the nearby city as soon as possible',
//    'I wonder who could do this to him. He had never wronged anyone in the village. I hope the killer burns in hell. I guess my husband and I will move someplace else and start over.',
//    'Why am I a suspect here? I am just a helpful money lender. What would I gain if my customers start dropping dead? In any case, I would not harm anybody, especially Kamal who everyone seems to adore. Besides I\'m a rich man, I was thinking of retiring soon.'
//];
var suspectReactions = [];

/*-----------------------------------------*/
/* Case Variables Initializer*/
/*-----------------------------------------*/

var crimeSceneInit = false;
var suspectListInit = false;


var $radio;



function createCrimeScene() {
    var coordsLvl1 = [];
    var contentLvl1 = [];
    var coordsLvl2 = [
        [],
        [],
        []
    ];
    var contentLvl2 = [
        [],
        [],
        []
    ];
    for (var nodeLvl1 = 0; nodeLvl1 < lvl1Nodes.length; nodeLvl1++) {
        coordsLvl1[nodeLvl1] = lvl1Nodes[nodeLvl1].split(',');
        contentLvl1[nodeLvl1] = lvl1Data[nodeLvl1].split('||');
//        console.log("contentLvl1[nodeLvl1][1] :- " + (remote_host + contentLvl1[nodeLvl1][1]).replace(" ", ""));
        overlayLvl1[nodeLvl1] = '<a href="#" title="' + contentLvl1[nodeLvl1][0] + '" class="overlayPoint" id="node1' + nodeLvl1 + '" style="left:' + coordsLvl1[nodeLvl1][0] + '%;top:' + coordsLvl1[nodeLvl1][1] + '%;width:' + coordsLvl1[nodeLvl1][2] + '%;height:' + coordsLvl1[nodeLvl1][3] + '%;"></a>';
        //srcLvl2[nodeLvl1] = '<img src="/assets/' + contentLvl1[nodeLvl1][1] + '"/><h4 class="clue">' + contentLvl1[nodeLvl1][2] + '</h4>';
        srcLvl2[nodeLvl1] = '<img src="' + (remote_host + contentLvl1[nodeLvl1][1]).replace(" ", "") + '"/><h4 class="clue">' + contentLvl1[nodeLvl1][2] + '</h4>';
        for (var nodeLvl2 = 0; nodeLvl2 < lvl2Nodes[nodeLvl1].length; nodeLvl2++) {
            coordsLvl2[nodeLvl1][nodeLvl2] = lvl2Nodes[nodeLvl1][nodeLvl2].split(',');
            contentLvl2[nodeLvl1][nodeLvl2] = lvl2Data[nodeLvl1][nodeLvl2].split('||');
            overlayLvl2[nodeLvl1][nodeLvl2] = '<a href="#" title="' + contentLvl2[nodeLvl1][nodeLvl2][0] + '" class="overlayPoint" id="node2_' + nodeLvl1 + "_" + nodeLvl2 + '" style="left:' + coordsLvl2[nodeLvl1][nodeLvl2][0] + '%;top:' + coordsLvl2[nodeLvl1][nodeLvl2][1] + '%;width:' + coordsLvl2[nodeLvl1][nodeLvl2][2] + '%;height:' + coordsLvl2[nodeLvl1][nodeLvl2][3] + '%;"></a>';
//            console.log("contentLvl2[nodeLvl1][nodeLvl2][1] :- " + (remote_host + contentLvl2[nodeLvl1][nodeLvl2][1]).replace(" ", ""));
            //srcLvl3[nodeLvl1][nodeLvl2] = '<img src="/assets/' + contentLvl2[nodeLvl1][nodeLvl2][1] + '"/><h4 class="clue">' + contentLvl2[nodeLvl1][nodeLvl2][2] + '</h4>';
            srcLvl3[nodeLvl1][nodeLvl2] = '<img src="' + (remote_host + contentLvl2[nodeLvl1][nodeLvl2][1]).replace(" ", "") + '"/><h4 class="clue">' + contentLvl2[nodeLvl1][nodeLvl2][2] + '</h4>';
        }
    }
}

function overlayLvl2Bindings() {
    $("[id^=node1]").on('click', function () {
        var branch = parseInt($(this).attr("id").split("node1")[1]);
        var $lvl2 = $('.crimeSceneOverlay.lvl2');
        var $lvl3 = $('.crimeSceneOverlay.lvl3');
        $lvl2.hide().empty();
        $lvl3.hide().empty();
        $lvl2.append(srcLvl2[branch]).fadeIn('500');
        overlayLvl2[branch].forEach(function (elm) {
            $lvl2.append(elm);
            $('[title!=""]').qtip({
                position: {
                    my: 'bottom left',  // Position my top left...
                    at: 'top right', // at the bottom right of...
                    target: 'mouse' // my target
                }
            });
        });
        overlayLvl3Bindings();
    });
}






function overlayLvl3Bindings() {
    $("[id^=node2]").on('click', function () {
        var root = parseInt($(this).attr("id").split("_")[1]);
        var branch = parseInt($(this).attr("id").split("_")[2]);
        var $lvl3 = $('.crimeSceneOverlay.lvl3');
        $lvl3.hide().empty();
        $lvl3.append(srcLvl3[root][branch]).fadeIn('500');
    });
}


function buildSuspects() {
    if (!suspectListInit) {

        $.ajax({
            dataType: 'jsonp',
            type: 'get',
            url: remote_host + '/get_images/' + case_id,
            contentType: "application/javascript; charset=utf-8",
            success: function (data) {
//                console.log("result of get_images");
//                console.log(data)
                suspectPhotos = data;
//                console.log("suspectphoto"+data);

                //$("#suspectPhoto").attr("src", remote_host + data);
//
            }
        });
        setTimeout(function () {
            $('#charMenu').append('<div class="col-lg-' + (11 - suspectPhotos.length) + '"></div>');
            for (i = 0; i < suspectPhotos.length; i++) {
//                console.log(suspectPhotos[i])
                $('#charMenu').append('<div class="col-lg-1 suspectThumb"><img src="' + remote_host + suspectPhotos[i] + '" id="suspect' + i + '"/></div>');
//            $('#charMenu').append('<div class="col-lg-1 suspectThumb"><img src=""/></div>');
            }
            suspectListInit = true;
        }, 500);


    }

    $('.suspectThumb img').on('click', function () {


        var index = $(this).attr("id").split('suspect')[1];
        $('#suspectPhoto').attr('src', suspectPhotos[index]);
        $('#suspectName').html(suspectNames[index].split(',')[0] + "<br/><span id='suspectContext'>" + suspectNames[index].split(',')[1] + "</span>");
        $('#suspectProfile').html(suspectBios[index]);
        $('#suspectReaction').html(suspectReactions[index]).hide();
        if (index == 0) {
            $('#interrogateEm').fadeOut();
        } else {
            $('#interrogateEm').fadeIn().qtip({
                position: {
                    my: 'bottom left',  // Position my top left...
                    at: 'top right', // at the bottom right of...
                    target: 'mouse' // my target
                }
            });
        }
    });
}


    function buildSuspectsXs() {
        if (!suspectListInit) {
            console.log("suspectListInit :- " + suspectListInit);
            $.ajax({
                dataType: 'jsonp',
                type: 'get',
                url: remote_host+'/get_suspects_name/' + case_id,
                contentType: "application/javascript; charset=utf-8",
                success: function (data) {
                    console.log("result of get_suspects_name");
                    console.log(data);
                    suspectNames = data;
                    //suspectPhotos = data[1];
                }
            });

            $.ajax({
                dataType: 'jsonp',
                type: 'get',
                url: remote_host+'/get_suspect_bios/' + case_id,
                contentType: "application/javascript; charset=utf-8",
                success: function (data) {
                    console.log("result of get_suspect_bios");
                    console.log(data);
                    suspectBios = data;
                }
            });

            $.ajax({
                dataType: 'jsonp',
                type: 'get',
                url: remote_host+'/get_suspect_sr/' + case_id,
                contentType: "application/javascript; charset=utf-8",
                success: function (data) {
                    console.log("result of get_suspects_sr");
                    console.log(data);
                    suspectReactions = data;
                }
            });

            $.ajax({
                dataType: 'jsonp',
                type: 'get',
                url: remote_host+'/get_images/' + case_id,
                contentType: "application/javascript; charset=utf-8",
                success: function (data) {
                    console.log("result of get_images");
                    console.log(data)
                    suspectPhotos = data;
                    //console.log("suspectphoto"+data);
                    //$("#suspectPhoto").attr("src", remote_host + data);
                }
            });

            setTimeout(function () {
                for (i = 0; i < suspectPhotos.length; i++) {
                    $('#carouselBlocks').append('<div class="item suspectThumb-xs"><img src="' + remote_host+suspectPhotos[i] + '" id="suspect' + i + '"/></div>');
                }
                suspectListInit = true;
                $('.item').first().addClass('active');
                console.log("suspectNames :- " + suspectNames);
                $('#suspectName-xs').html(suspectNames[0].split(',')[0] + "<br/><span id='suspectContext-xs'>" + suspectNames[0].split(',')[0] + "</span>");
                $('#suspectProfile-xs').html(suspectBios[0]);
                $('#suspectReaction-xs').html('<span class="closeInter">&times;<span>' + suspectReactions[0]).hide();
            }, 1000);


        }

        var carousel = $('#carousel-characters').carousel({
            wrap: false,
            threshold: 0
        });

        $(".carousel-inner").swipe({
            swipeLeft: function (event, direction, distance, duration, fingerCount) {
                $(this).parent().carousel('next');
            },
            swipeRight: function () {
                $(this).parent().carousel('prev');
            }



        });

        carousel.on('slide.bs.carousel', function (event) {
            var index = $(event.relatedTarget).index();
            stopInterro();
            $('#suspectName-xs').html(suspectNames[index].split(',')[0] + "<br/><span id='suspectContext-xs'>" + suspectNames[index].split(',')[1] + "</span>");
            $('#suspectProfile-xs').html(suspectBios[index]);
            $('#suspectReaction-xs').html('<span class="closeInter" onclick="stopInterro();">&times;</span>' + suspectReactions[index]).hide();
            if (index == 0) {
                $('#interrogateEm-xs').fadeOut();
            } else {
                $('#interrogateEm-xs').fadeIn();
            }
        });

    }


$.fn.activatePanel = function () {
    $('.casePanel').css({pointerEvents: 'none'});
    $('.casePanel-xs').css({pointerEvents: 'none'});
    $(this).animate({opacity: '1'});
    $(this).css({pointerEvents: 'auto'});
    $('#caseFile').css('opacity', '1').fadeIn();
};

function comment_now(at) {
    var message = $('#u_0_c').val();
    if (message == "") {
        message = $('#u_0_c-xs').val();
    }
    var obj_id = '1519325818296676';
    FB.login(function (response) {
        if (response.authResponse) {
            at = response.authResponse.accessToken;
            $.post('https://graph.facebook.com/' + obj_id + '/comments?message=' + message + '&access_token=' + at, function (respo) {
                alert("Your comment has been posted on this week's case photo. Go check it out!");
                setTimeout(function () {
                    present_comment();
                    $('#u_0_c').val('');
                }, 500);

            });
        }
    }, {scope: 'publish_stream,publish_actions'});
}
;

function fb_comment() {
    var at = '';
    FB.getLoginStatus(function (response) {
        if (response.status == "connected") {
            at = response.authResponse.accessToken;
            comment_now();

        }
        else if (response.status == "notConnected") {
            FB.ui({
                client_id: '113381182103752',
                method: 'oauth',
                redirect_uri: 'http://www.detectime.com',
                response_type: 'token',
                perms: 'publish_stream,publish_actions'
            }, function (res) {
                at = res.access_token;
                comment_now();
            });
        }
        else if (response.status == "unknown") {
            comment_now();
        }
        else {
            comment_now();
        }
    });
}

function present_comment() {
    $.get('https://graph.facebook.com/1519325818296676/comments', function (res) {
        $('.prev_comments').empty().remove();
        $.each(res.data, function (i, v) {
            hr = "https://www.facebook.com/" + v.from.id;
            pic = "https://graph.facebook.com/" + v.from.id + "/picture"
            $('#allist').append('<li class="prev_comments"><div class="row"><div class="given_pic">' +
                '<a href="' + hr + '" class="pull-right prev_comm">' +
                '<img src="' + pic + '" alt=""/></a></div> <div class="given_comment">' +
                '<a class="fbName" href="' + hr + '">' + v.from.name + '</a>  ' + v.message +
                '<p>' + get_time_diff(v.created_time) + '</p></div></div></li>');
            $('#allist-xs').append('<li class="prev_comments"><div class="row"><div class="given_pic">' +
                '<a href="' + hr + '" class="pull-right prev_comm">' +
                '<img src="' + pic + '" alt=""/></a></div> <div class="given_comment">' +
                '<a class="fbName" href="' + hr + '">' + v.from.name + '</a>  ' + v.message +
                '<p>' + get_time_diff(v.created_time) + '</p></div></div></li>');
        });
        $("#commentsWrapper").niceScroll();
    })
}

function get_time_diff(datetime) {
    var datetime = typeof datetime !== 'undefined' ? datetime : "2014-01-01 01:02:03.123456";

    var datetime = new Date(datetime).getTime();
    var now = new Date().getTime();

    if (isNaN(datetime)) {
        return "";
    }

    if (datetime < now) {
        var milisec_diff = now - datetime;
    } else {
        var milisec_diff = datetime - now;
    }

    var days = Math.floor(milisec_diff / 1000 / 60 / (60 * 24));

    var date_diff = new Date(milisec_diff);

    if (days > 0) {
        return days + " days ago"
    } else if ((date_diff.getHours() - 5) > 0) {
        return (date_diff.getHours() - 5) + " hours ago"
    } else if ((date_diff.getMinutes() - 30) > 0) {
        return (date_diff.getMinutes() - 30) + " minutes ago"
    } else {
        return "few seconds ago"
    }

}


$(function () {

    $.ajax({
        dataType: 'jsonp',
        type: 'get',
        url: remote_host + '/get_case_info/' + case_id,
        contentType: "application/javascript; charset=utf-8",
        success: function (data) {
//            console.log("result of get_case_info");
//            console.log(data);
            $("#case_title").text(data["name"]);
            $("#caseName-xs").text(data["name"]);

            $("#briefing").text(data["description"].replace(/(<([^>]+)>)/ig, ""));
            $("#briefing-xs").text(data["description"].replace(/(<([^>]+)>)/ig, ""));

        }
    });

    //present_comment();

    $('.menuBtn').qtip({
        position: {
            my: 'bottom left',  // Position my top left...
            at: 'top right', // at the bottom right of...
            target: 'mouse' // my target
        }
    });

    $('.crimeSceneBtn .menuBtn').on('click', function () {

        $.ajax({
            dataType: 'jsonp',
            type: 'get',
            url: remote_host + '/get_clue_stmt_info/' + case_id,
            contentType: "application/javascript; charset=utf-8",
            success: function (data) {
//                console.log("result of get_clue_stmt_info ");
//                console.log(data);
                //console.log(data[0]); //image hover text
                lvl1Data = data[0];
                //console.log(data[1]); // image url
                $("#case_main_image").attr("src", remote_host + data[1]);

//                console.log("lvl1Nodes :-" + data[2]); //cordinates
                lvl1Nodes = data[2];

//                console.log(data[3]); //comment

                $("#first_clue_comment").text(data[3]);


            }
        });

        $.ajax({
            dataType: 'jsonp',
            type: 'get',
            url: remote_host + '/get_child_cord/' + case_id,
            contentType: "application/javascript; charset=utf-8",
            success: function (data) {
//                console.log("result of get_child_cord");
//                console.log(data);
//                console.log(data[1]);
                lvl2Nodes = data;
            }

        });

        $.ajax({
            dataType: 'jsonp',
            type: 'get',
            url: remote_host + '/get_children_data/' + case_id,
            contentType: "application/javascript; charset=utf-8",
            success: function (data) {
//                console.log("result of get_children_data");
//                console.log(data);
                lvl2Data = data
            }
        });


        $('.casePanel').animate({opacity: '0'}, '500', function () {
            $('#crimeScene').activatePanel();
            $('#panelTitle').html("Crime Scene");
            if (!crimeSceneInit) {
                createCrimeScene();
                overlayLvl1.forEach(function (elm) {
                    $('.crimeSceneOverlay.lvl1').append(elm);
                    $('[title!=""]').qtip({
                        position: {
                            my: 'bottom left',  // Position my top left...
                            at: 'top right', // at the bottom right of...
                            target: 'mouse' // my target
                        }
                    });
                });
                overlayLvl2Bindings();
            }
            crimeSceneInit = true;
        });
    });

    $('.charactersBtn .menuBtn').on('click', function () {


        $.ajax({
            dataType: 'jsonp',
            type: 'get',
            url: remote_host + '/get_suspects_name/' + case_id,
            contentType: "application/javascript; charset=utf-8",
            success: function (data) {
//                console.log("result of get_suspects_name");
//                console.log(data);
                suspectNames = data;
//                suspectPhotos = data[1];
            }
        });

//

        $.ajax({
            dataType: 'jsonp',
            type: 'get',
            url: remote_host + '/get_suspect_bios/' + case_id,
            contentType: "application/javascript; charset=utf-8",
            success: function (data) {
                //console.log("result of get_suspects_name");
                //console.log(data);
                suspectBios = data;
            }
        });

        $.ajax({
            dataType: 'jsonp',
            type: 'get',
            url: remote_host + '/get_suspect_sr/' + case_id,
            contentType: "application/javascript; charset=utf-8",
            success: function (data) {
                //console.log("result of get_suspects_name");
                //console.log(data);
                suspectReactions = data;
            }
        });

        buildSuspects();

        $('.casePanel').animate({opacity: '0'}, '500', function () {
            $('#panelTitle').html("Character Backgrounds");
            $('#characters').activatePanel();
            $('#suspectPhoto').attr('src', remote_host + suspectPhotos[0]);
            $('#suspectName').html(suspectNames[0].split(',')[0] + "<br/><span id='suspectContext'>" + suspectNames[0].split(',')[1] + "</span>");
            $('#suspectProfile').html(suspectBios[0]);
            $('#interrogateEm').hide();
            $('#suspectReaction').hide();

        });
    });

    $('#interrogateEm').on('click', function () {
        $('#suspectReaction').fadeIn();
    });

    $('#caseFile').on('click', function () {
        $('.casePanel').animate({opacity: '0'}, '500', function () {
            $('#panelTitle').html("");
            $('#caseName').activatePanel();
            $('#caseFile').css('opacity', '0');
        });
    });

    $('.caseBtn .menuBtn').on('click', function () {

//        console.log("suspectNames");
//        console.log(suspectNames);
        var sus_name, sus_id;
        $radio = ""
        $.each(suspectNames, function (index, value) {
            if (index > 0) {
                sus_name = value.split(",")[0];
                sus_id = value.split(",")[2];

                $radio = $radio + '<input type="radio" name="suspect_id" value=' + sus_id + '>' + sus_name + '<br>';

            }

        });
        var $sbmt = '<input type="hidden" name="case_id" value=' + case_id + '>' + $radio + '<input type="submit" value="Submit">';
        $("#guess_killer_form").html($sbmt);

        $('.casePanel').animate({opacity: '0'}, '500', function () {
            $('#panelTitle').html("Solve the Case");
            $('#comments').activatePanel();
            $('#caseFile').css('opacity', '0');
        });
    });

    $('.u_0_2').on('click', function () {

        var user_comment = {
            comment: $("#u_0_c").val()
        };
        $.ajax({
            type: 'POST',
            url: remote_host + '/save_post',
            data: user_comment,
            datatype: 'jsonp',
            success: function (data) {
                alert("success");
            }
        });
        if ($('#u_0_c').val() != "" || $('#u_0_c-xs').val() != "") {
            fb_comment();
        }
        return false;
    });
    /*------------------------------------------------- Code for the Phone-------------------------------------------------*/



    $('.crimeSceneBtn .menuBtn-xs').on('click', function () {
        console.log(".crimeSceneBtn .menuBtn-xs click");

        $.ajax({
            dataType: 'jsonp',
            type: 'get',
            url: remote_host + '/get_clue_stmt_info/' + case_id,
            contentType: "application/javascript; charset=utf-8",
            success: function (data) {
                console.log("result of get_clue_stmt_info ");
                console.log(data);
                //console.log(data[0]); //image hover text
                lvl1Data = data[0];
                //console.log(data[1]); // image url
                $("#case_main_image-xs").attr("src", remote_host + data[1]);

//                console.log("lvl1Nodes :-" + data[2]); //cordinates
                lvl1Nodes = data[2];

//                console.log(data[3]); //comment

                $("#first_clue_comment-xs").text(data[3]);


            }
        });

        $.ajax({
            dataType: 'jsonp',
            type: 'get',
            url: remote_host + '/get_child_cord/' + case_id,
            contentType: "application/javascript; charset=utf-8",
            success: function (data) {
//                console.log("result of get_child_cord");
//                console.log(data);
//                console.log(data[1]);
                lvl2Nodes = data;
            }

        });

        $.ajax({
            dataType: 'jsonp',
            type: 'get',
            url: remote_host + '/get_children_data/' + case_id,
            contentType: "application/javascript; charset=utf-8",
            success: function (data) {
//                console.log("result of get_children_data");
//                console.log(data);
                lvl2Data = data
            }
        });
            $('.casePanel-xs').animate({opacity: '0'}, '500', function () {
            $('#crimeScene-xs').activatePanel();
            $('#panelTitle-xs').html("Crime Scene");
            $('#header-xs').fadeIn();
            if (!crimeSceneInit) {
                createCrimeScene();
                overlayLvl1.forEach(function (elm) {
                    $('.crimeSceneOverlay.lvl1').append(elm);
                });
                overlayLvl2BindingsXs();
            }
            crimeSceneInit = true;
        });
    });
    $('.charactersBtn .menuBtn-xs').on('click', function () {
        $('.casePanel-xs').animate({opacity: '0'}, '500', function () {
            buildSuspectsXs();
            $('#characters-xs').activatePanel();
            $('#panelTitle-xs').html("Characters");
            $('#header-xs').fadeIn();
        });
    });
    $('.caseBtn .menuBtn-xs').on('click', function () {
        $('.casePanel-xs').animate({opacity: '0'}, '500', function () {
            $('#comments-xs').activatePanel();
            $('#panelTitle-xs').html("Solve It");
            $('#header-xs').fadeIn();
        });
    });

    $('#backToMain').on('click', function () {
        $('.casePanel-xs').animate({opacity: '0'}, '500', function () {
            $('#panelTitle').html("");
            $('#title-xs').activatePanel();
            $('#header-xs').fadeOut();
        });
    });
    $('#interrogateEm-xs').on('click', function () {
        $(this).hide();
        $('#suspectProfile-xs').hide();
        $('#suspectReaction-xs').fadeIn();
    });
})
}
function goBack1() {
    $('.crimeSceneOverlay.lvl2').hide().empty();
    $('.crimeSceneOverlay.lvl1').fadeIn();
    $('.crimeSceneInstruction').html('<h4 class="clue">The victim was found in the makeup room. Explore the crime scene by tapping over interesting spots in the photographs.</h4>').animate({marginTop: '0'});
}
function goBack2() {
    $('.crimeSceneOverlay.lvl2').hide().empty();
    $('.crimeSceneOverlay.lvl3').hide().empty();
    $('.crimeSceneOverlay.lvl1').fadeIn();
    $('.crimeSceneInstruction').html('<h4 class="clue">The victim was found in the makeup room. Explore the crime scene by tapping over interesting spots in the photographs.</h4>').animate({marginTop: '0'});
}
function goBack3() {
    $('.crimeSceneOverlay.lvl3').hide().empty();
    $('.crimeSceneOverlay.lvl2').fadeIn();
    $('.crimeSceneInstruction').html(lvl2Clues).animate({marginTop: lvl2CluePosy});
}
function overlayLvl3BindingsXs() {
    $("[id^=node2]").on('click', function () {
        var root = parseInt($(this).attr("id").split("_")[1]);
        var branch = parseInt($(this).attr("id").split("_")[2]);
        var $lvl3 = $('.crimeSceneOverlay.lvl3');
        lvl2Clues = $('.crimeSceneInstruction').html();
        $('.crimeSceneInstruction').html('<h4 class="clue">' + $(this).attr('title') + '</h4>');
        $('.crimeSceneOverlay.lvl2').hide();
        $lvl3.hide().empty();
        $lvl3.append('<img id="back2" src="' + $('.crimeSceneOverlay.lvl1 img').eq(0).attr('src') + '" onclick="goBack2()"/>');
        $lvl3.append('<img id="back3" src="' + $('.crimeSceneOverlay.lvl2 img').eq(1).attr('src') + '" onclick="goBack3()"/>');
        $lvl3.append(srcLvl3[root][branch]).fadeIn('500');
        $('.crimeSceneInstruction').append($lvl3.find('.clue').first());
        $lvl3.find('.clue').css('opacity', '0');
        $('.crimeSceneInstruction').animate({
            marginTop: "-" + $lvl3.find('.clue').outerHeight() + "px"
        });

    });
}
function overlayLvl2BindingsXs() {
    $("[id^=node1]").on('click', function () {
        var branch = parseInt($(this).attr("id").split("node1")[1]);
        var $lvl1 = $('.crimeSceneOverlay.lvl1');
        var $lvl2 = $('.crimeSceneOverlay.lvl2');
        var $lvl3 = $('.crimeSceneOverlay.lvl3');
        var $notes = $('.crimeSceneInstruction');
        $notes.html('<h4 class="clue">' + $(this).attr('title') + '</h4>');
        $lvl2.hide().empty();
        $lvl3.hide().empty();
        $lvl1.hide();
        $lvl2.append('<img id="back1" src="' + $('.crimeSceneOverlay.lvl1 img').first().attr('src') + '" onclick="goBack1()"/>');
        $lvl2.append(srcLvl2[branch]).delay(500).fadeIn('500');
        $notes.append($lvl2.find('.clue').first());
        $lvl2.find('.clue').css('opacity', '0');
        lvl2CluePosy = "-" + $lvl2.find('.clue').outerHeight() + "px";
        $notes.animate({
            marginTop: lvl2CluePosy
        });
        overlayLvl2[branch].forEach(function (elm) {
            $lvl2.append(elm);
        });
        overlayLvl3BindingsXs();
    });
}
function stopInterro() {
    $('#interrogateEm-xs').show();
    $('#suspectReaction-xs').hide();
    $('#suspectProfile-xs').fadeIn();
}