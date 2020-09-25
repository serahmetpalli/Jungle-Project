require 'rails_helper'

RSpec.feature "Visitor navigates to home page", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "As a user, you would be able to view product details of a product" do
   
    visit root_path
    product = page.find('article.product', match: :first)    
    product.find_link('Details').click
    expect(page).to have_content 'Description'
    # expect(page).to have_css 'article.product-detail'
    save_and_open_screenshot
  end

end