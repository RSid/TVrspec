class Character < ActiveRecord::Base
  belongs_to :show, :class_name => 'TelevisionShow'

  validates :name,presence: true
  validates :actor_name,presence: true
  validates :description,presence: true
  validates :show_id,presence: true
end
