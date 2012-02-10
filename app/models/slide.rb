class Slide < ActiveRecord::Base
  validates :title, :author, presence: true
  has_many :pages
end
