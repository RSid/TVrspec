class TelevisionShow < ActiveRecord::Base
  has_many :characters, :foreign_key => :show_id

  validates :title,
    presence: true,
    uniqueness: { scope: :network }
end
