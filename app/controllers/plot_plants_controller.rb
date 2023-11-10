class PlotPlantsController < ApplicationController
  def destroy
    plot_plant = PlotPlant.find_by(plot: params[:id], plant: params[:format])

    if plot_plant
      plot_plant.destroy
    end
    
    redirect_to plots_path
  end
end