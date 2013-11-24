
class Change_Machine
  def initialize
    @amt_due = 13.26
    @quarter = 25
    @dime = 10
    @nickel = 5
    @penny = 1
  end

  def due
    puts "Amount Due: #{@amt_due}"
  end

  def change
    while true
      puts "What did customer supply?"
      tender = gets.chomp
      # binding.pry
      if tender =~ /[A-Za-z]/
        puts "Invalid characters were found!"
      else
        tender = tender.to_f
        calc(tender)
        abort
      end
    end
  end

  def calc(amount)
    change_due = amount.to_f.round(2) - @amt_due.to_f.round(2)
    change_due = change_due.to_f.round(2)
    puts "The change due is #{change_due}"
    change_split(change_due)
    breakdown
  end

  def change_split(amt)
    amt = amt.to_s
    amt_arr = amt.split(".")
    amt_hash = {}
    amt_hash[:dollar] = amt_arr[0].to_i
    @dollars = amt_hash[:dollar]
    amt_hash[:cents] = amt_arr[1].to_i
    @quarters = (amt_hash[:cents].divmod(@quarter))[0]
    amt_hash[:cents] = amt_hash[:cents] - (@quarters * @quarter)
    @dimes = (amt_hash[:cents].divmod(@dime))[0]
    amt_hash[:cents] = amt_hash[:cents] - (@dimes * @dime)
    @nickels = (amt_hash[:cents].divmod(@nickel))[0]
    amt_hash[:cents] = amt_hash[:cents] - (@nickels * @nickel)
    @pennies = (amt_hash[:cents].divmod(@penny))[0]
    amt_hash[:cents] = amt_hash[:cents] - (@pennies * @penny)
  end

  def breakdown
    puts "You should issue:"
    puts "#{@dollars} dollars" if @dollars != 0
    puts "#{@quarters} quarters" if @quarters != 0
    puts "#{@dimes} dimes" if @dimes != 0
    puts "#{@nickels} nickels" if @nickels != 0
    puts "#{@pennies} pennies" if @pennies != 0
  end
end

cashier = Change_Machine.new
cashier.due
cashier.change


