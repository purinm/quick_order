class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
#  has_many :purchases
#  has_many :tables
  
  validates :name, presence: true
  validates :phone_number, format: { with: /\A[0-9]{,11}\z/, message: 'ハイフン(-)を含めてください' }
  validates :password, presence: true, confirmation: true, length: { minimum: 6, message: '6文字以上入力してください' },
                      format: { with: /\A(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d]{6,}\z/,
                                 message: 'は英数字混合で入力してください' }


  def update_without_current_password(params, *options)
  params.delete(:current_password)

  if params[:password].blank? && params[:password_confirmation].blank?
    params.delete(:password)
    params.delete(:password_confirmation)
  end

  result = update_attributes(params, *options)
  clean_up_passwords
  result
end

end
