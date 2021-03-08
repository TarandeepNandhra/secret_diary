class SecretDiary

  attr_accessor :status, :entry

  def initialize
    @status = false
    @entry = []
  end

  def lock
    self.status = false
  end

  def unlock
    self.status = true
  end

  def add_entry(input)

    unless self.status
      raise("diary locked!")
    else
      self.entry << input
    end

  end

  def get_entries
    self.entry.each { |entry| print entry }
  end

end
