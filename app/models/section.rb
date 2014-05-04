class Section < ActiveRecord::Base
    belongs_to :user
    belongs_to :section_type
end
