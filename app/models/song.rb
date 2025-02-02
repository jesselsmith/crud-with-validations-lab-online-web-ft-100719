class Song < ApplicationRecord
  validates :title, presence: true, uniqueness: {
    scope: [:artist_name, :release_year],
    message: "shouldn't duplicate titles by the same artist in the same year"
  }
  validates :released, inclusion: { in: [true, false] }
  validates :release_year,
            numericality: { less_than_or_equal_to: Time.now.year },
            if: :released
  validates :artist_name, presence: true
end
