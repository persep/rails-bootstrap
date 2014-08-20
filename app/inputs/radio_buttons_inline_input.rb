class RadioButtonsInlineInput < SimpleForm::Inputs::CollectionRadioButtonsInput
  def input(wrapper_options = nil)

    label_method, value_method = detect_collection_methods

    # def collection_radio_buttons(method, collection, value_method, text_method, options = {}, html_options = {}, &block)
    @builder.send("collection_radio_buttons",
      attribute_name, collection, value_method, label_method,
      input_options, input_html_options, &collection_block_for_nested_boolean_style
    )
  end

  protected

  def item_wrapper_class
        "radio-inline"
  end
end