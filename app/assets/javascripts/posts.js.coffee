# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

# Testing jquery function. Unused
jQuery ->
    $(".alert").click ->
        alert this.id
        #$("#me").append Date
        return false

# Adding steps to put on a new post
jQuery ->
    $("#add_step").click ->
        j = parseInt $("span:first").text(), 10
        j = j+1
        n = $("span:first").text(j)
        j = j.toString()
        $("#step_list").append '<div class="one_step">'+
            '<b>' + j + '</b>' +
            '<input class="post_step"' +
                'name="post[step][' + j + ']" ' +
                'type="text"/>'+
            '<a href="#" ' +
                'class="remove_step" ' +
                'id="'+j+'">' +
                'Remove</a>'+
            '<br/>'+
            '</div>'

        return false

# Removing steps from a new post, or editing a post
# The step referenced to is removed
# There is a loop over all the steps
#   steps comming after the removed step gets shifted up
#   this is done by removing all steps after the removed step
#     then re-wirtting them with a different name (post[#])
#     the values of the removed steps are saved
#     the re-written steps gets this value
jQuery ->
    $("#step_list").on 'click', '.remove_step', ->
        cur_id = $(this).attr("id")
        total_steps = $('.one_step').length

        j = parseInt $("span:first").text(), 10
        j = j-1
        n = $("span:first").text(j)
        
        j = j.toString()

        $(".one_step").each (index, element) ->
            i = index + 1
            if i < cur_id
                ;
            if i == cur_id
                ;
            if i > cur_id
                curr_i = $(element).children(".post_step")
                                   .attr("name")
                                   .match(/\d+/)
                new_i = curr_i - 1
                new_i = new_i.toString()
                
                v = $(element).children(".post_step").attr("value")
                $(element).remove()

                $("#step_list").append '<div class="one_step">'+
                    '<b>' + new_i + '</b>' +
                    '<input class="post_step" ' +
                        'name="post[step][' + new_i + ']" ' +
                        'type="text" value="'+v+'"/>'+
                    '<a href="#" class="remove_step" id="'+new_i+'">'+
                        'Remove</a>'+
                    '<br/>'+
                    '</div>'
            
        $(this).parent().remove()
        return false
