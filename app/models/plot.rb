class Plot < ApplicationRecord
   belongs_to :garden

   has_many :plot_plants
   has_many :plants, through: :plot_plants

   validates :number, :size, :direction, presence: true
end