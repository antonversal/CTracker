module ModelMatchers
  def test_validates_presence_of(*attributes)
    klass = self.name.sub(/Test$/, "").constantize
    attributes.each do |attribute|
      test "validates_presence_of #{attribute}" do
        object = klass.new(attribute => nil)
        assert object.invalid?
        assert object.errors[attribute].include?("can't be blank")
      end
    end
  end
end