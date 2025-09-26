class ShippingsController < ApplicationController
  def quote
    package = quote_params

    if package["from"].present? && package["to"].present? && package["vehicle"]
      price = CalculateShippingCost.new(package["from"], package["to"], package["vehicle"]).call

      if price.nil?
        render status: :bad_request
        return
      end

      result = {
        from: package["from"],
        to: package["to"],
        vehicle: package["vehicle"],
        price: price
      }

      render json: result
    else
      render status: :bad_request
    end
  end

  private

  def quote_params
    params.permit(:from, :to, :vehicle)
  end
end
