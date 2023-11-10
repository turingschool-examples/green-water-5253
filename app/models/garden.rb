class Garden < ApplicationRecord
   has_many :plots

   validates :name, :organic, presence: true

   def unique_list_under_100
    plots.joins(:plants)
    .where("plants.days_to_harvest < 100")
    .group("plants.id")
    .pluck("plants.name")
   end
end