(function($) {
  $(function() {
    var longest = 0;
    var $wordcounts = $('[data-words]').each(function () {
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

  });
})(jQuery);