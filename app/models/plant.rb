class Plant < ApplicationRecord
  has_many :plot_plants
  has_many :plots, through: :plot_plants

  validates :name, :description, :days_to_harvest, presence: true
end