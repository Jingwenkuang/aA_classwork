require 'action_view'

class Cat < ApplicationRecord
    include ActionView::Helpers::DateHelper

    validates :birth_date, :color, :name, :sex, :description, presence: true
    validates :sex, inclusion: %w(M F)
    validates :color, inclusion: %w(black brown yellow white)

    def age
        time_ago_in_words(birth_date)
        #time_age_in_words(from_time)
    end

end
