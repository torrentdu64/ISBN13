require_relative './spec_helper'

RSpec.describe Service::Common::Presence do
    describe ".falsy" do
        context  "correct behavior of falsy for Presence class" do
            it "should  be true" do
                presence = described_class.new("", {:presence => true, :message => "message"}, {})
                expect(presence.falsy).to be(true)
            end

            it "should be false" do
                presence = described_class.new("somthing", {:presence => true, :message => "message"}, {})
                expect(presence.falsy).to be(false)
            end
        end
    end

    describe ".validate" do
        context "message  set to error instance" do
            it ".should return message" do
                errors = Service::Common::Errors.new
                presence = described_class.new("", {presence: true, message: "message"}, errors)
                presence.validate
                
                expect(errors[:validation]).to eq(["message"])
            end
        end 
    end
end