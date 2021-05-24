class Operation < ApplicationRecord
  belongs_to :user
  enum operation_type: { replenishment: 0, write_off: 1 }

  before_save :create_balance_record

  def create_balance_record
    puts "bla = #{inspect}"
    puts "user_id = #{user_id}"
    last_amount = Balance.where(user_id: user_id).last&.amount
    balance = Balance.new(user_id: user_id)
    puts "last_amount = #{last_amount}"
    if last_amount
      case operation_type
      when "replenishment"
        balance.amount = last_amount + value
      when "write_off"
        balance.amount = last_amount - value
      end
    else
      case operation_type
      when "replenishment"
        balance.amount = value
      when "write_off"
        balance.amount = value * -1
      end
    end

    balance.save
    
  end


end
