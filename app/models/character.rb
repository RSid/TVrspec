class Character < ActiveRecord::Base
  belongs_to :television_show

  validates :name,presence: true
  validates :show_id,presence: true
end
