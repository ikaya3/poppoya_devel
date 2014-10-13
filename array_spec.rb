describe Array, "when empty" do
  before do
    @empty_array = []
  end

  it "should be empty" do
    expect(@empty_array).to be_empty
  end

  it "should size 0" do
    expect(@empty_array.size).to eq(0)
  end

  after do
    @empty_array = nil
  end
end
