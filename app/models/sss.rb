class Sss < ActiveRecord::Base
  has_many :sss_categories, dependent: :destroy
  has_many :categories, :through => :sss_categories
end
