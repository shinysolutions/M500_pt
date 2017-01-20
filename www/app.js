// IP info;
$(document).ready(function(){
  var I = 0
  var tt = setInterval(function(){
    var L = $("#log");
    $.get("http://ipinfo.io", function(e) {
      L.val(Date() + "  ipInfo|" + e.ip + "," + e.city + "," + e.loc);
      L.trigger("change");
    }, "jsonp");
    if(L.val().length > 0) {
      clearInterval(tt)
    }
  }, 100)
});

/*
 for (var i = 0; i<spec.pieDat.Record.length; i++) {
  L.piechartMarker(
    L.latLng([spec.pieDat.Lat[i], spec.pieDat.Lon[i]]),
    {
      radius: 10,
      data: [
            { name: 'flood',    value: spec.pieDat.Record[i].match(/水/) != null?1:0, style: { fillStyle: 'rgba(0,  0,255,.8)'} },
            { name: 'drought',  value: spec.pieDat.Record[i].match(/旱/) != null?1:0, style: { fillStyle: 'rgba(0,  0,255,.8)'} },
            { name: 'locust',   value: spec.pieDat.Record[i].match(/蝗/) != null?1:0, style: { fillStyle: 'rgba(255,140,0,.8)'} },
            { name: 'famine',   value: spec.pieDat.Record[i].match(/饥/) != null?1:0, style: { fillStyle: 'rgba(0,255,255,.8)'} },
            { name: 'epidemic', value: spec.pieDat.Record[i].match(/疫/) != null?1:0, style: { fillStyle: 'rgba(255,0,255,.8)'} }
        ]
    }
    ).addTo(map).bindPopup(spec.pieDat.Record[i]);
 }
*/
