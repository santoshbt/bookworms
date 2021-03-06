class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable,
  :omniauthable, :omniauth_providers => [:facebook, :google_oauth2]

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true

  has_many :favorite_genres
  has_many :genres, through: :favorite_genres
  has_and_belongs_to_many :oauth_credentials
  has_many :ratings, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  # after_save ThinkingSphinx::RealTime.callback_for(:user)

  include Registrable

  end
