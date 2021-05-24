class User < ApplicationRecord
  has_many :operations
  has_many :balances

  def balance
    balances.last&.amount
  end
end
