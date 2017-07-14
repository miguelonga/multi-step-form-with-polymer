module Fixture
  class Register
    extend Capybara::DSL

    EMAIL = 'name@email.com'
    NAME = 'Name'
    PASSWORD = 'secretpassword'

    class << self
      def initial_state
        Page::Register.new
      end

      def second_page
        page = initial_state
        page.fill('mail', EMAIL)
        page.go_next
        page
      end

      def third_page
        page = second_page
        page.fill('name', NAME)
        page.fill('password', PASSWORD)
        page.go_next
        page
      end

      def fourth_page
        page = third_page
        page.go_next
        page
      end

      def view
        page = fourth_page
        page.select_maximum_tags
        page.go_next
        page
      end
    end
  end
end
