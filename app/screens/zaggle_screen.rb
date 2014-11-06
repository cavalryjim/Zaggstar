class ZaggleScreen < PM::Screen
  attr_accessor :zaggle_id
  
  def on_load
    
  end

  def open_edit_zaggle_form
    open_modal EditZaggleForm.new(zaggle_id: self.zaggle_id, nav_bar: true)
  end

  def view_did_load
    #@label = add UILabel.new, {
    #  font: UIFont.systemFontOfSize(32),
    #  left: 20,
    #  top: 200,
    #  width: 280,
    #  height: 50,
    #  text_alignment: NSTextAlignmentCenter
    #}
    @label = UILabel.new
    @label.frame = [[20, 150], [280, 30]]
    view.addSubview(@label)
  end

  def will_appear
    set_attributes self.view, {
      background_color: hex_color("#FFFFFF")
    }

    set_nav_bar_button :right, title: "Edit", action: :open_edit_zaggle_form, type: UIBarButtonItemStylePlain
    
    @label.text = app_delegate.zaggles[self.zaggle_id][:content]
    self.title = app_delegate.zaggles[self.zaggle_id][:title]
  end
end