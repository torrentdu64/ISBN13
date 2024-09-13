require_relative './spec_helper'

RSpec.describe Service::Common::Length do
    describe ".falsy" do
        context "expected behavior of Length class" do
            it "should be true" do
                presence = described_class.new("1", {:length => 2, :message => "message"}, {})
                expect(presence.falsy).to be(true)
            end

            it "should be false" do
                presence = described_class.new("12", {:length => 2, :message => "message"}, {})
                expect(presence.falsy).to be(false)
            end
        end
    end

    describe ".validate" do
        context "message set to error message" do
            it ".should return message" do
                errors = Service::Common::Errors.new
                presence = described_class.new("1", {length: 2, message: "message"}, errors)
                presence.validate
                
                expect(errors[:validation]).to eq(["message"])
            end
        end 
    end
end