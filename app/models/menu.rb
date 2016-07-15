# menu menu
class Menu < ActiveRecord::Base
  validates :name, presence: true

  has_many :menu_items

  accepts_nested_attributes_for :menu_items, reject_if: :all_blank
end
