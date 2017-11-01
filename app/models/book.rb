class Book < ApplicationRecord
  belongs_to :genre, optional: false
end
