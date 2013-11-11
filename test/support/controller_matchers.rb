module ControllerMatchers
  def should_not_respond_to_actions(actions = {})
    actions.each do |name, method|
      test "should not respond to #{method.to_s.upcase} :#{name}" do
        assert_raise ActionController::UrlGenerationError do
          send(method, name)
        end
      end
    end
  end
end