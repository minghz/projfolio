# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#
#


# for endless scrolling
jQuery ->
  if $('.pagination').length
    $(window).scroll ->
      url = $('.next_page').attr('href')
      if url && $(window).scrollTop() > $(document).height() - $(window).height() - 50
        # what to do at bottom of page
        $('.pagination').text("Fetching more Posts...")
        $.getScript(url)
$(window).scroll()
# end endless scrolling

