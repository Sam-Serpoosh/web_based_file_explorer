require_relative "./directory_presenter"

describe DirectoryPresenter do
  it "formats directory appropriately for session url" do
    entry = "stub_directory"
    File.stub(:directory?).with(entry) { true }
    formatted = DirectoryPresenter.format(entry)
    formatted.should == 
      "<a href=\"http://localhost:2000?dir=stub_directory\">stub_directory/</a>"
  end

  it "formats file appropriately for session url" do
    entry = "stub_file"
    File.stub(:directory?).with(entry) { false }
    formatted = DirectoryPresenter.format(entry)
    formatted.should == 
      "<a href=\"http://localhost:2000?file=stub_file\">stub_file</a>"
  end

  it "formats all the entries in a directory for session url" do
    stub_directory = "stub_directory"
    stub_file = "stub_file"
    entries = [stub_directory, stub_file]
    dir = stub(:entries => entries)
    File.stub(:directory?).with(stub_directory) { true }
    File.stub(:directory?).with(stub_file) { false }
    formatted_entries = DirectoryPresenter.format_entries_of(dir)
    formatted_entries[0].should == 
      "<a href=\"http://localhost:2000?dir=stub_directory\">stub_directory/</a>"
    formatted_entries[1].should == 
      "<a href=\"http://localhost:2000?file=stub_file\">stub_file</a>"
  end
end
