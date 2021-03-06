(function($) {
  $(function() {
    // Lifted from http://jackosborne.co.uk/
    var longest = 0,
        $wordcounts = $('[data-words]').each(function () {
          var count = +$(this).data('words');
          if (count > longest) {
            longest = count;
          }
        });

    longest = 100 / longest;

    $wordcounts.each(function() {
     var $el = $(this),
         $bar = $el.find('.bar'),
         count = +$el.data('words'),
         width = (longest * count) + '%';

     $bar.width(width);
    });

  $('.category a').click(function(e) {
    e.preventDefault();

    $('.category .active').removeClass('active');
    $(this).addClass('active');

    var category = $(this).data('category');
    $('.archived').each(function(i) {
      $(this).show();
      if (category !== "" && !$(this).hasClass(category)) {
        $(this).hide();
      }
    });
  });

  });
})(jQuery);