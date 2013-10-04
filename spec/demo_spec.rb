require 'spec_helper'

describe "foo" do
  context "bar" do
    it "baz" do
      Demo.logger.info "bar"
    end

    it "qux" do
      Demo.logger.info "qux"
    end
  end
end
