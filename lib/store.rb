class Store < ActiveRecord::Base
  
  has_many :employees

  validates :name, presence: true, length: { minimum: 3 }
  validates :annual_revenue, presence: true, numericality: { only_integer: true , greater_than_or_equal_to: 0 }
  validate :carries_at_least_one_apparel

  private

  def carries_at_least_one_apparel
    if !mens_apparel && !womens_apparel
      errors.add(:apparel, "Stores must contain men's or women's apparel")
    end
  end

end
