require 'rails_helper'

RSpec.describe OrderCreator do
  before do
    @seller = create(:user)
    @product = create(:product, :published, seller: @seller, name: 'P1', quantity: 10, price: 500)
    @buyer = create(:user)
    @cart = create(:cart, buyer: @buyer)
    @line_item = create(:line_item, product: @product, cart: @cart, quantity: 6)
  end

  subject do
    OrderCreator.new(@buyer).call
  end

  context 'when there is not enough quantity' do
    before do
      @product.update(quantity: 5)
    end

    it 'raises an error' do
      expect(subject).to eq(nil)
    end
  end

  context 'when there is enough quantity' do
    it 'creates an order and calculate buyer and seller points' do
      expect{ subject }.to change{ Order.count }.from(0).to(1)
      expect(@buyer.reload.points).to eq(7000)
      expect(@seller.reload.points).to eq(12700)
      expect(@product.reload.quantity).to eq(4)
      expect(@buyer.reload.cart).to eq(nil)
    end
  end
end
