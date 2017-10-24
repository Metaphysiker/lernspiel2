class User < ApplicationRecord

  has_one :ethic
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable, :validatable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable


  # Execute this callback after an record is saved only on create
  after_save :create_and_associate_ethic, on: :create

  private

      def create_and_associate_ethic
       e = Ethic.new(user_id: self.id)
       e.save
      end

end
