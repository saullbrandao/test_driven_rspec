class Order
  attr_reader :state, :payment_method, :items

  def initialize(attrs)
    @state = attrs[:state] || :create
    @payment_method = attrs[:payment_method]
    @buyer_email = attrs[:buyer_email]
    @items = attrs[:items]
  end

  def checkout
    tax = TaxCalculator.calculate(self)
    items_total = items.sum(&:total)
    processed_payment_status = PaymentGateway.process_payment(tax + items_total, @payment_method)

    if processed_payment_status == :success
      @state = :completed
      Mailer.send_mail(:order_success, @buyer_email)
    else
      @state = :payment_failed
    end
  end
end
