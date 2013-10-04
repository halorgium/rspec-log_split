shared_examples "win" do
  it "works" do
    Demo.logger.info "works"
  end

  context "mainframe" do
    it "hacks" do
      Demo.logger.info "hacks"
    end
  end
end
