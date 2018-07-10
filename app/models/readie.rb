class Readie < ApplicationRecord
  validates :token, presence: true, uniqueness: true

  before_validation :generate_token

  has_many :readie_reads, dependent: :destroy

  def read
    ReadieRead.create!(readie: self)
  end

  private

  def generate_token
    begin
      self.token = SecureRandom.urlsafe_base64(nil, false)
    end while Readie.exists?(token: token)
  end
end
