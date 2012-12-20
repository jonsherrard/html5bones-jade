#
# HTML5 Shiv v3.6.2pre | @afarkas @jdalton @jon_neal @rem | MIT/GPL2 Licensed
#
((j, f) ->
  s = (a, b) ->
    c = a.createElement("p")
    m = a.getElementsByTagName("head")[0] or a.documentElement
    c.innerHTML = "x<style>" + b + "</style>"
    m.insertBefore c.lastChild, m.firstChild
  o = ->
    a = d.elements
    (if "string" is typeof a then a.split(" ") else a)
  n = (a) ->
    b = t[a[u]]
    b or (b = {}
    p++
    a[u] = p
    t[p] = b
    )
    b
  v = (a, b, c) ->
    b or (b = f)
    return b.createElement(a)  if e
    c or (c = n(b))
    b = (if c.cache[a] then c.cache[a].cloneNode() else (if y.test(a) then (c.cache[a] = c.createElem(a)).cloneNode() else c.createElem(a)))
    (if b.canHaveChildren and not z.test(a) then c.frag.appendChild(b) else b)
  A = (a, b) ->
    unless b.cache
      b.cache = {}
      b.createElem = a.createElement
      b.createFrag = a.createDocumentFragment
      b.frag = b.createFrag()
    a.createElement = (c) ->
      (if not d.shivMethods then b.createElem(c) else v(c, a, b))

    a.createDocumentFragment = Function("h,f", "return function(){var n=f.cloneNode(),c=n.createElement;h.shivMethods&&(" + o().join().replace(/\w+/g, (a) ->
      b.createElem a
      b.frag.createElement a
      "c(\"" + a + "\")"
    ) + ");return n}")(d, b.frag)
  w = (a) ->
    a or (a = f)
    b = n(a)
    b.hasCSS = !!s(a, "article,aside,figcaption,figure,footer,header,hgroup,nav,section{display:block}mark{background:#FF0;color:#000}")  if d.shivCSS and not q and not b.hasCSS
    e or A(a, b)
    a
  B = (a) ->
    b = undefined
    c = a.attributes
    m = c.length
    f = a.ownerDocument.createElement(l + ":" + a.nodeName)

    while m--
      b = c[m]
      b.specified and f.setAttribute(b.nodeName, b.nodeValue)
    f.style.cssText = a.style.cssText
    f
  x = (a) ->
    b = ->
      clearTimeout d._removeSheetTimer
      c and c.removeNode(not 0)
      c = null
    c = undefined
    f = undefined
    d = n(a)
    e = a.namespaces
    j = a.parentWindow
    return a  if not C or a.printShived
    "undefined" is typeof e[l] and e.add(l)
    j.attachEvent "onbeforeprint", ->
      b()
      g = undefined
      i = undefined
      d = undefined
      d = a.styleSheets
      e = []
      h = d.length
      k = Array(h)

      while h--
        k[h] = d[h]
      while d = k.pop()
        if not d.disabled and D.test(d.media)
          try
            g = d.imports
            i = g.length
          catch j
            i = 0
          h = 0
          while h < i
            k.push g[h]
            h++
          try
            e.push d.cssText
      g = e.reverse().join("").split("{")
      i = g.length
      h = RegExp("(^|[\\s,>+~])(" + o().join("|") + ")(?=[[\\s,>+~#.:]|$)", "gi")
      k = "$1" + l + "\\:$2"
      while i--
        e = g[i] = g[i].split("}")
        e[e.length - 1] = e[e.length - 1].replace(h, k)
        g[i] = e.join("}")
      e = g.join("{")
      i = a.getElementsByTagName("*")
      h = i.length
      k = RegExp("^(?:" + o().join("|") + ")$", "i")
      d = []
      while h--
        g = i[h]
        k.test(g.nodeName) and d.push(g.applyElement(B(g)))
      f = d
      c = s(a, e)

    j.attachEvent "onafterprint", ->
      a = f
      c = a.length

      while c--
        a[c].removeNode()
      clearTimeout d._removeSheetTimer
      d._removeSheetTimer = setTimeout(b, 500)

    a.printShived = not 0
    a
  r = j.html5 or {}
  z = /^<|^(?:button|map|select|textarea|object|iframe|option|optgroup)$/i
  y = /^(?:a|b|code|div|fieldset|h1|h2|h3|h4|h5|h6|i|label|li|ol|p|q|span|strong|style|table|tbody|td|th|tr|ul)$/i
  q = undefined
  u = "_html5shiv"
  p = 0
  t = {}
  e = undefined
  (->
    try
      a = f.createElement("a")
      a.innerHTML = "<xyz></xyz>"
      q = "hidden" of a
      b = undefined
      unless b = 1 is a.childNodes.length
        f.createElement "a"
        c = f.createDocumentFragment()
        b = "undefined" is typeof c.cloneNode or "undefined" is typeof c.createDocumentFragment or "undefined" is typeof c.createElement
      e = b
    catch d
      e = q = not 0
  )()
  d =
    elements: r.elements or "abbr article aside audio bdi canvas data datalist details figcaption figure footer header hgroup mark meter nav output progress section summary time video"
    version: "3.6.2pre"
    shivCSS: not 1 isnt r.shivCSS
    supportsUnknownElements: e
    shivMethods: not 1 isnt r.shivMethods
    type: "default"
    shivDocument: w
    createElement: v
    createDocumentFragment: (a, b) ->
      a or (a = f)
      return a.createDocumentFragment()  if e
      b = b or n(a)
      c = b.frag.cloneNode()
      d = 0
      j = o()
      l = j.length

      while d < l
        c.createElement j[d]
        d++
      c

  j.html5 = d
  w f
  D = /^$|\b(?:all|print)\b/
  l = "html5shiv"
  C = not e and ->
    a = f.documentElement
    not ("undefined" is typeof f.namespaces or "undefined" is typeof f.parentWindow or "undefined" is typeof a.applyElement or "undefined" is typeof a.removeNode or "undefined" is typeof j.attachEvent)
  ()
  d.type += " print"
  d.shivPrint = x
  x f
) this, document
