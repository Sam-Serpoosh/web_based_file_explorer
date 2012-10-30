class HttpUtils
  def self.http_header(content_type)
    "HTTP/1.1 200/OK\r\nContent-type:#{content_type}\r\n\r\n"
  end
end
