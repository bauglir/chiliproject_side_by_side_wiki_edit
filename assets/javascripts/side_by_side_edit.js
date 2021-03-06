jQuery(function($) {
  var htmlElement = $('html');
  var editor = $('textarea.wiki-edit');
  var preview = $('div#preview');
  var preview_link = $('#wiki_form input[name=commit]').next();

  var disable_side_by_side_mode = function() {
    htmlElement.removeClass('side_by_side');

    editor.off('scroll');
    editor.off('mouseup');

    $('#content').append(preview);
  };

  var disable_writing_mode = function() {
    htmlElement.removeClass('writing_mode');
  }

  var enable_side_by_side_mode = function() {
    htmlElement.addClass('side_by_side');

    editor.before(preview);
    resize_preview_to_editor_height();

    editor.scroll(preview, scroll_preview);
    editor.mouseup(resize_preview_if_required);
    editor.scroll();

    if($('fieldset.preview').length === 0) {
      preview_link.click();
    }
  };

  var enable_writing_mode = function() {
    htmlElement.addClass('writing_mode');
  }

  var resize_preview_if_required = function() {
    var newEditorHeight = editor.outerHeight();

    if(newEditorHeight != editor.data('height')) {
      editor.data('height', newEditorHeight);
      resize_preview_to_editor_height();
    }
  }

  var resize_preview_to_editor_height = function() {
    preview.height(editor.height() + 6);
  }

  var scroll_preview = function(event) {
    var source_position = this.scrollTop / (this.scrollHeight - $(this).innerHeight());
    var target = $(event.data);

    target.scrollTop(source_position * (target[0].scrollHeight - target.innerHeight()));
  };

  var toggle_side_by_side_mode = function() {
    if(this.checked) {
      enable_side_by_side_mode();
    } else {
      disable_side_by_side_mode();
    }
  };

  var toggle_writing_mode = function() {
    if(this.checked) {
      enable_writing_mode();
    } else {
      disable_writing_mode();
    }
  };

  preview_link.after($('<label for="side_by_side_mode">Show editor and preview side-by-side</label>'))
              .after($('<input id="side_by_side_mode" type="checkbox" />'))
              .after($('<label for="writing_mode">Writing mode</label>'))
              .after($('<input id="writing_mode" type="checkbox" />'));
  $('#side_by_side_mode').click(toggle_side_by_side_mode);
  $('#writing_mode').click(toggle_writing_mode);

  editor.data('height', editor.outerHeight());
});
