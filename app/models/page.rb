# base page
class Page < ActiveRecord::Base
  belongs_to :category
  belongs_to :type

  has_many :fields

  accepts_nested_attributes_for :fields, reject_if: :all_blank

  after_save :reload_routes

  def reload_routes
    Rails.application.reload_routes!
  end
end
