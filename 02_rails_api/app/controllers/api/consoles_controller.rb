class API::ConsolesController < ApplicationController
  def index
    consoles = if params[:manufacturer].present?
                 Console.where(manufacturer: params[:manufacturer])
               else
                 Console.all
               end

    render json: { consoles: consoles.map(&:formatted_name) }
  end
end
