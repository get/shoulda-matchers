require 'spec_helper'

describe Shoulda::Matchers::ActiveModel::ValidateEmailAddressOfMatcher do

  context "an email address attribute" do
    before do
      define_model :example, :attr => :string do
        email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
        validates :attr, 
                  :format     => { :with => email_regex },
                  :uniqueness => { :case_sensitive => false }
      end
      @model = Example.new
    end

    it "should only allow valid email address values for that attribute" do
      @model.should validate_email_address_of(:attr)
    end

    it "should not override the default message with a blank" do
      @model.should validate_email_address_of(:attr).with_message(nil)
    end
  end

end
