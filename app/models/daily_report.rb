class DailyReport < ApplicationRecord
    has_many :comments
    belongs_to :user

    validates :date, presence: true
    validates :tire, presence: true, if: :scrim?
    validates :decide, presence: true, if: :scrim?
    validates :winround, presence: true, if: :scrim?
    validates :loseround, presence: true, if: :scrim?

  def scrim?
    title == "スクリム"
  end
end
