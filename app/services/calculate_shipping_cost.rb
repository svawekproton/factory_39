class CalculateShippingCost
  COST_MULTIPLIER = {
    'bicycle': 1,
    'small_car': 1.25,
    'van': 1.5,
    'lorry': 2
  }.with_indifferent_access

  def initialize(from, to, vehicle)
    @from = from
    @to = to
    @vehicle = vehicle
  end

  def call
    multiplier = COST_MULTIPLIER[@vehicle]
    return nil if multiplier.nil?
    ((@to.to_i(36) - @from.to_i(36)).to_f/1000000000).abs.round(2) * multiplier
  end
end
