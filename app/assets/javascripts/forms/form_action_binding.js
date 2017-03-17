$(function() {
  $('form').on('submit', function(e) {
    e.preventDefault();

    var id = $('select').val();
    var path_elements = window.location.pathname.split('/');
    var asset = path_elements[path_elements.length - 1];

    window.location = '/references/' + id + '/' + asset;
  });
});
