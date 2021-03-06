class Type < ActiveRecord::Base
  validates :name, presence: true

  has_many :field_definitions

  accepts_nested_attributes_for :field_definitions, reject_if: :all_blank
end
