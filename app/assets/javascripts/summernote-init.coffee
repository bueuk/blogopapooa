$ ->
sendFile = (that, file) ->
    data = new FormData
    data.append 'image[image]', file
    $.ajax
      data: data
      type: 'POST'
      url: '/images'
      cache: false
      contentType: false
      processData: false
      success: (data) ->
        img = document.createElement('IMG')
        img.src = data.url
        img.setAttribute('id', data.image_id)
        $(that).summernote 'insertNode', img

  deleteFile = (file_id) ->
    $.ajax
      type: 'DELETE'
      url: "/images/#{file_id}"
      cache: false
      contentType: false
      processData: false

  ready = ->
    $('[data-provider="summernote"]').each ->
      $(this).summernote 
        height: 500
        toolbar:[
          ['highlight', ['highlight']],['style', ['bold', 'italic', 'underline', 'clear']],['font', ['strikethrough', 'superscript', 'subscript']],['fontsize', ['fontsize']],['color', ['color']],['para', ['ul', 'ol', 'paragraph']],['height', ['height']],['table', ['table']],["insert", ["link", "picture", "video"]],["view", ['fullscreen', 'codeview', 'help']]
        ]
        callbacks: 
          onImageUpload: (files) ->
            img = sendFile(this, files[0])
          onMediaDelete: (target, editor, editable) ->
            image_id = target[0].id
            if !!image_id
              deleteFile image_id
            target.remove()
  $(document).ready(ready)
  $(document).on('page:load', ready)
