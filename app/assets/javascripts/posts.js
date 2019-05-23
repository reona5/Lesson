document.addEventListener("turbolinks:load", function() {
  document.querySelectorAll("td").forEach(function(td) {
    td.addEventListener("mouseover", function(e) {
      e.currentTarget.style.backgroundColor = "#eff";
    });

    td.addEventListener("mouseout", function(e) {
      e.currentTarget.style.backgroundColor = "";
    });
  });
});

// document.addEventListener("turbolinks:load", function() {
//   document.querySelectorAll(".delete").forEach(function(a) {
//     a.addEventListener("ajax:success", function() {
//       var td = a.parentNode;
//       var tr = td.parentNode;
//       tr.style.display = "none";
//     });
//   });
// });

$(document).on("turbolinks:load", function(){
  $("#post_lesson_at").bootstrapMaterialDatePicker({
  weekStart:0,
  shortTime: true,
  lang:"ja",
  format:"YYYY-MM-DD HH:mm",
  switchOnClick: true
  });
  });