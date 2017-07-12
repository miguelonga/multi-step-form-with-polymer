module Page
  class Register
    include Capybara::DSL

    def initialize
      url = '/home.html'
      visit(url)
      validate!
    end

    def fill(field, content)
      fill_in(field, with: content)
    end

    def next_button_disabled?
      has_css?('.next-page[disabled]')
    end

    def has_title?(title)
      has_content?(title)
    end

    def go_next
      find('.next-page').click
    end

    private

    def validate!
      page.assert_selector('#register-form')
      page.assert_selector('.next-page[disabled]')
    end
  end
end
