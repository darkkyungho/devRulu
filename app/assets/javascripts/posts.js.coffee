initTagInput = ->
  $tagInput = $('input[name="post[tag_list]"]')

  $tagInput.tokenInput "/posts/tags.json",
    theme             : 'facebook'
    tokenValue        : 'name'
    allowFreeTagging  : true
    prePopulate       : $tagInput.data('tags')

$ ->
  initTagInput()

  $(document).on 'page:load', ->
    initTagInput()

