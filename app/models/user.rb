class User < ApplicationRecord
  after_create :add_default_entities

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, presence: true
  validates :username, presence: true

  auto_strip_attributes :email, squish: true

  has_many :categories, dependent: :destroy
  has_many :tags, dependent: :destroy
  has_many :tasks, dependent: :destroy

  private

  def add_default_entities
    personalCategory = self.categories.create(title: "Osobní")
    schoolCategory = self.categories.create(title: "Škola")
    workCategory = self.categories.create(title: "Práce")

    # UCL, JSE, WEB, 3DT, PR1, PES, Nákupy a Wishlist
    uclTag = self.tags.create(title: "UCL")
    jseTag = self.tags.create(title: "JSE")
    webTag = self.tags.create(title: "WEB")
    printingTag = self.tags.create(title: "3DT")
    programmingTag = self.tags.create(title: "PR1")
    pesTag = self.tags.create(title: "PES")
    shoppingTag = self.tags.create(title: "Nákupy")
    wishlistTag = self.tags.create(title: "Wishlist")

    easyTask = self.tasks.create title: "Toto je jednoduchý úkol", is_done: false
    finishedTask = self.tasks.create title: "Toto je už dokončený úkol", is_done: true

    dinnerTask = self.tasks.create title: "Nakoupit na večeři", category: personalCategory
    dinnerTask.tags << shoppingTag

    schoolTask = self.tasks.create title: "Udělat semestrální práci z předmětu WEB", category: schoolCategory
    schoolTask.tags << uclTag
    schoolTask.tags << webTag
  end
end
