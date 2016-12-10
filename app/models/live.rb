class Live < ActiveRecord::Base
  has_many :lives_performers
  has_many :performers, through: :lives_performers
  has_many :reviews
end
