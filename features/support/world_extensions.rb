module KnowsTheUserInterface
  class UserInterface
    include Capybara::DSL

    def withdraw_from(account, amount)
      Sinatra::Application.account = account
      visit '/'
      click_button "$#{amount}"
    end

    def check_balance(account)
      Sinatra::Application.account = account
      visit '/'
      click_button "Check Balance"
    end
  end

  def my_account
    @my_account ||= Account.new
  end

  def cash_slot
    Sinatra::Application.cash_slot
  end

  def teller
    @teller ||= UserInterface.new
  end
end

World(KnowsTheUserInterface)
