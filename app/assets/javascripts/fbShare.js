/**
 * Created with JetBrains RubyMine.
 * User: rushabhhathi
 * Date: 08/11/13
 * Time: 21:50
 * To change this template use File | Settings | File Templates.
 */
var fbSdkLoader;

fbSdkLoader = function() {
        window.fbAsyncInit = function() {
            var initConfig;
            initConfig = {
                appId: "636324466384812",
                channelUrl: "/channel.html",
                status: true,
                cookie: true,
                xfbml: true,
                oauth: true
            };
            return FB.init(initConfig);
        };
        return (function(d, debug) {
            var id, js, ref;
            js = void 0;
            id = "facebook-jssdk";
            ref = d.getElementsByTagName("script")[0];
            if (d.getElementById(id)) {
                return;
            }
            js = d.createElement("script");
            js.id = id;
            js.async = true;
            js.src = "//connect.facebook.net/en_US/all" + (debug ? "/debug" : "") + ".js";
            return ref.parentNode.insertBefore(js, ref);
        })(document, false);

};

fbSdkLoader();

