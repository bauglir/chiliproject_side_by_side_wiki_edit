jQuery(function() {
  var $ = jQuery;
  var editor = $('textarea.wiki-edit');
  var editor_parent = editor.parentsUntil('p').parent();
  var preview = $('div#preview');
  var preview_link = $('input[name=commit]').next();

  var disable = function() {
    editor_parent.add(preview).removeClass('side_by_side');
    $('#content').append(preview);
  };

  var enable = function() {
    editor_parent.add(preview).addClass('side_by_side');

    editor_parent.before(preview);
    preview.height(editor.height() + 5);

    editor.scroll(preview, scroll_preview);
    editor.scroll();

    if($('fieldset.preview').length === 0) {
      preview_link.click();
    }
  };

  var scroll_preview = function(event) {
    var source_position = this.scrollTop / (this.scrollHeight - $(this).innerHeight());
    var target = $(event.data);

    target.scrollTop(source_position * (target[0].scrollHeight - target.innerHeight()));
  }

  var toggle_mode = function() {
    if(this.checked) {
      enable();
    } else {
      disable();
    }
  }

  preview_link.after($('<label for="side_by_side_mode">Show editor and preview side-by-side</label>'))
              .after($('<input id="side_by_side_mode" type="checkbox" />'));
  $('#side_by_side_mode').on('click', toggle_mode);
});
