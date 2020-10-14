class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
         with_options presence: true do
          validates :nickname
          NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/
          validates_format_of :first_name, with: NAME_REGEX, message: "is invalid. Input full-width characters."
          validates_format_of :last_name, with: NAME_REGEX, message: "is invalid. Input full-width characters."

          NAME_KANA_REGEX = /\A[ァ-ヶー－]+\z/
          validates_format_of :first_name_kana, with: NAME_KANA_REGEX, message: "is invalid. Input full-width characters."
          validates_format_of :last_name_kana, with: NAME_KANA_REGEX, message: "is invalid. Input full-width characters."

          validates :birthday

          PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
          validates_format_of :password, with: PASSWORD_REGEX, message: "is invalid. Input half-size characters."

         end
 

         has_many :items
         has_many :purchases
end
