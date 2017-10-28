class Ethic < ApplicationRecord
  belongs_to :user
  store_accessor :answers
  store_accessor :exercises
end
