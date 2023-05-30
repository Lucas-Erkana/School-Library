require 'json'

class HandleData
  def read_data(filename)
    File.empty?(filename) ? [] : JSON.parse(File.read(filename))
  end

  def save_data(filename, data)
    File.write(filename, JSON.generate(data))
  end
end
