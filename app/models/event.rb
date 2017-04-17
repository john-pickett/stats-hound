class Event < ApplicationRecord
  belongs_to :application

  validates :application_id, presence: true
end
