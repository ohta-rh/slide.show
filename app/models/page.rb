class Page < ActiveRecord::Base
  belongs_to :slide

  validates :body, presence: true

  def next_page
    self.class.where([" id > ? ", self.id]).first
  end

  def current_page
    self
  end

  def prev_page
    self.class.where([" id < ? ", self.id]).first
  end

  def have_next?
    !next_page
  end

  def have_prev?
    !prev_page
  end
end
