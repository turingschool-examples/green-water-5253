require 'rails_helper'

RSpec.describe Plot, type: :feature do
  before :each do
    @garden = Garden.create!(name: "Garden of Eden", organic: true)
    @plot1 = @garden.plots.create!(number: 1, size: 'Medium', direction: 'West')
    @plot2 = @garden.plots.create!(number: 2, size: 'Small', direction: 'North')
    @plot3 = @garden.plots.create!(number: 3, size: 'Large', direction: 'South')

    @plant1 = Plant.create!(name: "Raspberry Bush", description: "Annual", days_to_harvest: 90)
    @plant2 = Plant.create!(name: "Blueberry Bush", description: "Quarterly", days_to_harvest: 80)
    @plant3 = Plant.create!(name: "Strawberry Bush", description: "Seasonal", days_to_harvest: 100)
    @plant4 = Plant.create!(name: "Blackberry Bush", description: "Perennial ", days_to_harvest: 90)
    @plant5 = Plant.create!(name: "Gooseberry Bush", description: "Perennial", days_to_harvest: 70)
    @plant6 = Plant.create!(name: "Elderberry Bush", description: "Annual", days_to_harvest: 130)
    
    PlotPlant.create!(plot: @plot1, plant: @plant1)
    PlotPlant.create!(plot: @plot1, plant: @plant2)
    PlotPlant.create!(plot: @plot2, plant: @plant3)
    PlotPlant.create!(plot: @plot2, plant: @plant4)
    PlotPlant.create!(plot: @plot3, plant: @plant5)
    PlotPlant.create!(plot: @plot3, plant: @plant6)
  end

  # US 1
  it "displays a list of all plot numbers and their corresponding plants" do
    visit plots_path

    [@plot1, @plot2, @plot3].each do |plot|
      within("#plot-#{plot.number}") do
        expect(page).to have_content("Plot Number: #{plot.number}")
        plot.plants.each do |plant|
          expect(page).to have_content(plant.name)
        end
      end
    end
  end


end