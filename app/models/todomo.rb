class Todomo < ActiveRecord::Base
  validates :content, presence: true
end
