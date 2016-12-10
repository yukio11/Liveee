class Review < ActiveRecord::Base
  belongs_to  :live
  belongs_to  :user
end
