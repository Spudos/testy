module InfosHelper
  def quotient(dividend, divisor)
    return if divisor.nil? || divisor.zero?

    dividend ||= 0

    (dividend / divisor).to_f
  end
end
