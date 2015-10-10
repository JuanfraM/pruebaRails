class Article < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  validates :title, presence:true, length:{minimum:5}
  # before_save :set_title

  # def set_title
  #   self.title = 'titulo'
  # end

  def title_and_text
    title + text
  end
end
