require 'spec_helper_bdd'
require_relative 'test_support/register'
require_relative 'test_support/fixture-register'
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

    scenario 'goes to second page' do
      next_step_title = "Elige tus datos de usuario"
      page = Page::Register.new

      page.fill('mail', 'name@email.com')
      page.go_next

      expect(page.has_title?(next_step_title)).to eq true
    end
  end

  context 'second page' do
    scenario 'allows next when required fields filled' do
      page = Fixture::Register.second_page

      expect(page.has_title?("Elige tus datos de usuario")).to eq true
      expect(page.next_button_disabled?).to be true

      page.fill('name', 'username')
      page.fill('password', 'secretpassword')

      expect(page.next_button_disabled?).to be false
    end

    scenario 'goes to third page' do
      next_step_title = "Completa tu perfil"
      page = Fixture::Register.second_page

      page.fill('name', 'Name')
      page.fill('password', 'secretpassword')
      page.go_next

      expect(page.has_title?(next_step_title)).to eq true
    end
  end

  context 'third page' do
    scenario 'goes to fourth page' do
      next_step_title = "Elige hasta 5 temas que te interesen"

      page = Fixture::Register.third_page

      expect(page.has_title?("Completa tu perfil")).to eq true
      expect(page.next_button_disabled?).to be false

      page.go_next

      expect(page.has_title?(next_step_title)).to be true
    end
  end

  context 'fourth page' do
    scenario 'has maximum selectable tags' do
      maximum_selectable_tags = 5
      page = Fixture::Register.fourth_page
      page.select_maximum_tags
      expect(page.has_maximum_selected_tags?).to be true
    end
  end

  context 'view' do
    scenario 'has all filled information', :wip do
      page = Fixture::Register.view

      expect(has_content?(Fixture::Register::EMAIL)).to be true
      expect(has_content?(Fixture::Register::NAME)).to be true
    end
  end
end
