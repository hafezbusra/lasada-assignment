class Product < ApplicationRecord
  before_destroy :not_refereced_by_any_line_item
  belongs_to :user, optional: true
  has_many :line_items
  has_one_attached :image

  validates :title, :brand, :price, :model, :quantity, presence: true
  validates :description, length: { maximum: 1000, too_long: "%{count} characters is the maximum aloud. "}
  validates :title, length: { maximum: 140, too_long: "%{count} characters is the maximum aloud. "}
  validates :price, length: { maximum: 7 }
  validates :quantity, length: { maximum: 7 }

  BRAND = %w{ Electronic-Devices Electronic-Accessories Home-Appliances Health&Beauty Babies&Toy Groceries&Pet Home&Lifestyle Women's-Fashion Men's-Fashion  Fashion-Accessories Sports&Travel Automative&Motorcycles }
  FINISH = %w{ Black White Navy Blue Red Clear Satin Yellow Seafoam }
  CONDITION = %w{ New Excellent Mint Used Fair Poor }

  private

  def not_refereced_by_any_line_item
    unless line_items.empty?
      errors.add(:base, "Line items present")
      throw :abort
    end
  end

end
