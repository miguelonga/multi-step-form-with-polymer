module Fixture
  class Register
    extend Capybara::DSL

    class << self
      def initial_state
        Page::Register.new
      end

      def second_page
        page = initial_state
        page.fill('mail', 'name@email.com')
        page.go_next
        page
      end
    end
  end
end
