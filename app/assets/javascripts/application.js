// https://github.com/remy/min.js
var $=function(t,n,e){var i=Node.prototype,r=NodeList.prototype,o="forEach",u="trigger",c=[][o],s=t.createElement("i");return r[o]=c,n.on=i.on=function(t,n){return this.addEventListener(t,n,!1),this},r.on=function(t,n){return this[o](function(e){e.on(t,n)}),this},n[u]=i[u]=function(n,e){var i=t.createEvent("HTMLEvents");return i.initEvent(n,!0,!0),i.data=e||{},i.eventName=n,i.target=this,this.dispatchEvent(i),this},r[u]=function(t){return this[o](function(n){n[u](t)}),this},e=function(n){var e=t.querySelectorAll(n||"☺"),i=e.length;return 1==i?e[0]:e},e.on=i.on.bind(s),e[u]=i[u].bind(s),e}(document,this);

window.addEventListener('load', function(){
  $('table.due_day a').on('click', function(){
    $('#bill_due_day').value = this.innerHTML
    $('table.due_day td').forEach(function(el, index){
      el.className = 'not-selected'
    })
    this.parentElement.className = 'selected'
    event.preventDefault();
  })

  $('#icalendar_url').on('click', function(){
    this.setSelectionRange(0, 100)
  })
}, false);
