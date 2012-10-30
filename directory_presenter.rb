require_relative "./http_utils"

class DirectoryPresenter

  CURRENT_DIR = "."
  NEXT_LINE = "<br />"

  def self.render_directory_files(session, dir_path)
    Dir.chdir(dir_path)
    current_directory = Dir.new(CURRENT_DIR)
    session.print(HttpUtils.http_header("text/html"))
    format_entries_of(current_directory).each { |file| print_line(session, file) }
  end

  def self.format_entries_of(directory)
    formatted_entries = []
    directory.entries.each do |entry|
      formatted_entry = format(entry)
      formatted_entries << formatted_entry
    end
    formatted_entries
  end

  def self.format(entry)
    if File.directory?(entry)
      formatted = "<a href=\"http://localhost:2000?dir=#{entry}\">#{entry}/<a>"
    else
      formatted = "<a href=\"http://localhost:2000?file=#{entry}\">#{entry}</a>" 
    end
    formatted
  end

  def self.print_line(session, text)
    session.print("#{text + NEXT_LINE}")
  end
end
