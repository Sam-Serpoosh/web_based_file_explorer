require_relative "./http_utils"

class FilePresenter
  def self.render_file_content(session, file_path)
    content_type = get_content_type(file_path)
    session.print(HttpUtils.http_header(content_type))
    session.print(get_content(file_path))
  end

  def self.get_content_type(path)
    ext = File.extname(path)
    return "text/html"  if ext == ".html" or ext == ".htm"
    return "text/plain" if ext == ".txt"
    return "text/css"   if ext == ".css"
    return "image/jpeg" if ext == ".jpeg" or ext == ".jpg"
    return "image/gif"  if ext == ".gif"
    return "image/bmp"  if ext == ".bmp"
    return "text/plain" if ext == ".rb"
    return "text/xml"   if ext == ".xml"
    return "text/xml"   if ext == ".xsl"
    return "text/html"
  end

  def self.get_content(file_path)
    file = File.new(file_path)
    content = file.read
    file.close
    content
  end
end
