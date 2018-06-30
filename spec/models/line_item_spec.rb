require 'rails_helper'

RSpec.describe LineItem, type: :model do
  let(:seller) { create(:user) }
  # let(:buyer) { create(:user)}
  let(:product) { create(:product, price: 100, seller: seller) }
  # let(:cart) { create(:cart, buyer: buyer) }

  describe '#product_price' do
    it 'calculates line_item\'s total price' do
      #line_item = create(:line_item, cart: cart, product: product, number: 3)
      line_item = build(:line_item, product: product, number: 3)
      expect(line_item.product_price).to eq(300)
    end
  end
end
