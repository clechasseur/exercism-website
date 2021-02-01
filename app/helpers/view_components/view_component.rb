module ViewComponents
  class ViewComponent
    extend Mandate::Memoize
    extend Mandate::InitializerInjector

    delegate :user_signed_in?, :current_user,
      :render, :safe_join,
      :tag, :link_to, :button_to,
      :time_ago_in_words,
      :graphical_icon, :icon, :track_icon, :exercise_icon, :rounded_bg_img,
      :capture_haml,
      to: :view_context

    # This is called when you called `render SomeComponent.new(...)`
    # It sets the view context, which can then be used for things
    # like getting the current user, or authentication tokens
    def render_in(context, *_args)
      @view_context = context
      to_s
    end

    private
    attr_reader :view_context
  end
end
