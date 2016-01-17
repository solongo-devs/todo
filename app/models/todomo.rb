class Todomo < ActiveRecord::Base
  validates :content, presence: true
  after_initialize :default_values

  def is_done
    self.done = true
    self.done_time = Time.now
    self.save
  end

  private
  def default_values
    self.done ||= false
    self.done_time ||= nil
  end
end
