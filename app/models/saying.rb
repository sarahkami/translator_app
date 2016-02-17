class Saying < ActiveRecord::Base
  # default_scope -> { order (created_at: :descs)}
  validates :german,  presence: true
  validates :english,  presence: true

  class << self
    def lookup_translation(lookup_language, user_saying)
      if lookup_language == '1'
        Saying.where(english: user_saying).pluck(:german).first
      else
        Saying.where(german: user_saying).pluck(:english).first
      end
    end
  end
end
