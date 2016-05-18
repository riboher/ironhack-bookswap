class Transaction < ActiveRecord::Base
  belongs_to :buyer, class_name: 'Reader'
  belongs_to :seller, class_name: 'Reader'
end
