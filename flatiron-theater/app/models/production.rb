class Production < ApplicationRecord
    has_many :crew_members

    validates :title, presence: true

    def title_director
        "#{title}: #{director}"
    end
end
