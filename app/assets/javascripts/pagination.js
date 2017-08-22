$(document).on("turbolinks:load", setupInfiniteScroll)

function setupInfiniteScroll(e) {
  const THRESHOLD = 300;
  const $paginationElem = $('.pagination');
  const $window = $(window);
  const $document = $(document);
  const paginationUrl = $paginationElem.attr('data-pagination-endpoint'); // "/posts/paging"
  const pagesAmount = $paginationElem.attr('data-pagination-pages'); // 9
  let currentPage = 1;
  let baseEndpoint;

  if (paginationUrl.indexOf('?') != -1) {
    baseEndpoint = paginationUrl + "&page="; // "posts/paging?sdaa&page="
  } else {
    baseEndpoint = paginationUrl + "?page=" // "posts/paging?page="
  }

  $paginationElem.hide()
  let isPaginating = false

  $window.on('scroll', debounce(function () {
    console.log("scrolling", "current page: ", currentPage, "total pages: ", pagesAmount);
    if (!isPaginating && currentPage < pagesAmount && $window.scrollTop() > $document.height() - $window.height() - THRESHOLD) {
      isPaginating = true;
      currentPage = currentPage + 1;
      $paginationElem.show();
      $.ajax({
        url: baseEndpoint + currentPage // "posts/paging?page=2"
      }).done(function (result) {
        console.log($('.js-posts'))
        $('.js-posts').append(result)
        $('.all-posts').append(result);
        isPaginating = false;
      });
    }
    if (currentPage >= pagesAmount) {
      $paginationElem.hide();
    }
  }, 100));
}

function debounce(func, wait, immediate) {
  var timeout;
  return function() {
      var context = this, args = arguments;
      var later = function() {
          timeout = null;
          if (!immediate) func.apply(context, args);
      };
      var callNow = immediate && !timeout;
      clearTimeout(timeout);
      timeout = setTimeout(later, wait);
      if (callNow) func.apply(context, args);
  };
};

