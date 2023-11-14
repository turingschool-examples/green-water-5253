class Plant < ApplicationRecord
  belongs_to :plot
  has_many :plot_plants
  has_many :plots, through: :plot_plants
end