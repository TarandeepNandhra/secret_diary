class SecretDiary

  def initialize
    @security = Security.new
    @entry = Entries.new
  end

  def lock
    @security.lock
  end

  def unlock
    @security.unlock
  end

  def add_entry(input)
    @entry.add_entry(input, @security.status)
  end

  def get_entries
    @entry.get_entries(@security.status)
  end

end

class Security
  attr_reader :status
  def initialize
    @status = false
  end
  
  def lock
    @status = false
  end

  def unlock
    @status = true
  end
end

class Entries
  attr_reader :entries
  def initialize
    @entries = []
  end

  def add_entry(input, status)
    raise("diary locked!") unless status
      
    @entries << input
  end

  def get_entries(status)
    raise("diary locked!") unless status
          
    @entries.each { |entry| p entry }
  end
end