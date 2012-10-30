require_relative "./url_parser"

describe UrlParser do
  context "#directory_path" do
    it "returns current directory when there's no parameter" do
      request = "http://localhost:2000"
      dir = UrlParser.process_url(request)
      dir.path.should == "."
    end

    it "extracts dir value out of url" do
      request = "http://localhost:2000/?dir=.."
      dir = UrlParser.process_url(request)
      dir.should be_a Directory
      dir.path.should == ".."
    end

    it "extracts dir value out of url when includes space" do
      request = "http://localhost:2000/?dir=Ruby%20Programs"
      dir = UrlParser.process_url(request)
      dir.path.should == "Ruby Programs"
    end
  end

  context "#file_path" do
    it "extracts file path and creates a pure file" do
      request = "http://localhost:2000/?file=file_name"
      file = UrlParser.process_url(request)
      file.should be_a PureFile
      file.path.should == "file_name"
    end
  end
end
