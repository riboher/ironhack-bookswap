class Reader < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "http://placehold.it/100x100"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  validates :avatar, presence: true
  validates :first_name, presence: true
  validates :postcode, presence: true
  has_many :books
end
