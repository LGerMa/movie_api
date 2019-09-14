module GeneralConcern
  extend ActiveSupport::Concern

  def money_format(amount = 0)
    Money.new(amount, "USD").format
  end

  def date_format(date = Time.now)
    date.strftime("%d/%m/%Y")
  end
end