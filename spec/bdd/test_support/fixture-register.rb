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

      def third_page
        page = second_page
        page.fill('name', 'Name')
        page.fill('password', 'secretpassword')
        page.go_next
        page
      end
    end
  end
end
