#
# HTML5 Shiv v3.6.2pre | @afarkas @jdalton @jon_neal @rem | MIT/GPL2 Licensed
#
((l, f) ->
  m = ->
    a = e.elements
    (if "string" is typeof a then a.split(" ") else a)
  i = (a) ->
    b = n[a[o]]
    b or (b = {}
    h++
    a[o] = h
    n[h] = b
    )
    b
  p = (a, b, c) ->
    b or (b = f)
    return b.createElement(a)  if g
    c or (c = i(b))
    b = (if c.cache[a] then c.cache[a].cloneNode() else (if r.test(a) then (c.cache[a] = c.createElem(a)).cloneNode() else c.createElem(a)))
    (if b.canHaveChildren and not s.test(a) then c.frag.appendChild(b) else b)
  t = (a, b) ->
    unless b.cache
      b.cache = {}
      b.createElem = a.createElement
      b.createFrag = a.createDocumentFragment
      b.frag = b.createFrag()
    a.createElement = (c) ->
      (if not e.shivMethods then b.createElem(c) else p(c, a, b))

    a.createDocumentFragment = Function("h,f", "return function(){var n=f.cloneNode(),c=n.createElement;h.shivMethods&&(" + m().join().replace(/\w+/g, (a) ->
      b.createElem a
      b.frag.createElement a
      "c(\"" + a + "\")"
    ) + ");return n}")(e, b.frag)
  q = (a) ->
    a or (a = f)
    b = i(a)
    if e.shivCSS and not j and not b.hasCSS
      c = undefined
      d = a
      c = d.createElement("p")
      d = d.getElementsByTagName("head")[0] or d.documentElement
      c.innerHTML = "x<style>article,aside,figcaption,figure,footer,header,hgroup,nav,section{display:block}mark{background:#FF0;color:#000}</style>"
      c = d.insertBefore(c.lastChild, d.firstChild)
      b.hasCSS = !!c
    g or t(a, b)
    a
  k = l.html5 or {}
  s = /^<|^(?:button|map|select|textarea|object|iframe|option|optgroup)$/i
  r = /^(?:a|b|code|div|fieldset|h1|h2|h3|h4|h5|h6|i|label|li|ol|p|q|span|strong|style|table|tbody|td|th|tr|ul)$/i
  j = undefined
  o = "_html5shiv"
  h = 0
  n = {}
  g = undefined
  (->
    try
      a = f.createElement("a")
      a.innerHTML = "<xyz></xyz>"
      j = "hidden" of a
      b = undefined
      unless b = 1 is a.childNodes.length
        f.createElement "a"
        c = f.createDocumentFragment()
        b = "undefined" is typeof c.cloneNode or "undefined" is typeof c.createDocumentFragment or "undefined" is typeof c.createElement
      g = b
    catch d
      g = j = not 0
  )()
  e =
    elements: k.elements or "abbr article aside audio bdi canvas data datalist details figcaption figure footer header hgroup mark meter nav output progress section summary time video"
    version: "3.6.2pre"
    shivCSS: not 1 isnt k.shivCSS
    supportsUnknownElements: g
    shivMethods: not 1 isnt k.shivMethods
    type: "default"
    shivDocument: q
    createElement: p
    createDocumentFragment: (a, b) ->
      a or (a = f)
      return a.createDocumentFragment()  if g
      b = b or i(a)
      c = b.frag.cloneNode()
      d = 0
      e = m()
      h = e.length

      while d < h
        c.createElement e[d]
        d++
      c

  l.html5 = e
  q f
) this, document
