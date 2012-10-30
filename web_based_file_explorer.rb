require_relative "./url_parser"
require_relative "./directory"
require_relative "./directory_presenter"
require_relative "./file_presenter"
require 'socket'


class WebBasedFileExplorer

  def file_explorer
    webserver = TCPServer.new("localhost", 2000)
    loop do
      Thread.start(webserver.accept) do |session|
        render_param(session)
        session.close
      end
    end
  end

  def render_param(session)
    param = fetch_param(session)
    if param.is_a?(Directory)
      DirectoryPresenter.render_directory_files(session, param.path)
    elsif param.is_a?(PureFile)
      FilePresenter.render_file_content(session, param.path)
    end
  end

  def fetch_param(session)
    url = session.gets
    param = UrlParser.process_url(url)
    param
  end
end

WebBasedFileExplorer.new.file_explorer
