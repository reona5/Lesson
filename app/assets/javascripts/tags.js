$(document).on('turbolink:load', function() {
  $('#post_tag_list').tagit({
    availableTags: ["c++", "java", "php", "javascript", "ruby", "python", "c"],
  });
});