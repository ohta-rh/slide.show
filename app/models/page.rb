class Page < ActiveRecord::Base
  belongs_to :slide
  scope :by_slide, lambda{|page| where(slide_id: page.slide_id) }

  validates :body, presence: true

  def next_page
    self.class.by_slide(self).where([" id > ? ", self.id]).order("id ASC").first
  end

  def current_page
    self
  end

  def prev_page
    self.class.by_slide(self).where([" id < ? ", self.id]).order("id DESC").first
  end

  def have_next?
    !next_page
  end

  def have_prev?
    !prev_page
  end
end
