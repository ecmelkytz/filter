class Category < ActiveRecord::Base
  has_many :users, dependent: :destroy
  has_many :sss_categories
  has_many :ssses, :through => :sss_categories
end
