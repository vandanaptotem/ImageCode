/*
 TimelineJS - ver. 2.33.1 - 2014-06-24
 Copyright (c) 2012-2013 Northwestern University
 a project of the Northwestern University Knight Lab, originally created by Zach Wise
 https://github.com/NUKnightLab/TimelineJS
 This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0.
 If a copy of the MPL was not distributed with this file, You can obtain one at http://mozilla.org/MPL/2.0/.
 */
/* **********************************************
 Begin Embed.CDN.Generator.js
 ********************************************** *//* Support Timeline Embed Generator web form (becomes storyjs-embed-generator.js) */
function getScriptPath(e) {
    var t = document.getElementsByTagName("script"), n = "";
    for (var r = 0; r < t.length; r++)t[r].src.match(e) && (n = t[r].src);
    return n.split("?")[0].split("/").slice(0, -1).join("/") + "/"
}
function getUrlVars(e) {
    var t = [], n, r, i = e.toString();
    i.match("&#038;") ? i = i.replace("&#038;", "&") : i.match("&#38;") ? i = i.replace("&#38;", "&") : i.match("&amp;") && (i = i.replace("&amp;", "&"));
    i.match("#") && (i = i.split("#")[0]);
    r = i.slice(i.indexOf("?") + 1).split("&");
    for (var s = 0; s < r.length; s++) {
        n = r[s].split("=");
        t.push(n[0]);
        t[n[0]] = n[1]
    }
    return t
}
function getLinkAndIframe() {
    var e = {}, t = document.getElementById("embed-source-url"), n = document.getElementById("embed-width"), r = document.getElementById("embed-height"), i = document.getElementById("embed-maptype"), s = document.getElementById("embed-language"), o = document.getElementById("embed_code"), u = document.getElementById("embed-font"), a = document.getElementById("embed-wordpressplugin"), f = document.getElementById("embed-startatend"), l = document.getElementById("embed-hashbookmark"), c = document.getElementById("embed-startzoomadjust"), h = document.getElementById("embed-startatslide"), p = document.getElementById("embed-debug"), d = document.getElementById("embed-googlemapkey"), v = !1, m = !1, g = !1, y, b, w, E, S;
    t.value.match("docs.google.com") ? S = VMM.Timeline.DataObj.model.googlespreadsheet.extractSpreadsheetKey(t.value) : t.value == "" ? S = "0Agl_Dv6iEbDadHdKcHlHcTB5bzhvbF9iTWwyMmJHdkE" : S = t.value;
    f.checked && (v = !0);
    l.checked && (m = !0);
    p.checked && (g = !0);
    E = "[timeline ";
    n.value > 0 && (E += "width='" + n.value + "' ");
    r.value > 0 && (E += "height='" + n.value + "' ");
    E += "font='" + u.value + "' ";
    E += "maptype='" + i.value + "' ";
    E += "lang='" + s.value + "' ";
    E += "src='" + t.value + "' ";
    v && (E += "start_at_end='" + v + "' ");
    m && (E += "hash_bookmark='" + m + "' ");
    g && (E += "debug='" + g + "' ");
    d.value != "" && (E += "gmap_key='" + d.value + "' ");
    parseInt(h.value, 10) > 0 && (E += "start_at_slide='" + parseInt(h.value, 10) + "' ");
    parseInt(c.value, 10) > 0 && (E += "start_zoom_adjust='" + parseInt(c.value, 10) + "' ");
    E += "]";
    e.wordpress = E;
    w = generator_embed_path + "?source=" + S;
    w += "&font=" + u.value;
    w += "&maptype=" + i.value;
    w += "&lang=" + s.value;
    v && (w += "&start_at_end=" + v);
    m && (w += "&hash_bookmark=" + m);
    g && (w += "&debug=" + g);
    parseInt(h.value, 10) > 0 && (w += "&start_at_slide=" + parseInt(h.value, 10));
    parseInt(c.value, 10) > 0 && (w += "&start_zoom_adjust=" + parseInt(c.value, 10));
    d.value != "" && (w += "&gmap_key=" + d.value);
    n.value > 0 && (w += "&width=" + n.value);
    r.value > 0 && (w += "&height=" + r.value);
    y = "<iframe src='" + w + "'";
    if (n.value > 0 || n.value.match("%"))y += " width='" + n.value + "'";
    if (r.value > 0 || r.value.match("%"))y += " height='" + r.value + "'";
    y += " frameborder='0'></iframe>";
    e.iframe = y;
    e.link = w;
    a.checked ? e.copybox = E : e.copybox = y;
    return e
}
function updateEmbedCode(e, t) {
    var n = document.getElementById("embed_code"), r = getLinkAndIframe();
    n.value = r.copybox;
    jQuery("#preview-embed-link").attr("href", r.link);
    jQuery("#preview-embed-iframe").html(r.iframe);
    jQuery("#preview-embed").css("display", "block")
}
if (typeof generator_embed_path == "undefined" || typeof generator_embed_path == "undefined") {
    var generator_embed_path = getScriptPath("storyjs-embed-generator.js").split("js/")[0];
    generator_embed_path.match("http") ? generator_embed_path = generator_embed_path : generator_embed_path == "/" ? generator_embed_path = "index.html" : generator_embed_path += "index.html"
}
;