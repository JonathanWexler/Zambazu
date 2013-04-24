class Question < ActiveRecord::Base
  attr_accessible :first, :fourth, :question, :second, :third
  has_many :options

  def answer
  end
end
 