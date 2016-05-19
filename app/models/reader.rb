class Reader < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "150x150>" }, default_url: "https://robohash.org/profile.png?size=300x300"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  validates :first_name, presence: true
  validates :postcode, presence: true
  has_many :books
  has_many :transactions

  def has_credit?(book)
    self.credit > book.price
  end
end
