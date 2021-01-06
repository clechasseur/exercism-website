module MarkdownEditorHelpers
  def fill_in_editor(text)
    wait_for_editor_to_load
    execute_script("document.querySelector('.CodeMirror').CodeMirror.setValue('#{text}')")
  end

  def assert_editor_text(expected)
    wait_for_editor_to_load
    actual = evaluate_script("document.querySelector('.CodeMirror').CodeMirror.getValue()")

    assert_equal expected, actual
  end

  def wait_for_editor_to_load
    sleep(0.5)
  end
end
