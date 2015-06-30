class SssCategory < ActiveRecord::Base
	  # Relations
  belongs_to :sss
  belongs_to :category
end
