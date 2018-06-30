require 'rails_helper'

RSpec.describe Cart, type: :model do
  let(:buyer) { create(:user) }
  let(:seller) { create(:user) }
  describe '#total_price' do
    before do
      @cart = create(:cart, buyer: buyer)
      product = create(:product, price: 100, seller: seller)
      product2 = create(:product, price: 200, seller: seller)
      create(:line_item, cart: @cart, product: product)
      create(:line_item, cart: @cart, number: 2, product: product2)
    end

    it 'calculates total price of all line_items in the cart' do
      expect(@cart.total_price).to eq(500)
    end
  end
end
