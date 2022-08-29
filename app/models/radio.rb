class Radio < ApplicationRecord

validates :name, presence: true, uniqueness: true
end
