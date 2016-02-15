class Saying < ActiveRecord::Base
  # default_scope -> { order (created_at: :descs)}
  validates :german,  presence: true
  validates :english,  presence: true
end
