class Event < ApplicationRecord
    belongs_to :creator, class_name: "User"
    has_many :invitations
    has_many :attendees, through: :invitations

    scope :past, -> {where("date < ?",DateTime.now)}
    scope :future, -> {where("date >= ?",DateTime.now)}


    validates :title, presence: true
    validates :location, presence: true
    validates :date, presence: true
    validates :description, presence: true, length: {minimum: 10}
end
