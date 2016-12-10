class LivesPerformer < ActiveRecord::Base
  belongs_to :live
  belongs_to :performer
end
