module Shoulda # :nodoc:
  module Matchers
    module ActiveModel # :nodoc:

      # Ensures that the model is not valid if the given attribute is not
      # in a valid email address format.
      #
      # Options:
      # * <tt>with_message</tt> - value the test expects to find in
      #   <tt>errors.on(:attribute)</tt>. <tt>Regexp</tt> or <tt>String</tt>.
      #   Defaults to the translation for <tt>:blank</tt>.
      #
      # Examples:
      #   it { should validate_email_address_of(:email) }
      #
      def validate_email_address_of(attr)
        ValidateEmailAddressOfMatcher.new(attr)
      end

      class ValidateEmailAddressOfMatcher < ValidationMatcher # :nodoc:

        def with_message(message)
          @expected_message = message if message
          self
        end

        def matches?(subject)
          super(subject)
          @expected_message ||= :blank
          disallows_value_of("foo bar", @expected_message)
        end

        def description
          "require #{@attribute} to be a valid email address"
        end
        
      end

    end
  end
end
