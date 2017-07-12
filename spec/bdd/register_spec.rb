require 'spec_helper_bdd'
require_relative 'test_support/register'
require_relative '../../app'

feature 'Register' do
  context 'first page' do
    scenario 'allows next when required fields filled' do
      step_title = "Regístrate"
      page = Page::Register.new

      expect(page.has_title?(step_title)).to eq true
      expect(page.next_button_disabled?).to be true

      page.fill('mail', 'name@email.com')

      expect(page.next_button_disabled?).to be false
    end

    scenario 'allows next when required fields filled' do
      next_step_title = "Elige tus datos de usuario"
      page = Page::Register.new

      page.fill('mail', 'name@email.com')
      page.go_next

      expect(page.has_title?(next_step_title)).to eq true
    end
  end
end
