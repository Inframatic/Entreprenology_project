!
function(t, e) {
  t.rails !== e && t.error("jquery-ujs has already been loaded!");
  var n, i = t(document);
  t.rails = n = {
    linkClickSelector: "a[data-confirm], a[data-method], a[data-remote], a[data-disable-with]",
    buttonClickSelector: "button[data-remote]",
    inputChangeSelector: "select[data-remote], input[data-remote], textarea[data-remote]",
    formSubmitSelector: "form",
    formInputClickSelector: "form input[type=submit], form input[type=image], form button[type=submit], form button:not([type])",
    disableSelector: "input[data-disable-with], button[data-disable-with], textarea[data-disable-with]",
    enableSelector: "input[data-disable-with]:disabled, button[data-disable-with]:disabled, textarea[data-disable-with]:disabled",
    requiredInputSelector: "input[name][required]:not([disabled]),textarea[name][required]:not([disabled])",
    fileInputSelector: "input[type=file]",
    linkDisableSelector: "a[data-disable-with]",
    CSRFProtection: function(e) {
      var n = t('meta[name="csrf-token"]').attr("content");
      n && e.setRequestHeader("X-CSRF-Token", n)
    },
    fire: function(e, n, i) {
      var o = t.Event(n);
      return e.trigger(o, i), o.result !== !1
    },
    confirm: function(t) {
      return confirm(t)
    },
    ajax: function(e) {
      return t.ajax(e)
    },
    href: function(t) {
      return t.attr("href")
    },
    handleRemote: function(i) {
      var o, r, a, l, u, s, c, d;
      if (n.fire(i, "ajax:before")) {
        if (l = i.data("cross-domain"), u = l === e ? null : l, s = i.data("with-credentials") || null, c = i.data("type") || t.ajaxSettings && t.ajaxSettings.dataType, i.is("form")) {
          o = i.attr("method"), r = i.attr("action"), a = i.serializeArray();
          var f = i.data("ujs:submit-button");
          f && (a.push(f), i.data("ujs:submit-button", null))
        } else i.is(n.inputChangeSelector) ? (o = i.data("method"), r = i.data("url"), a = i.serialize(), i.data("params") && (a = a + "&" + i.data("params"))) : i.is(n.buttonClickSelector) ? (o = i.data("method") || "get", r = i.data("url"), a = i.serialize(), i.data("params") && (a = a + "&" + i.data("params"))) : (o = i.data("method"), r = n.href(i), a = i.data("params") || null);
        d = {
          type: o || "GET",
          data: a,
          dataType: c,
          beforeSend: function(t, o) {
            return o.dataType === e && t.setRequestHeader("accept", "*/*;q=0.5, " + o.accepts.script), n.fire(i, "ajax:beforeSend", [t, o])
          },
          success: function(t, e, n) {
            i.trigger("ajax:success", [t, e, n])
          },
          complete: function(t, e) {
            i.trigger("ajax:complete", [t, e])
          },
          error: function(t, e, n) {
            i.trigger("ajax:error", [t, e, n])
          },
          crossDomain: u
        }, s && (d.xhrFields = {
          withCredentials: s
        }), r && (d.url = r);
        var p = n.ajax(d);
        return i.trigger("ajax:send", p), p
      }
      return !1
    },
    handleMethod: function(i) {
      var o = n.href(i),
        r = i.data("method"),
        a = i.attr("target"),
        l = t("meta[name=csrf-token]").attr("content"),
        u = t("meta[name=csrf-param]").attr("content"),
        s = t('<form method="post" action="' + o + '"></form>'),
        c = '<input name="_method" value="' + r + '" type="hidden" />';
      u !== e && l !== e && (c += '<input name="' + u + '" value="' + l + '" type="hidden" />'), a && s.attr("target", a), s.hide().append(c).appendTo("body"), s.submit()
    },
    disableFormElements: function(e) {
      e.find(n.disableSelector).each(function() {
        var e = t(this),
          n = e.is("button") ? "html" : "val";
        e.data("ujs:enable-with", e[n]()), e[n](e.data("disable-with")), e.prop("disabled", !0)
      })
    },
    enableFormElements: function(e) {
      e.find(n.enableSelector).each(function() {
        var e = t(this),
          n = e.is("button") ? "html" : "val";
        e.data("ujs:enable-with") && e[n](e.data("ujs:enable-with")), e.prop("disabled", !1)
      })
    },
    allowAction: function(t) {
      var e, i = t.data("confirm"),
        o = !1;
      return i ? (n.fire(t, "confirm") && (o = n.confirm(i), e = n.fire(t, "confirm:complete", [o])), o && e) : !0
    },
    blankInputs: function(e, n, i) {
      var o, r, a = t(),
        l = n || "input,textarea",
        u = e.find(l);
      return u.each(function() {
        if (o = t(this), r = o.is("input[type=checkbox],input[type=radio]") ? o.is(":checked") : o.val(), !r == !i) {
          if (o.is("input[type=radio]") && u.filter('input[type=radio]:checked[name="' + o.attr("name") + '"]').length) return !0;
          a = a.add(o)
        }
      }), a.length ? a : !1
    },
    nonBlankInputs: function(t, e) {
      return n.blankInputs(t, e, !0)
    },
    stopEverything: function(e) {
      return t(e.target).trigger("ujs:everythingStopped"), e.stopImmediatePropagation(), !1
    },
    disableElement: function(t) {
      t.data("ujs:enable-with", t.html()), t.html(t.data("disable-with")), t.bind("click.railsDisable", function(t) {
        return n.stopEverything(t)
      })
    },
    enableElement: function(t) {
      t.data("ujs:enable-with") !== e && (t.html(t.data("ujs:enable-with")), t.removeData("ujs:enable-with")), t.unbind("click.railsDisable")
    }
  }, n.fire(i, "rails:attachBindings") && (t.ajaxPrefilter(function(t, e, i) {
    t.crossDomain || n.CSRFProtection(i)
  }), i.delegate(n.linkDisableSelector, "ajax:complete", function() {
    n.enableElement(t(this))
  }), i.delegate(n.linkClickSelector, "click.rails", function(i) {
    var o = t(this),
      r = o.data("method"),
      a = o.data("params");
    if (!n.allowAction(o)) return n.stopEverything(i);
    if (o.is(n.linkDisableSelector) && n.disableElement(o), o.data("remote") !== e) {
      if (!(!i.metaKey && !i.ctrlKey || r && "GET" !== r || a)) return !0;
      var l = n.handleRemote(o);
      return l === !1 ? n.enableElement(o) : l.error(function() {
        n.enableElement(o)
      }), !1
    }
    return o.data("method") ? (n.handleMethod(o), !1) : void 0
  }), i.delegate(n.buttonClickSelector, "click.rails", function(e) {
    var i = t(this);
    return n.allowAction(i) ? (n.handleRemote(i), !1) : n.stopEverything(e)
  }), i.delegate(n.inputChangeSelector, "change.rails", function(e) {
    var i = t(this);
    return n.allowAction(i) ? (n.handleRemote(i), !1) : n.stopEverything(e)
  }), i.delegate(n.formSubmitSelector, "submit.rails", function(i) {
    var o = t(this),
      r = o.data("remote") !== e,
      a = n.blankInputs(o, n.requiredInputSelector),
      l = n.nonBlankInputs(o, n.fileInputSelector);
    if (!n.allowAction(o)) return n.stopEverything(i);
    if (a && o.attr("novalidate") == e && n.fire(o, "ajax:aborted:required", [a])) return n.stopEverything(i);
    if (r) {
      if (l) {
        setTimeout(function() {
          n.disableFormElements(o)
        }, 13);
        var u = n.fire(o, "ajax:aborted:file", [l]);
        return u || setTimeout(function() {
          n.enableFormElements(o)
        }, 13), u
      }
      return n.handleRemote(o), !1
    }
    setTimeout(function() {
      n.disableFormElements(o)
    }, 13)
  }), i.delegate(n.formInputClickSelector, "click.rails", function(e) {
    var i = t(this);
    if (!n.allowAction(i)) return n.stopEverything(e);
    var o = i.attr("name"),
      r = o ? {
        name: o,
        value: i.val()
      } : null;
    i.closest("form").data("ujs:submit-button", r)
  }), i.delegate(n.formSubmitSelector, "ajax:beforeSend.rails", function(e) {
    this == e.target && n.disableFormElements(t(this))
  }), i.delegate(n.formSubmitSelector, "ajax:complete.rails", function(e) {
    this == e.target && n.enableFormElements(t(this))
  }), t(function() {
    var e = t("meta[name=csrf-token]").attr("content"),
      n = t("meta[name=csrf-param]").attr("content");
    t('form input[name="' + n + '"]').val(e)
  }))
}(jQuery), function(t, e) {
  "object" == typeof exports ? module.exports = e() : "function" == typeof define && define.amd ? define(e) : t.Spinner = e()
}(this, function() {
  "use strict";
  function t(t, e) {
    var n, i = document.createElement(t || "div");
    for (n in e) i[n] = e[n];
    return i
  }
  function e(t) {
    for (var e = 1, n = arguments.length; n > e; e++) t.appendChild(arguments[e]);
    return t
  }
  function n(t, e, n, i) {
    var o = ["opacity", e, ~~ (100 * t), n, i].join("-"),
      r = .01 + 100 * (n / i),
      a = Math.max(1 - (1 - t) / e * (100 - r), t),
      l = s.substring(0, s.indexOf("Animation")).toLowerCase(),
      u = l && "-" + l + "-" || "";
    return d[o] || (f.insertRule("@" + u + "keyframes " + o + "{" + "0%{opacity:" + a + "}" + r + "%{opacity:" + t + "}" + (r + .01) + "%{opacity:1}" + (r + e) % 100 + "%{opacity:" + t + "}" + "100%{opacity:" + a + "}" + "}", f.cssRules.length), d[o] = 1), o
  }
  function i(t, e) {
    var n, i, o = t.style;
    if (void 0 !== o[e]) return e;
    for (e = e.charAt(0).toUpperCase() + e.slice(1), i = 0; i < c.length; i++) if (n = c[i] + e, void 0 !== o[n]) return n
  }
  function o(t, e) {
    for (var n in e) t.style[i(t, n) || n] = e[n];
    return t
  }
  function r(t) {
    for (var e = 1; e < arguments.length; e++) {
      var n = arguments[e];
      for (var i in n) void 0 === t[i] && (t[i] = n[i])
    }
    return t
  }
  function a(t) {
    for (var e = {
      x: t.offsetLeft,
      y: t.offsetTop
    }; t = t.offsetParent;) e.x += t.offsetLeft, e.y += t.offsetTop;
    return e
  }
  function l(t) {
    return "undefined" == typeof this ? new l(t) : (this.opts = r(t || {}, l.defaults, p), void 0)
  }
  function u() {
    function n(e, n) {
      return t("<" + e + ' xmlns="urn:schemas-microsoft.com:vml" class="spin-vml">', n)
    }
    f.addRule(".spin-vml", "behavior:url(#default#VML)"), l.prototype.lines = function(t, i) {
      function r() {
        return o(n("group", {
          coordsize: s + " " + s,
          coordorigin: -u + " " + -u
        }), {
          width: s,
          height: s
        })
      }
      function a(t, a, l) {
        e(d, e(o(r(), {
          rotation: 360 / i.lines * t + "deg",
          left: ~~a
        }), e(o(n("roundrect", {
          arcsize: i.corners
        }), {
          width: u,
          height: i.width,
          left: i.radius,
          top: -i.width >> 1,
          filter: l
        }), n("fill", {
          color: i.color,
          opacity: i.opacity
        }), n("stroke", {
          opacity: 0
        }))))
      }
      var l, u = i.length + i.width,
        s = 2 * u,
        c = 2 * -(i.width + i.length) + "px",
        d = o(r(), {
          position: "absolute",
          top: c,
          left: c
        });
      if (i.shadow) for (l = 1; l <= i.lines; l++) a(l, -2, "progid:DXImageTransform.Microsoft.Blur(pixelradius=2,makeshadow=1,shadowopacity=.3)");
      for (l = 1; l <= i.lines; l++) a(l);
      return e(t, d)
    }, l.prototype.opacity = function(t, e, n, i) {
      var o = t.firstChild;
      i = i.shadow && i.lines || 0, o && e + i < o.childNodes.length && (o = o.childNodes[e + i], o = o && o.firstChild, o = o && o.firstChild, o && (o.opacity = n))
    }
  }
  var s, c = ["webkit", "Moz", "ms", "O"],
    d = {},
    f = function() {
      var n = t("style", {
        type: "text/css"
      });
      return e(document.getElementsByTagName("head")[0], n), n.sheet || n.styleSheet
    }(),
    p = {
      lines: 12,
      length: 7,
      width: 5,
      radius: 10,
      rotate: 0,
      corners: 1,
      color: "#000",
      direction: 1,
      speed: 1,
      trail: 100,
      opacity: .25,
      fps: 20,
      zIndex: 2e9,
      className: "spinner",
      top: "auto",
      left: "auto",
      position: "relative"
    };
  l.defaults = {}, r(l.prototype, {
    spin: function(e) {
      this.stop();
      var n, i, r = this,
        l = r.opts,
        u = r.el = o(t(0, {
          className: l.className
        }), {
          position: l.position,
          width: 0,
          zIndex: l.zIndex
        }),
        c = l.radius + l.length + l.width;
      if (e && (e.insertBefore(u, e.firstChild || null), i = a(e), n = a(u), o(u, {
        left: ("auto" == l.left ? i.x - n.x + (e.offsetWidth >> 1) : parseInt(l.left, 10) + c) + "px",
        top: ("auto" == l.top ? i.y - n.y + (e.offsetHeight >> 1) : parseInt(l.top, 10) + c) + "px"
      })), u.setAttribute("role", "progressbar"), r.lines(u, r.opts), !s) {
        var d, f = 0,
          p = (l.lines - 1) * (1 - l.direction) / 2,
          h = l.fps,
          m = h / l.speed,
          v = (1 - l.opacity) / (m * l.trail / 100),
          g = m / l.lines;
        !
        function w() {
          f++;
          for (var t = 0; t < l.lines; t++) d = Math.max(1 - (f + (l.lines - t) * g) % m * v, l.opacity), r.opacity(u, t * l.direction + p, d, l);
          r.timeout = r.el && setTimeout(w, ~~ (1e3 / h))
        }()
      }
      return r
    },
    stop: function() {
      var t = this.el;
      return t && (clearTimeout(this.timeout), t.parentNode && t.parentNode.removeChild(t), this.el = void 0), this
    },
    lines: function(i, r) {
      function a(e, n) {
        return o(t(), {
          position: "absolute",
          width: r.length + r.width + "px",
          height: r.width + "px",
          background: e,
          boxShadow: n,
          transformOrigin: "left",
          transform: "rotate(" + ~~ (360 / r.lines * u + r.rotate) + "deg) translate(" + r.radius + "px" + ",0)",
          borderRadius: (r.corners * r.width >> 1) + "px"
        })
      }
      for (var l, u = 0, c = (r.lines - 1) * (1 - r.direction) / 2; u < r.lines; u++) l = o(t(), {
        position: "absolute",
        top: 1 + ~ (r.width / 2) + "px",
        transform: r.hwaccel ? "translate3d(0,0,0)" : "",
        opacity: r.opacity,
        animation: s && n(r.opacity, r.trail, c + u * r.direction, r.lines) + " " + 1 / r.speed + "s linear infinite"
      }), r.shadow && e(l, o(a("#000", "0 0 4px #000"), {
        top: "2px"
      })), e(i, e(l, a(r.color, "0 0 1px rgba(0,0,0,.1)")));
      return i
    },
    opacity: function(t, e, n) {
      e < t.childNodes.length && (t.childNodes[e].style.opacity = n)
    }
  });
  var h = o(t("group"), {
    behavior: "url(#default#VML)"
  });
  return !i(h, "transform") && h.adj ? u() : s = i(h, "animation"), l
}), function(t) {
  if ("object" == typeof exports) t(require("jquery"), require("spin"));
  else if ("function" == typeof define && define.amd) define(["jquery", "spin"], t);
  else {
    if (!window.Spinner) throw new Error("Spin.js not present");
    t(window.jQuery, window.Spinner)
  }
}(function(t, e) {
  t.fn.spin = function(n, i) {
    return this.each(function() {
      var o = t(this),
        r = o.data();
      r.spinner && (r.spinner.stop(), delete r.spinner), n !== !1 && (n = t.extend({
        color: i || o.css("color")
      }, t.fn.spin.presets[n] || n), r.spinner = new e(n).spin(this))
    })
  }, t.fn.spin.presets = {
    tiny: {
      lines: 8,
      length: 2,
      width: 2,
      radius: 3
    },
    small: {
      lines: 8,
      length: 4,
      width: 3,
      radius: 5
    },
    large: {
      lines: 10,
      length: 8,
      width: 4,
      radius: 8
    }
  }
}), $.fn.spin.presets.loader = {
  lines: 10,
  length: 4,
  width: 3,
  radius: 7,
  corners: 1,
  rotate: 0,
  direction: 1,
  speed: 1.8,
  trail: 56,
  shadow: !1,
  hwaccel: !0,
  className: "spinner",
  top: "auto",
  left: "auto"
}, function() {
  window.delay = function(t, e) {
    return setTimeout(e, t)
  }, window.analytics = function() {
    var t;
    return t = window.location.protocol + "//" + window.location.hostname + window.location.pathname + window.location.search, ga("send", "pageview", {
      page: window.location.pathname,
      title: window.document.title,
      location: t
    }), window.pSUPERFLY ? window.pSUPERFLY.virtualPage(window.location.pathname, window.document.title) : void 0
  }, window.startApplication = function() {
    var t;
    return t || (t = null), $("#nav_drop a").on("click", function() {
      return !1
    }), $("#nav_drop").on("mouseenter", function() {
      return clearTimeout(t), $("#nav_down").show()
    }).on("mouseleave", function() {
      return t = setTimeout(function() {
        return $("#nav_down").hide()
      }, 600)
    }), $("#nav_down").on("mouseenter", function() {
      return clearTimeout(t)
    }).on("mouseleave", function() {
      return t = setTimeout(function() {
        return $("#nav_down").hide()
      }, 600)
    }), $("nav_drop").on("touchend", function() {
      return $("#nav_down").toggle()
    }), $("#lightning_identifier a").on("click", function() {
      return !1
    }), $("#lightning_identifier").on("mouseenter", function() {
      return clearTimeout(t), $("#lightning_drop").show(), $("#lightning_identifier").addClass("active")
    }).on("mouseleave", function() {
      return t = setTimeout(function() {
        return $("#lightning_drop").hide(), $("#lightning_identifier").removeClass("active")
      }, 600)
    }), $("#lightning_drop").on("mouseenter", function() {
      return clearTimeout(t)
    }).on("mouseleave", function() {
      return t = setTimeout(function() {
        return $("#lightning_drop").hide(), $("#lightning_identifier").removeClass("active")
      }, 600)
    }), $("#lightning_identifier").on("touchend", function() {
      return $("#lightning_drop").toggle(), $("#lightning_identifier").toggleClass("active")
    })
  }
}.call(this), function() {
  window.startForm = function() {
    return $("form.keyable").on("keypress", function(t) {
      return 13 === t.keyCode ? ($(this).submit(), !1) : void 0
    }), $("a.submit_form").on("click", function() {
      return $(this).closest("form").submit(), !1
    }), $(".pane_input").on("keypress", function() {
      return $(this).parent("form").addClass("active")
    }), $(".pane_input").on("focus", function() {
      return $(".pane_input, label").removeClass("active"), $(this).next("p.explain").slideDown(), $(this).addClass("active")
    }), $(".pane_input").on("blur", function() {
      return $(".pane_input, label").removeClass("active"), $(this).next("p.explain").slideUp()
    }), $("#delete_post").on("click", function() {
      return $("#delete_post_link").click(), !1
    })
  }
}.call(this), function() {
  window.startHome = function() {
    var t;
    return t = function() {
      return console.log("tick"), $("article.post.active").next().addClass("active"), $("article.post.active").first().removeClass("active")
    }, $("#lightning").hide(), setTimeout(function() {
      return $("#subtitle").fadeIn("slow"), $("#lightning").fadeIn("slow")
    }, 1e3), setTimeout(function() {
      return $("article.post").first().addClass("active"), setTimeout(function() {
        return $("article.title").children("a").addClass("active")
      }, 1500), setTimeout(function() {
        return $("article.title").children("a").addClass("done")
      }, 4700), window.ticker = setInterval(t, 6e3)
    }, 3e3)
  }
}.call(this), function() {
  var t, e, n, i, o, r, a, l, u, s, c, d, f, p, h, m, v, g, w, b, y, x, k, S, $, E, C, T, j, _, A, R, I, N, q, F, L, D, H, P, M, z, O, X, B, U = {}.hasOwnProperty,
    Y = [].indexOf ||
  function(t) {
    for (var e = 0, n = this.length; n > e; e++) if (e in this && this[e] === t) return e;
    return -1
  };
  a = 10, d = null, A = null, x = null, E = {}, s = null, D = (null != (B = document.cookie.match(/request_method=(\w+)/)) ? B[1].toUpperCase() : void 0) || "", X = null, v = function(t) {
    var e;
    return z("page:fetch"), e = F(t), null != X && X.abort(), X = new XMLHttpRequest, X.open("GET", e, !0), X.setRequestHeader("Accept", "text/html, application/xhtml+xml, application/xml"), X.setRequestHeader("X-XHR-Referer", A), X.onload = function() {
      var e;
      return z("page:receive"), (e = j()) ? (R(t), l.apply(null, h(e)), I(), document.location.hash ? document.location.href = document.location.href : P(), z("page:load")) : document.location.href = t
    }, X.onloadend = function() {
      return X = null
    }, X.onabort = function() {
      return q()
    }, X.onerror = function() {
      return document.location.href = t
    }, X.send()
  }, m = function(t) {
    var e;
    return r(), e = E[t], null != X && X.abort(), l(e.title, e.body), _(e), z("page:restore")
  }, r = function() {
    return E[d.position] = {
      url: document.location.href,
      body: document.body,
      title: document.title,
      positionY: window.pageYOffset,
      positionX: window.pageXOffset
    }, u(a)
  }, T = function(t) {
    return null == t && (t = a), /^[\d]+$/.test(t) ? a = parseInt(t) : void 0
  }, u = function(t) {
    var e, n;
    for (e in E) U.call(E, e) && (n = E[e], e <= d.position - t && (E[e] = null))
  }, l = function(e, n, i, o) {
    return document.title = e, document.documentElement.replaceChild(n, document.body), null != i && t.update(i), L(), o && f(), d = window.history.state, z("page:change")
  }, f = function() {
    var t, e, n, i, o, r, a, l, u, s, c, d;
    for (r = Array.prototype.slice.call(document.body.querySelectorAll('script:not([data-turbolinks-eval="false"])')), a = 0, u = r.length; u > a; a++) if (o = r[a], "" === (c = o.type) || "text/javascript" === c) {
      for (e = document.createElement("script"), d = o.attributes, l = 0, s = d.length; s > l; l++) t = d[l], e.setAttribute(t.name, t.value);
      e.appendChild(document.createTextNode(o.innerHTML)), i = o.parentNode, n = o.nextSibling, i.removeChild(o), i.insertBefore(e, n)
    }
  }, L = function() {
    var t, e, n, i;
    for (e = Array.prototype.slice.call(document.body.getElementsByTagName("noscript")), n = 0, i = e.length; i > n; n++) t = e[n], t.parentNode.removeChild(t)
  }, R = function(t) {
    return t !== A ? window.history.pushState({
      turbolinks: !0,
      position: d.position + 1
    }, "", t) : void 0
  }, I = function() {
    var t, e;
    return (t = X.getResponseHeader("X-XHR-Redirected-To")) ? (e = F(t) === t ? document.location.hash : "", window.history.replaceState(d, "", t + e)) : void 0
  }, q = function() {
    return window.history.replaceState({
      turbolinks: !0,
      position: Date.now()
    }, "", document.location.href)
  }, N = function() {
    return d = window.history.state
  }, _ = function(t) {
    return window.scrollTo(t.positionX, t.positionY)
  }, P = function() {
    return window.scrollTo(0, 0)
  }, F = function(t) {
    var e;
    return e = t, null == t.href && (e = document.createElement("A"), e.href = t), e.href.replace(e.hash, "")
  }, z = function(t) {
    var e;
    return e = document.createEvent("Events"), e.initEvent(t, !0, !0), document.dispatchEvent(e)
  }, C = function() {
    return !z("page:before-change")
  }, j = function() {
    var t, e, n, i, o, r;
    return e = function() {
      var t;
      return 400 <= (t = X.status) && 600 > t
    }, r = function() {
      return X.getResponseHeader("Content-Type").match(/^(?:text\/html|application\/xhtml\+xml|application\/xml)(?:;|$)/)
    }, i = function(t) {
      var e, n, i, o, r;
      for (o = t.head.childNodes, r = [], n = 0, i = o.length; i > n; n++) e = o[n], null != ("function" == typeof e.getAttribute ? e.getAttribute("data-turbolinks-track") : void 0) && r.push(e.src || e.href);
      return r
    }, t = function(t) {
      var e;
      return x || (x = i(document)), e = i(t), e.length !== x.length || o(e, x).length !== x.length
    }, o = function(t, e) {
      var n, i, o, r, a;
      for (t.length > e.length && (r = [e, t], t = r[0], e = r[1]), a = [], i = 0, o = t.length; o > i; i++) n = t[i], Y.call(e, n) >= 0 && a.push(n);
      return a
    }, !e() && r() && (n = s(X.responseText), n && !t(n)) ? n : void 0
  }, h = function(e) {
    var n;
    return n = e.querySelector("title"), [null != n ? n.textContent : void 0, e.body, t.get(e).token, "runScripts"]
  }, t = {
    get: function(t) {
      var e;
      return null == t && (t = document), {
        node: e = t.querySelector('meta[name="csrf-token"]'),
        token: null != e ? "function" == typeof e.getAttribute ? e.getAttribute("content") : void 0 : void 0
      }
    },
    update: function(t) {
      var e;
      return e = this.get(), null != e.token && null != t && e.token !== t ? e.node.setAttribute("content", t) : void 0
    }
  }, n = function() {
    var t, e, n, i, o, r;
    e = function(t) {
      return (new DOMParser).parseFromString(t, "text/html")
    }, t = function(t) {
      var e;
      return e = document.implementation.createHTMLDocument(""), e.documentElement.innerHTML = t, e
    }, n = function(t) {
      var e;
      return e = document.implementation.createHTMLDocument(""), e.open("replace"), e.write(t), e.close(), e
    };
    try {
      if (window.DOMParser) return o = e("<html><body><p>test"), e
    } catch (a) {
      return i = a, o = t("<html><body><p>test"), t
    } finally {
      if (1 !== (null != o ? null != (r = o.body) ? r.childNodes.length : void 0 : void 0)) return n
    }
  }, y = function(t) {
    return t.defaultPrevented ? void 0 : (document.removeEventListener("click", g, !1), document.addEventListener("click", g, !1))
  }, g = function(t) {
    var e;
    return t.defaultPrevented || (e = p(t), "A" !== e.nodeName || w(t, e)) ? void 0 : (C() || O(e.href), t.preventDefault())
  }, p = function(t) {
    var e;
    for (e = t.target; e.parentNode && "A" !== e.nodeName;) e = e.parentNode;
    return e
  }, c = function(t) {
    return location.protocol !== t.protocol || location.host !== t.host
  }, e = function(t) {
    return (t.hash && F(t)) === F(location) || t.href === location.href + "#"
  }, S = function(t) {
    var e;
    return e = F(t), e.match(/\.[a-z]+(\?.*)?$/g) && !e.match(/\.html?(\?.*)?$/g)
  }, k = function(t) {
    for (var e; !e && t !== document;) e = null != t.getAttribute("data-no-turbolink"), t = t.parentNode;
    return e
  }, M = function(t) {
    return 0 !== t.target.length
  }, $ = function(t) {
    return t.which > 1 || t.metaKey || t.ctrlKey || t.shiftKey || t.altKey
  }, w = function(t, n) {
    return c(n) || e(n) || S(n) || k(n) || M(n) || $(t)
  }, b = function() {
    return q(), N(), s = n(), document.addEventListener("click", y, !0), window.addEventListener("popstate", function(t) {
      var e;
      return e = t.state, (null != e ? e.turbolinks : void 0) ? E[e.position] ? m(e.position) : O(t.target.location.href) : void 0
    }, !1)
  }, o = window.history && window.history.pushState && window.history.replaceState && void 0 !== window.history.state, i = !navigator.userAgent.match(/CriOS\//), H = "GET" === D || "" === D, o && i && H ? (O = function(t) {
    return A = document.location.href, r(), v(t)
  }, b()) : O = function(t) {
    return document.location.href = t
  }, this.Turbolinks = {
    visit: O,
    pagesCached: T
  }
}.call(this), function() {
  var t, e, n;
  e = function(t, e) {
    return setTimeout(e, t)
  }, n = function() {
    return window.ticker || (window.ticker = null), clearInterval(window.ticker), startApplication(), $("form").length > 0 && startForm(), $("#home").length > 0 ? startHome() : void 0
  }, t = function() {
    var t;
    return t = window.location.protocol + "//" + window.location.hostname + window.location.pathname + window.location.search, ga("send", "pageview", {
      page: window.location.pathname,
      title: window.document.title,
      location: t
    }), window.pSUPERFLY ? window.pSUPERFLY.virtualPage(window.location.pathname, window.document.title) : void 0
  }, $(function() {
    return n()
  }), $(document).on("page:fetch", function() {
    return $("#loading").spin("loader", "black"), $("div.spinner").css("opacity", 1)
  }), $(document).on("page:change", function() {
    return n(), t(), $("div.spinner").css("opacity", 0), $("#loading").spin(!1)
  })
}.call(this);