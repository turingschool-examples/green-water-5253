class Garden < ApplicationRecord
   has_many :plots

   validates :name, :organic, presence: true
end