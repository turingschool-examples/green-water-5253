require 'rails_helper'

RSpec.describe "Plots Index page", type: :feature do
  it "displays a list of all plot numbers and the names of all their plants under it." do
    garden = Garden.create!(name: "Garden of Life", organic: true)
    plot1 = garden.plots.create!(number: 1, size: "4", direction: "east")
    plant1 = plot1.plants.create!(name: "Sunflower", description: "Prefers alkaline h20", days_to_harvest: "40") 
    plant2 = plot1.plants.create!(name: "Rose", description: "Prefers acidic h20", days_to_harvest: "20") 
    plant3 = plot1.plants.create!(name: "orchid", description: "Prefers much sunlight", days_to_harvest: "80") 

    plot2 = garden.plots.create!(number: 2, size: "6", direction: "west")
    plant4 = plot2.plants.create!(name: "Tomato", description: "Prefers smoke-free environment", days_to_harvest: "30") 
    plant5 = plot2.plants.create!(name: "Lavender", description: "Prefers harsh h20", days_to_harvest: "150") 
    plant6 = plot2.plants.create!(name: "Cactus", description: "Prefers much darkness", days_to_harvest: "70") 

    # User Story 1, Plots Index Page
    # As a visitor
    # When I visit the plots index page ('/plots')
    plots_path
    # I see a list of all plot numbers
    # And under each plot number I see the names of all that plot's plants
    within("#plot_#{plot1.id}")do
      expect(page).to have_content("Plot #{plot1.number}")
      expect(page).to have_content(plant1.name)
      expect(page).to have_content(plant2.name)
      expect(page).to have_content(plant3.name)
    end

    within("#plot_#{plot2.id}")do
      expect(page).to have_content("Plot #{plot2.number}")
      expect(page).to have_content(plant4.name)
      expect(page).to have_content(plant5.name)
      expect(page).to have_content(plant6.name)
    end
  end
end