$(documents).on("turbolinks:load", setupInfiniteScroll)
function setupInfiniteScroll(event){
  $(window).on("scroll", function(e){
    console.log("scrolling", e)
  })
}

